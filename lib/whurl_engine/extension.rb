module WhurlEngine
  EXTENSIONS = []
  AUTHORIZATION_ADAPTERS = {}

  # Extend WhurlEngine
  #
  # The extension may define various adapters (e.g., for authorization) and
  # register those via the options hash.
  def self.add_extension(extension_key, extension_definition)
    EXTENSIONS << extension_key
    AUTHORIZATION_ADAPTERS[extension_key] = extension_definition::AuthorizationAdapter
  end
end
