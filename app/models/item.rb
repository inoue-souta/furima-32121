class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :day

  validates :product, presence: true
  validates :explanation, presence: true
  validates :price, presence: true
  validates :image, presence: true

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :prefecture_id
    validates :day_id
  end

  validates :price, format: { with: /\A[0-9]+\z/}

  validates :price, :numericality => { :greater_than_or_equal_to => 300 }
  validates :price, :numericality => { :less_than_or_equal_to => 9999999 }

  belongs_to :user
end
