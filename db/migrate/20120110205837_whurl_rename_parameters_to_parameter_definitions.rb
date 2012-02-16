class WhurlRenameParametersToParameterDefinitions < ActiveRecord::Migration
  def change
    rename_table :whurl_engine_parameters, :whurl_engine_parameter_definitions
  end
end
