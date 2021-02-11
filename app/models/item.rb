class Item < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :description
    validates :category_id
    validates :state_id
    validates :price, format: { with: /\A[0-9]+\z/, message: "Price Half-width number" }, numericality: { only_integer: true, greater_than: 300, less_than: 9999999 , message: "Price Out of setting range"}
    validates :from_id
    validates :shipping_date_id
    validates :fee_id
  end

  belongs_to :user
end
