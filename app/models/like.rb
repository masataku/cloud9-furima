# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  item_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Like < ApplicationRecord
  default_scope->{order(created_at: :desc)}
  belongs_to :user
  belongs_to :item
  
  validates :user_id && :item_id, uniqueness: true
end
