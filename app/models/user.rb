class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birth_date, presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
   validates :first_name
   validates :last_name
  end

   with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/ } do
   validates :firstkana_name
   validates :lastkana_name
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
   validates_format_of :password, with: PASSWORD_REGEX 

  has_many :items
  # has_many :purchases
end
