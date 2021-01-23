class OrderForm
  include ActiveModel::Model
  attr_accessor :price, :token, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :user_id, :item_id 

  with_options presence: true do
    validates :token
    validates :postcode
    validates :city
    validates :block
    validates :phone_number
  end

  validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :phone_number, format: { with: /\A[0-9]{10,11}\z/ }
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end

end