class Item < ApplicationRecord
  with_options extend ActiveHash::Associations::ActiveRecordExtensions do
    belongs_to :category
    belongs_to :item_condition
    belongs_to :shipping_charge
    belongs_to :shipping_area
    belongs_to :days_to_ship
  end
  with_options presence: true do
    validates :name
    validates :text
    validates :price
    validates :image
  end
  with_options numericality: { other_than: 1 }  do
    validates :category_id
    validates :item_condition_id
    validates :shipping_charges_id
    validates :shipping_area_id
    validates :days_to_ship_id
  end

  has_one_attached :image

end
