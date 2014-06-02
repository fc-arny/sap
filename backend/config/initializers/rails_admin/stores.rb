RailsAdmin.config do |config|
  config.model Sap::Store do
    nestable_list(live_update: :only)
    list do
      # filters [:name]

      field :id
      field :name
      field :position
      field :system_name
      field :active
      # field :timetable, :string do
      #   label I18n.t('activerecord.models.sap/store.timetable')
      #   formatted_value do |o|
      #     [o.work_time_from, o.work_time_to].join(' - ')
      #   end
      # end
    end
  end
end