class Fruit < ApplicationRecord
    has_many :order_lists
    
    mount_uploader :avatar, AvatarUploader
    validates_presence_of :name
    validates :name, uniqueness: true
end
