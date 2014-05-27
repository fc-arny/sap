RailsAdmin.config do |config|
  config.model 'Sap::User' do
    # label  'Пользователь'
    # label_plural 'Пользователи'
    list do
      field :name
      field :login
      field :phone
      field :role
    end
  end
end

