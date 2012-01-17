require 'rinku'

module WhurlEngine
  class ApplicationController < ::ApplicationController
    before_filter :_authorize!

    helper_method :_current_user

    rescue_from CanCan::AccessDenied do |e|
      p "2" * 100
      p e.action
      p e.subject
    end

    private

    def _authorize!
      instance_eval &WhurlEngine::Config.authorize_with
    end

    def _current_user
      instance_eval &WhurlEngine::Config.current_user_method
    end
  end
end
