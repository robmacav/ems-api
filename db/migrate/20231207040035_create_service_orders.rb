class CreateServiceOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :service_orders do |t|
      t.string :description
      t.text :details
      t.string :start_date, limit: 8
      t.string :end_date, limit: 8
      t.integer :status
      t.references :device, null: false, foreign_key: true

      t.timestamps
    end
  end
end
