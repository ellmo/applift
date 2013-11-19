class Gadget < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name

  validates :user, presence: true
end
