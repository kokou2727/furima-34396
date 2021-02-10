class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze

  validates :password, format: { with: PASSWORD_REGEX, message: "test" }
  validates :nickname, presence: true
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "test" }
  validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "test" }
  validates :first_furigana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "test" }
  validates :last_furigana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "test" }
  validates :birthday, presence: true
end
