class TwitterUser < User

  #this is only example since we have identifier in social_id
  def identifier
    custom_fields_object.id
  end

  def self.new_by_hash(data)
    new(name: data[:username], social_id: data[:id], custom_fields: data.except(:id, :username))
  end
end
