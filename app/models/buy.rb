class Buy < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :history
  belongs_to_active_hash :shipping_area
end

