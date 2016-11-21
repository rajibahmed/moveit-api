class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
      t.string :email, null: false, index: true
      t.decimal :distance, null: false
      t.decimal :living_space, default: 0
      t.decimal :attic, default: 0
      t.decimal :celler, default: 0
      t.boolean :has_piano, default: false

      t.timestamps
    end
  end
end
