class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :text
    validates :price
    validates :image
  end

  validates :price, format: { with:/\A[0-9]+\z/, message: 'には半角数字を使用してください' }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  
  with_options numericality: { other_than: 1 }  do
    validates :category_id
    validates :item_condition_id
    validates :shipping_charges_id
    validates :shipping_area_id
    validates :days_to_ship_id
  end


  belongs_to :user
  has_one_attached :image

  with_options extend ActiveHash::Associations::ActiveRecordExtensions do
    belongs_to :category
    belongs_to :item_condition
    belongs_to :shipping_charge
    belongs_to :shipping_area
    belongs_to :days_to_ship
  end
end
