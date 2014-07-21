class AddSocialIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :social_id, :string
  end
end
