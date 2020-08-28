# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  image      :string
#  text       :text
#  point      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  password   :string
#
class User < ApplicationRecord
  has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item", dependent: :destroy
  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :sold_items, -> { where("buyer_id is not Null") }, foreign_key: "saler_id", class_name: "Item"
  has_many :likes, dependent: :destroy
  has_many :like_items, through: :likes, source: :item
  has_many :comments, dependent: :destroy
  validates :name, :password, presence: true
  validates :email, presence: true, uniqueness: true
  validates :text, length:{maximum: 100}
  
 
end
