RailsAdmin.config do |config|
  config.model Sap::Category do
    nestable_tree({
      position_field: :position,
      max_depth: 3
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
      field :position
      field :show_in_menu
      field :parent, :enum do
        Sap::Category.all.map { |c| [c.id] }
      end
    end
  end
end