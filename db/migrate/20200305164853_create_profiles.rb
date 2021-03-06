class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :player_class
      t.string :city
      t.string :state
      t.string :zip
      t.string :contact_email
      t.text :description
      t.timestamps
    end
  end
end
