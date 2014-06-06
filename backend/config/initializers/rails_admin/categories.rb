RailsAdmin.config do |config|
  config.model Sap::Category do
    nestable_tree({
      position_field: :position
    })

    list do
      field :id
      field :name
      field :url
      field :position
      field :parent do
        formatted_value do
          cat = bindings[:object]
          if cat.parent_id
            lnk = bindings[:view].rails_admin.edit_path(model_name: 'sap~category', id: cat.parent_id)
            (bindings[:view].link_to(cat.parent.name, lnk)).html_safe
          end
        end
      end
      field :show_in_menu
    end

    edit do
      field :id
      field :name
      field :url
      field :parent_id, :enum do
        enum_method do
          :parent_enum
        end
      end
      field :show_in_menu
      field :images, :image_thread
    end
  end
end