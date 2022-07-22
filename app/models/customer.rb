class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :order_addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :surname, presence: true
  validates :name, presence: true
  validates :surname_kana, presence: true
  validates :name_kana, presence: true
  validates :post, presence: true
  validates :address, presence: true
  validates :tel, presence: true
  validates :email, presence: true


end
