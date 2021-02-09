# == Schema Information
#
# Table name: items
#
#  id                 :integer          not null, primary key
#  name               :string
#  text               :text
#  price              :integer
#  image              :string
#  state              :string
#  region             :string
#  saler_id           :integer
#  buyer_id           :integer
#  shipping_date      :string
#  shipping_method    :string
#  shipping_charge    :string
#  which_sold_item    :string
#  tradind            :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  buyed_or_sold_time :datetime
#
require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
