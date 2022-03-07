module UsersHelper
    def user_status_badge(user)
        if user.active?
            "<span class='badge bg-success'>#{user.status_text}</span>".html_safe
        elsif user.inactive?
            "<span class='badge bg-warning'>#{user.status_text}</span>".html_safe
        else
            "<span class='badge bg-danger'>#{user.status_text}</span>".html_safe
        end
    end
    
    def user_status_change_buttons(user)
        if user.active?
            render partial: "layouts/shared/button_link/button_status", locals: {path_link: inactive_sas_animes_user_url(user), method: :get, button_type: "danger", icone: "fa-user-slash"}
        else
            render partial: "layouts/shared/button_link/button_status", locals: {path_link: active_sas_animes_user_url(user), method: :get, button_type: "success", icone: "fa-user"}
        end
    end
end
