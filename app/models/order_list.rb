class OrderList < ApplicationRecord
  belongs_to :order
  belongs_to :fruit
end
