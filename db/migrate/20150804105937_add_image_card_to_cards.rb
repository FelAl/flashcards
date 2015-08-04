class AddImageCardToCards < ActiveRecord::Migration
  def change
    add_column :cards, :image_card, :string
  end
end
