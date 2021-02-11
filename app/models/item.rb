class Item < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :description
    validates :price, format: { with: /\A[0-9]+\z/, message: "Price Half-width number" }, numericality: { only_integer: true, greater_than: 300, less_than: 9999999 , message: "Price Out of setting range"}
  end

  validates :category_id, numericality: { other_than: 1 }
  validates :fee_id, numericality: { other_than: 1 }
  validates :shipping_date_id, numericality: { other_than: 1 }
  validates :from_id, numericality: { other_than: 1 }
  validates :state_id, numericality: { other_than: 1 }

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :fee
  belongs_to :ShippingDate
  belongs_to :from
  belongs_to :state
end
