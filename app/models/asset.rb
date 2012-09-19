class Asset < ActiveRecord::Base
  belongs_to :ticket
  has_attached_file :asset
  attr_accessible :asset
end
