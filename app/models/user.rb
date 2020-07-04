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
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :text, length:{maximum: 100}
end
