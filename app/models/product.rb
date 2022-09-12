class Product < ApplicationRecord
  include PgSearch::Model
  include Favoritable

  pg_search_scope :search_full_text, against: [:title],using: {
    tsearch: {
      prefix: true,
      negation: true
    }
  }

  ORDER_BY = {
    newest: 'created_at DESC',
    expensive: 'price DESC',
    cheapest: 'price ASC'
  }

  has_one_attached :photo
  has_many_attached :images
  has_many :favorites, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :photo, presence: true

  belongs_to :category
  belongs_to :user, default: -> { Current.user }
end
