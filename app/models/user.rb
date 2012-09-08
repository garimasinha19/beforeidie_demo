class User < ActiveRecord::Base
  attr_accessible :country, :email, :name
  has_many :wishes
end
