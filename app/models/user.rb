class User < ActiveRecord::Base
  acts_as_taggable_on :skills, :clients, :prospects, :tags

  belongs_to :group

  def self.search(search)
    User.where("name LIKE  ? OR email like ?", "%#{search}%","%#{search}%")
  end
end
