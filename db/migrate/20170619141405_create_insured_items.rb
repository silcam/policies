class CreateInsuredItems < ActiveRecord::Migration[5.1]
  def change
    create_table :insured_items do |t|
      t.string :description
      t.string :serial
      t.decimal :covered_value, precision: 2
      t.date :added_to_policy
      t.references :policy

      t.timestamps
    end
  end
end
