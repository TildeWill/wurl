class String
  def pluralize(count = nil)
    if count == 1
      self
    else
      ActiveSupport::Inflector.pluralize(self)
    end
  end

  def headerize
    split(/-/).map {|s| s.capitalize }.join('-')
  end
end