class Item < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :description
    validates :image
    validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
    validates :price,
              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
  end

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :fee_id
    validates :shipping_date_id
    validates :from_id
    validates :state_id
  end

  belongs_to :user
  has_one :record
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :fee
  belongs_to :ShippingDate
  belongs_to :from
  belongs_to :state
end
