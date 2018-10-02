ActiveAdmin.register Order do
	permit_params :user_id, :total

	filter :user_id, :label => 'User'
	filter :created_at

	form do |f|
		f.inputs do
			f.input :user, :label => 'User', :as => :select, :collection => User.all.map{|t|["#{t.name}", t.id]}, :prompt => "Choose a User"
			f.input :total
		end
		f.actions
	end

end