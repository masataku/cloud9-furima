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
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
