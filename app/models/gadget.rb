class Gadget < ActiveRecord::Base
  attr_accessible :name, :user_id

  belongs_to :user
  has_many :images

  validates :user, presence: true
end
