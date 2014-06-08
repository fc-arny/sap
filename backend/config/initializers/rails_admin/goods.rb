RailsAdmin.config do |config|
  config.model Sap::Good do
    list do
      field :name
      field :rating
      # field :images do
      #
      # end
      # field :is_group
      # field :group_id
      # field :created_at
      # field :updated_at
    end

    edit do
      field :name
      field :description
      field :is_group
      field :measure, :measure
      group :images do
        label 'Images'
      end
      field :image_thread, :image_thread do
        group :images
      end
    end
  end
end