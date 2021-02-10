class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, with: PASSWORD_REGEX 
  validates :nickname, presence: true
  validates :first_name, presence: true, with: /\A[ぁ-んァ-ン一-龥]/
  validates :last_name, presence: true, with: /\A[ぁ-んァ-ン一-龥]/
  validates :first_furigana, presence: true, with: /\A[ァ-ヶー－]+\z/
  validates :last_furigana, presence: true, with: /\A[ァ-ヶー－]+\z/
  validates :birthday, presence: true
end
