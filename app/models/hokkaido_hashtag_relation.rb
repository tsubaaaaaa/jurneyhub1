class HokkaidoHashtagRelation < ApplicationRecord
  belongs_to :hokkaido

  belongs_to :hashtag


  with_options presence: true do
    validates :hokkaido_id
    validates :hashtag_id
  end
end
