class Item < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :description
    validates :image
    validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
  end

  validates :category_id, numericality: { other_than: 1, message:'Select'}
  validates :fee_id, numericality: { other_than: 1, message:'Select'}
  validates :shipping_date_id, numericality: { other_than: 1, message:'Select'}
  validates :from_id, numericality: { other_than: 1, message:'Select'}
  validates :state_id, numericality: { other_than: 1, message:'Select'}

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :fee
  belongs_to :ShippingDate
  belongs_to :from
  belongs_to :state
end
