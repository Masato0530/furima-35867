class HistoryBuy
  include ActiveModel::Model
  attr_accessor :post_code, :shipping_area_id, :city, :address, :building, :phone_number, :item_id ,:user_id, :token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :user_id
    validates :address
    validates :token
    validates :item_id
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid."}
  end
    validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }
  
    def save
      history = History.create(user_id: user_id, item_id: item_id)
      Buy.create(post_code: post_code,  shipping_area_id: shipping_area_id, city: city, address: address, building: building, phone_number: phone_number, history_id: history.id)
    end
end