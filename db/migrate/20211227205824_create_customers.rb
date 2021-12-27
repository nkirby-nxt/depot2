class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :street
      t.string :state
      t.string :zip
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
