class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions 

    belongs_to :category
    belongs_to :shipping_fee
    belongs_to :state
    belongs_to :prefecture
    belongs_to :shipping_day
    belongs_to :user
    #has_one :purchase

    has_one_attached :image

    validates :image, presence: true
    validates :item_name, presence: true
    validates :item_explanation, presence: true
    validates :category_id, numericality: { other_than: 1 } 
    validates :state_id, numericality: { other_than: 1 } 
    validates :shipping_fee_id, numericality: { other_than: 1 } 
    validates :prefecture_id, numericality: { other_than: 1 } 
    validates :shipping_day_id, numericality: { other_than: 1 }
    #validates :price, numericality: { only_integer: true, greather_than_or_equal_to: 299, less_than_or_equal_to: 9999999 }
    with_options presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 } do
        validates :price
      end
end
