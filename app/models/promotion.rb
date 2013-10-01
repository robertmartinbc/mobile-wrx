class Promotion < ActiveRecord::Base
  attr_accessible :description, :expiration, :price, :qrcode, :title, :website, :image

  belongs_to :user

  mount_uploader :image, ImageUploader

  default_scope order('created_at DESC')
end
