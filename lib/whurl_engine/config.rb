#much lifted from RailsAdmin https://github.com/sferik/rails_admin
module WhurlEngine
  module Config

    DEFAULT_AUTHORIZE = Proc.new {}

    DEFAULT_CURRENT_USER = Proc.new do
      request.env["warden"].try(:user) || respond_to?(:current_user) && current_user
    end

    class << self
      # Setup authorization to be run as a before filter
      # This is run inside the controller instance so you can setup any authorization you need to.
      #
      # By default, there is no authorization.
      #
      # @example Custom
      #   WhurlEngine.config do |config|
      #     config.authorize_with do
      #       redirect_to root_path unless warden.user.is_admin?
      #     end
      #   end
      #
      # To use an authorization adapter, pass the name of the adapter. For example,
      # to use with CanCan[https://github.com/ryanb/cancan], pass it like this.
      #
      # @example CanCan
      #   WhurlEngine.config do |config|
      #     config.authorize_with :cancan
      #   end
      #
      # See the wiki[https://github.com/sferik/rails_admin/wiki] for more on authorization.
      #
      # @see WhurlEngine::Config::DEFAULT_AUTHORIZE
      def authorize_with(*args, &block)
        extension = args.shift
        if(extension)
          @authorize = Proc.new {
            @authorization_adapter = WhurlEngine::AUTHORIZATION_ADAPTERS[extension].new(*([self] + args).compact)
          }
        else
          @authorize = block if block
        end
        @authorize || DEFAULT_AUTHORIZE
      end

      # Setup a different method to determine the current user or admin logged in.
      # This is run inside the controller instance and made available as a helper.
      #
      # By default, _request.env["warden"].user_ or _current_user_ will be used.
      #
      # @example Custom
      #   WhurlEngine.config do |config|
      #     config.current_user_method do
      #       current_admin
      #     end
      #   end
      #
      # @see WhurlEngine::Config::DEFAULT_CURRENT_USER
      def current_user_method(&block)
        @current_user = block if block
        @current_user || DEFAULT_CURRENT_USER
      end
    end
  end
end