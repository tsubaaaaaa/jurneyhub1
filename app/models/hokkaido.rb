class Hokkaido < ApplicationRecord

  belongs_to :user

  before_create :set_address

  geocoded_by :name
  after_validation :geocode, if: :name_changed?

  mount_uploader :image, ImageUploader
# 追記ここまで

#LIKE
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user


#コメント機能
  has_many :comments, dependent: :destroy

# 省略

  has_many :hokkaido_hashtag_relations
  has_many :hashtags, through: :hokkaido_hashtag_relations, dependent: :destroy

  #DBへのコミット直前に実施する
  after_create do
    hokkaido = Hokkaido.find_by(id: self.id)
    hashtags  = self.body.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hokkaido.hashtags = []
    hashtags.uniq.map do |hashtag|
      #ハッシュタグは先頭の'#'を外した上で保存
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      hokkaido.hashtags << tag
    end
  end

  before_update do
    hokkaido = Hokkaido.find_by(id: self.id)
    results = Geocoder.search([latitude, longitude], language: :ja)
    if results.present?
      self.address = results.first.address
    else
      self.address = "住所が見つかりませんでした"
    end
    hokkaido.hashtags.clear
    hashtags  = self.body.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hokkaido.hashtags = []
    hashtags.uniq.map do |hashtag|
      #ハッシュタグは先頭の'#'を外した上で保存
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      hokkaido.hashtags << tag
    end
  end
  #def find_address(latitude, longitude)
  #  results = Geocoder.search([latitude, longitude], language: :ja)
  #  if results.present?
  #    return results.first.address
  #  else
  #    return "住所が見つかりませんでした"
  #  end
  #end

  #def update_address_in_database(hokkaido_id)
  #  hokkaido = Hokkaido.find(hokkaido_id)
  #  address = hokkaido.find_address(hokkaido.latitude, hokkaido.longitude)
  #  hokkaido.update(address: address)
  #end


  private

  def set_address
  #  return if latitude.blank? || longitude.blank?
    results = Geocoder.search([latitude, longitude], language: :ja)
    if results.present?
      self.address = results.first.address
    else
      self.address = "住所が見つかりませんでした"
    end
  end

end
