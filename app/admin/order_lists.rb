ActiveAdmin.register OrderList do
	permit_params :order_id, :fruit_id, :qty, :price

	filter :order_id, :label => 'No Order'
	filter :created_at

	form do |f|
		f.inputs do
			f.input :order, :label => 'Order', :as => :select, :collection => Order.all.map{|t|["#{t.id}", t.id]}, :prompt => "Choose a Order"
			f.input :fruit, :label => 'Fruit', :as => :select, :collection => Fruit.all.map{|m|["#{m.name}", m.id]}, :prompt => "Choose a Fruit"
			f.input :qty
			f.input :price
		end
		f.actions
	end

end
