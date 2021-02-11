class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: PASSWORD_REGEX, message: 'Include both letters and numbers' }

  with_options presence: true do
    validates :nickname
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'Full-width characters' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'Full-width characters' }
    validates :first_furigana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' }
    validates :last_furigana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' }
    validates :birthday
  end

  has_many :items
end
