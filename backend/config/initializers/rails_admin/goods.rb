RailsAdmin.config do |config|
  config.model Sap::Good do
    list do
      field :name
      field :par
      field :has_images?, :boolean
      # field :group_id
      field :is_group
      field :category
      # field :created_at
      # field :updated_at
    end

    edit do
      field :name
      field :description
      field :par, :measure
      field :category_id, :enum do
        enum_method do :category_enum end
      end
      field :is_group

      # Images
      group :images do
        label I18n.t('activerecord.groups.sap/good.images')
      end

      field :image_thread, :image_thread do
        group :images
      end

      # GoodItems
      group :items do
        label I18n.t('activerecord.groups.sap/good.good_items')
      end

      field :good_items do
        help ''
        # label false
        group :items

        partial 'good_items', locals: {field: self}
      end
    end
  end
end