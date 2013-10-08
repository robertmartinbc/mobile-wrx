class Promotion < ActiveRecord::Base
  attr_accessible :description, :expiration, :price, :qrcode, :title, :website, :image

  belongs_to :user

  mount_uploader :image, ImageUploader
  mount_uploader :qrcode, QrcodeUploader

  default_scope order('created_at DESC')

  validates :title, length: { maximum: 20 }, presence: true
  validates :description, length: { maximum: 25 }, presence: true
  validates :price, presence: true
  validates :expiration, presence: true
  validates :website, presence: true
  validates :image, presence: true
  validates :qrcode, presence: true

  scope :visible_to, lambda { |user| user ? scoped : joins(:promotion).where('promotions.public' => true) }
end
