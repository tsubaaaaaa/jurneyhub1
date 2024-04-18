class User < ApplicationRecord
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :hokkaidos

  #LIKE Functions
  has_many :likes, dependent: :destroy
  has_many :liked_hokkaidos, through: :likes, source: :hokkaido
  def already_liked?(hokkaido)
    self.likes.exists?(hokkaido_id: hokkaido.id)
  end

  #コメント機能
  has_many :comments, dependent: :destroy


  has_many :hokkaidos, dependent: :destroy #追記 ユーザーが削除されたら、ツイートも削除されるようになります。すでに書いてある場合は追記しなくて大丈夫です。
  validates :name, presence: true #追記
  validates :profile, length: { maximum: 200 } #追記
end
