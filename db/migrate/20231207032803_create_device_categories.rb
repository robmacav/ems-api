class CreateDeviceCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :device_categories do |t|
      t.string :description

      t.timestamps
    end
  end
end
