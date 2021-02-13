class RecordAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :phone_number, :building_name, :item_id, :user_id, :record_id

  with_options presence: true do
    validates :city
    validates :address
    validates :building_name
    validates :user_id
    validates :item_id
    validates :record_id
    validates :phone_number numericality: {with: /\A\d{7}\z/, message: "Input only number"}
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly"}
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "Select"}
  
end