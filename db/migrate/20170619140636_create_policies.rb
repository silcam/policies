class CreatePolicies < ActiveRecord::Migration[5.1]
  def change
    create_table :policies do |t|
      t.integer :number
      t.references :provider
      t.string :category
      t.string :alias
      t.string :client_name
      t.string :client_email
      t.integer :account
      t.date :in_force
      t.date :last_change
      t.date :last_renew

      t.timestamps
    end
  end
end
