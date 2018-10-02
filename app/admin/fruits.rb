ActiveAdmin.register Fruit do
    permit_params :name, :stock, :price, :avatar

    filter :created_at

    form do |f|
        f.inputs do
            f.input :name
            f.input :stock
            f.input :price
            f.input :avatar
        end
        f.actions
    end
end
