# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  email       :string(255)
#  description :text
#  avatar      :string(255)
#  joind_on    :date
#  group_id    :integer
#  role_id     :integer
#  office_id   :integer
#  project_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
