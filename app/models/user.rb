class User < ApplicationRecord
    has_secure_password
    has_many :orders
    
    validates_presence_of :name, :address, :tlp, :email, :password
    validates :email, uniqueness: true
    validates :password, length: {in: 6..20}
end
