# == Schema Information
# Schema version: 20090525203200
#
# Table name: lists
#
#  id          :integer(4)      not null, primary key
#  title       :string(255)
#  description :text
#  user_id     :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

class List < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :user_id
  belongs_to :user
  has_many :list_items
end
