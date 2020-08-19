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
require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end