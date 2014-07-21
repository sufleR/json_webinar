class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :type
      t.json :custom_fields

      t.timestamps
    end
  end
end
