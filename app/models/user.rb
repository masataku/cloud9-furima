# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  name               :string
#  email              :string
#  image              :string
#  text               :text
#  point              :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  password           :string
#発送元・お届け先住所
#  first_name         :string
#  last_name          :string
#  first_reading      :string
#  last_reading       :string
#  postal_code        :integer
#  prefecture         :string
#  municipality       :string
#  address            :string
#  building_name      :string
#  phone_number       :integer
#############################
#本人情報
#  real_name          :string
#  real_reading       :string
#  birthday           :string
#  real_postal_code   :integer
#  real_prefecture    :string
#  real_municipality  :string
#  real_address       :string
#  real_building_name :string
#
class User < ApplicationRecord
  has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item", dependent: :destroy
  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :sold_items, -> { where("buyer_id is not Null") }, foreign_key: "saler_id", class_name: "Item"
  has_many :likes, dependent: :destroy
  has_many :like_items, through: :likes, source: :item
  has_many :comments, dependent: :destroy
  has_many :active_notifications, class_name: "Notification", foreign_key: "sender_id", dependent: :destroy #自分が作った通知
  has_many :passive_notifications, class_name: "Notification", foreign_key: "receiver_id", dependent: :destroy #自分宛の通知
  
  validates :name, :password, presence: true
  validates :email, presence: true, uniqueness: true
  validates :text, length: {maximum: 500}
  # validates :postal_code, length: {is: 7}
 
end
