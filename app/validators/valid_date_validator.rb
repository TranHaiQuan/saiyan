class ValidDateValidator < ActiveModel::EachValidator
  DATE_FORMAT_REGEX = /^\s*(3[01]|[12][0-9]|0?[1-9])\/(1[012]|0?[1-9])\/((?:19|20)\d{2})\s*$/
  def validate_each record, attribute, _value
    records = if record.is_a?(ActiveRecord::Base)
                record.attributes_before_type_cast
              else
                record.as_json
              end
    attribute = attribute.to_s

    return if records[attribute].blank? || !records[attribute].is_a?(String)
    record.errors.add(attribute, (options[:message] || :invalid_date_format)) if
      (records[attribute].to_s.match DATE_FORMAT_REGEX).blank?
  end
end
