# == Schema Information
#
# Table name: items
#
#  id              :integer          not null, primary key
#  name            :string
#  text            :text
#  price           :integer
#  image           :string
#  state           :string
#  region          :string
#  saler_id        :integer
#  buyer_id        :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  shipping_date   :string
#  shipping_method :string
#  shipping_charge :string
#
class Item < ApplicationRecord
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, optional: true, class_name: "User"
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :name, :text, :price, :image, :region, :state, :shipping_charge, :shipping_method, :shipping_date, presence: true
  validates :price, numericality: {greater_than: 299, less_than: 10000000, only_integer: true}
  validates :name, length: {maximum: 40}
  validates :text, length: {maximum: 1000}
  
  
end
