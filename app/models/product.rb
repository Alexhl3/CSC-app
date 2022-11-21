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

  PRODUCT_STATUS = {
    new: 'true',
    old: 'false'
  }

  def discount_price(price = self.price , discount_percent = self.discount_percent)
    price - (price*discount_percent/100)
  end

  def sum_iva
    if iva_status
      (price*1.19).round
    else
      price
    end
  end


  has_one_attached :photo
  has_many_attached :images
  has_many :favorites, dependent: :destroy
  has_rich_text :description

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, inclusion: 1..2147483647
  validates :photo, presence: true
  validates :images, presence: true
  validates_length_of :images, maximum: 4


  belongs_to :category
  belongs_to :user, default: -> { Current.user }
end
