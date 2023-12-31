class CreateAdresses < ActiveRecord::Migration[7.0]
  def change
    create_table :adresses do |t|
      t.string :street_name
      t.integer :number
      t.string :neighborhood
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
