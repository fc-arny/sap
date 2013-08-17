# == Schema Information
#
# Table name: sap_categories
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  url        :string(255)      not null
#  order_pos  :integer          default(0)
#  parent_id  :integer
#  created_at :datetime
#  updated_at :datetime
# -------------------------------------------------------------
class Sap::Category < ActiveRecord::Base
  # Scopes
  scope :menu, -> { where(show_in_menu: true)}

  # Fields
  attr_accessible :id, :name, :url, :order_pos, :parent_id

  # Association
  has_and_belongs_to_many :goods, :join_table => 'sap_category_good'

  # Fetch categories by parent_id and deep
  def self.get_children_categories(parent_id = nil, deep = 0, show_in_menu = true)
    categories = []

    begin
      children = self.where(parent_id: parent_id, show_in_menu: show_in_menu).to_a

      # If no categories then break
      break if children.empty?

      parent_id = []
      # Put children to result array and fetch their children
      children.each do |category|
        categories << category
        parent_id << category.id
      end

      deep -= 1
    end while deep >= 0

    categories
  end
end
