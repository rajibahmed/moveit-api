class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
      t.string :email
      t.string :distance
      t.string :attic
      t.string :celler
      t.boolean :has_piano

      t.timestamps
    end
  end
end
