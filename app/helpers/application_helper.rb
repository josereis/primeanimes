module ApplicationHelper
    def greeting(name)
        "Olá #{name}"
    end

    def user_avatar(user)
        if user.instance_of?(Admin)
            image_pack_tag("avatar/default_avatar.jpg", class: "card-img-top rounded-circle border-white", alt: "#{user.name}")
        else
            # Model => User
            image_pack_tag("avatar/default_avatar.jpg", class: "card-img-top rounded-circle border-white", alt: "#{user.name}")
        end
    end

    def sidebar_items(user)
        if user.instance_of?(Admin)
            "layouts/shared/sas_animes/sidebar_items"
        else
            "layouts/shared/prime_animes/sidebar_items"
        end
    end
end
