class Promotion < ActiveRecord::Base
  attr_accessible :description, :expiration, :price, :qrcode, :title, :website

  belongs_to :user

  default_scope order('created_at DESC')
end
