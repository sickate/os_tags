class User < ActiveRecord::Base
  acts_as_taggable_on :skills, :units, :tags

  belongs_to :group
end
