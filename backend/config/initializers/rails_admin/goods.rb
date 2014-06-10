RailsAdmin.config do |config|
  config.model Sap::Good do
    list do
      field :name
      field :par
      field :has_images?, :boolean
      # field :group_id
      field :is_group
      # field :created_at
      # field :updated_at
    end

    edit do
      field :name
      field :description
      field :is_group

      field :par, :measure


      group :images do
        label I18n.t('activerecord.groups.sap/good.images')
      end

      field :image_thread, :image_thread do
        group :images
      end

      group :good_items do
        label I18n.t('activerecord.groups.sap/good.good_items')
      end
    end
  end
end