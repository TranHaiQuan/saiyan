class CustomerConstraint
  class << self
    def matches? request
      customer_request?(request) || redirect_to_staff_root?(request)
    end

    private
    def customer_request? request
      !request.subdomain.to_s.start_with?("admin", "staff")
    end

    def redirect_to_staff_root? request
      request.subdomain.start_with?("staff") && request.path == "/"
    end
  end
end
