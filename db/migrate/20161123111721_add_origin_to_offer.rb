class AddOriginToOffer < ActiveRecord::Migration[5.0]
	def up
		add_column :offers, :origin, :string
		add_column :offers, :destination, :string
	end

  def down
    remove_column :offers, :origin
    remove_column :offers, :destination
  end
end
