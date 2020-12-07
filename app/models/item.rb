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
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :burden_id, presence: true
  validates :prefecture_id, presence: true
  validates :day_id, presence: true
  validates :price, presence: true
  validates :image, presence: true

  validates :prefecture_id, numericality: { other_than: 1 }
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :burden_id, numericality: { other_than: 1 }
  validates :day_id, numericality: { other_than: 1 }

  validates :price, format: { with: /\A[0-9]+\z/}

  validates :price, :numericality => { :greater_than_or_equal_to => 300 }
  validates :price, :numericality => { :less_than_or_equal_to => 9999999 }

  belongs_to :user
end
