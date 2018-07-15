class FormatRuleValidator < ActiveModel::EachValidator
  def validate_each record, attribute, value
    return if value.blank? || value.to_s.match(Settings.regex.admin[attribute])
    record.errors.add(attribute, (options[:message] || :wrong_format))
  end
end
