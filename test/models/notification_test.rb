# == Schema Information
#
# Table name: notifications
#
#  id          :integer          not null, primary key
#  sender_id   :integer
#  receiver_id :integer
#  comment_id  :integer
#  action      :string
#  checked     :boolean          default(FALSE), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  item_id     :integer
#
require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
