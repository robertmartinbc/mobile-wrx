class Promotion < ActiveRecord::Base
  attr_accessible :description, :expiration, :price, :qrcode, :title, :website
end
