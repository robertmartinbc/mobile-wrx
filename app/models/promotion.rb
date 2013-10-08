class Promotion < ActiveRecord::Base
  attr_accessible :description, :expiration, :price, :qrcode, :title, :website, :image

  belongs_to :user

  mount_uploader :image, ImageUploader
  mount_uploader :qrcode, QrcodeUploader

  default_scope order('created_at DESC')

  scope :visible_to, lambda { |user| user ? scoped : joins(:promotion).where('promotions.public' => true) }
end
