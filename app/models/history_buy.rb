class HistoryBuy
  include ActiveModel::Model
  attr_accessor :user_id, :post_code, :shipping_area_id, :city, :address, :building, :phone_number, :history_id

  with_options presence: true do
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :shipping_area_id, numericality: {other_than: 0, message: "can't be blank"}
  
end