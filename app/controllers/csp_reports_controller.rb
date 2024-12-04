class CspReportsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    report = request.body.read

    Rails.logger.info("CSP violation: #{report}")

    head :no_content
  end
end
