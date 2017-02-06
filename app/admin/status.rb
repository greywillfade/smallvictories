ActiveAdmin.register Status do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
	permit_params :user_id, :content, :private, :category_id

	#belongs_to :user
	#belongs_to :category

	menu priority: 4

end
