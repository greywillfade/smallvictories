ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
        column do
        
            panel "Recently created users" do
                ul do
                    User.order('id desc').limit(20).each do |user|
                        li link_to(user.profile_name, admin_user_path(user))
                    end
                end
            end

            panel "Recently created victories" do
                table_for Status.order('id desc').limit(20).each do |status|
                    column (:id) {|status| link_to(status.id, admin_status_path(status)) }
                    column (:profile_name) {|status| status.user.profile_name }
                    column :content
                    column :created_at
                end # table
            end # panel

       end

      column do
        panel "Admin" do
          para "Welcome to the Small Victories admin panel"
        end
      end
    end

  end # content
end
