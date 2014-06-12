RailsAdmin.config do |config|
  config.model Sap::GoodItem do
    list do
      field :id
      field :good
      field :price do
        formatted_value do
          ActiveSupport::NumberHelper.number_to_currency(value)
        end
      end
      field :store
      field :store_gid
      field :updated_at
    end
  end
end