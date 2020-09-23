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
class Notification < ApplicationRecord
  default_scope->{order(created_at: :desc)}
  
  belongs_to :item, optional: true
  belongs_to :comment, optional: true
  belongs_to :sender, class_name: "User", optional: true
  belongs_to :receiver, class_name: "User", optional: true
  
end
