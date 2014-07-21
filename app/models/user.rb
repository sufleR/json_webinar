class User < ActiveRecord::Base

  # be carefull about validations - not all of them are working
  validates :custom_fields, presence: true, length: { maximum: 4 }
  #valiadates_uniqueness_of :custom_fields #it doesn't work

  def custom_fields_object
    @custom_fields_object ||= Hashie::Mash.new custom_fields
  end

  def self.create_by_hash!(data)
      new_by_hash(data).save!
  end

  def self.create_by_hash(data)
      new_by_hash(data).save
  end

end
