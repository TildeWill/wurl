class DefaultValuesForQueryAndHeaders < ActiveRecord::Migration
  def up
    WhurlEngine::Request.all.each do |request|
      request.query = {} if request.query.blank?
      request.headers = {} if request.headers.blank?
      request.save
    end
  end

  def down
  end
end
