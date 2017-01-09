ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
	#permit_params :first_name, :last_name, :profile_name, :email
	#permit_params :first_name, :last_name, :profile_name, :email, :encrypted_password, :reset_password_token, :current_sign_in_ip, :last_sign_in_ip, :provider, :uid
	permit_params :first_name, :last_name, :profile_name, :email, :password, :password_confirmation
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


	index do
		column :first_name
		column :last_name
		column :profile_name
		column :email
		actions
	end

	form do |f|
		f.inputs 'User' do
		  f.input :first_name
		  f.input :last_name
		  f.input :profile_name
		  f.input :email
		  f.input :password
		  f.input :password_confirmation
		end
		f.actions
	end

menu priority: 3

controller do
	def in_order
	  order(created_at: :asc)
	end

	def recent(n)
	  in_order.endmost(n)
	end

	def endmost(n)
	  all.only(:order).from(all.reverse_order.limit(n), table_name)
	end

	def update_resource(object, attributes)
	    update_method = attributes.first[:password].present? ? :update_attributes : :update_without_password
	    object.send(update_method, *attributes)
	  end
end


end
