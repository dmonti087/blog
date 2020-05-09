class Order < ApplicationRecord

  validates :product_name, presence: true
  validates :product_count,  presence: true
  validates :product_count, numericality: { only_integer: true }
  validates :customer_id, presence: true

  validates_presence_of :customer

  belongs_to :customer
end
