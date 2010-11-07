# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
#  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :adjust_format_for_iphone
  before_filter :redirect_to_ssl
  private

  def adjust_format_for_iphone
    if request.env["HTTP_USER_AGENT"] && request.env["HTTP_USER_AGENT"][/(iPhone|iPod)/]
      request.format = :iphone
    end
  end

  def redirect_to_ssl
    redirect_to :protocol => "https://" unless (request.ssl? || local_request?)
  end

# Scrub sensitive parameters from your log
# filter_parameter_logging :password
end
