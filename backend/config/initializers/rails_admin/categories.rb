RailsAdmin.config do |config|
  config.model Sap::Category do
    list do
      field :id
      field :name
      field :url
      field :position
      field :show_in_menu
      field :parent
    end
  end
end