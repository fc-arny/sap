RailsAdmin.config do |config|
  config.model 'Sap::Good' do
    list do
      field :name
      field :measure do
        label 'Measure'
        formatted_value do

        end
      end
      field :value
      field :measure_id
      field :is_group
      field :group_id
      field :created_at
      field :updated_at
    end
  end
end