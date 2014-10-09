# == Schema Information
#
# Table name: filters
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  group_id   :integer
#  project_id :integer
#  office_id  :integer
#  role_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Filter < ActiveRecord::Base
end
