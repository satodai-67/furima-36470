class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :municipalities, :house_number, :building_name,
                :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :municipalities
    validates :house_number
    validates :phone_number
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities,
                   house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end
