class Asset < ActiveRecord::Base
  belongs_to :ticket
  #has_attached_file :asset, :path => "files/:id" # or you can pass :url => "/files/:id" as an alternative to :path
  has_attached_file :asset, :path => :asset_path
  attr_accessible :asset

  private
  def asset_path
    "files/#{ticket.id}/:attachment/:style/:filename"
  end
end