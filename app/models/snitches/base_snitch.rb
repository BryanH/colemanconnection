class Snitches::BaseSnitch < Struct.new(:model, :user)
  
  def self.filter_attrs(*attrs)
    @ignored_attributes = attrs
  end
  
  def self.ignored_attributes
    @ignored_attributes || []
  end

private

  def filtered_attributes
    model.changes.reject { |k, v| self.class.ignored_attributes.include?(k.to_sym) }
  end

  def changed_attributes
    filtered_attributes.map do |attribute, changes|
      "#{attribute.humanize} changed from <span class='audit-old-value'>#{changes.first}</span> to <span class='audit-new-value'>#{changes.last}</span>"
    end.join(', ')
  end
  
end