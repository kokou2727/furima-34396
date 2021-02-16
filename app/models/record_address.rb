class RecordAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :phone_number, :building_name, :item_id, :user_id, :record_id, :token

  with_options presence: true do
    validates :city
    validates :address
    validates :user_id
    validates :item_id
    validates :token
    validates :phone_number, format: {with: /\A\d{11}\z/, message: "Input only number"}
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly"}
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "Select"}

  def save
    record = Record.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, phone_number: phone_number, building_name: building_name, address: address, record_id: record.id)
  end
end