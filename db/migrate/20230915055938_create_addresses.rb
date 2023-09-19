class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.integer :region_id,            null: false
      t.string :post_cord,             null: false
      t.string :city,                  null: false
      t.string :street,                null: false
      t.string :building
      t.string :telephone,             null: false
      t.references :purchase_record,   null: false, foreign_key: true
      t.timestamps
    end
  end
end
