class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :history
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :products_status
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :condition


  with_options presence: true do
    validates :name
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :products_status_id
    validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9999999 }
    validates :description
    validates :image
  end 

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :products_status_id
  end

end