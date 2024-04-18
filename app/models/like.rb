class Like < ApplicationRecord
  belongs_to :hokkaido
  belongs_to :user

  validates_uniqueness_of :hokkaido_id, scope: :user_id
  validates :user_id, {presence: true}
  validates :hokkaido_id, {presence: true}
end
