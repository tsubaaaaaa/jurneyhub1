class Hashtag < ApplicationRecord
  validates :hashname, presence: true, length: { maximum:99}

  has_many :hokkaido_hashtag_relations, dependent: :destroy

  has_many :hokkaidos, through: :hokkaido_hashtag_relations, dependent: :destroy
end
