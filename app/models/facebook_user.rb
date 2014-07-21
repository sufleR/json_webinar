class FacebookUser < User

  #this is only example since we have identifier in social_id
  def identifier
    custom_fields_object.identifier
  end

  def self.new_by_hash(data)
    new(name: data[:name], social_id: data[:id], custom_fields: data.except(:name, :id))
  end

end
