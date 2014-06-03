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
  # Includes
  has_ancestry

  # Association
  has_many :category_goods, class_name: 'Sap::CategoryGood'
  has_many :goods, through: :category_goods

  # Scopes
  scope :menu, -> { where(show_in_menu: true) }

  class << self
    # Fetch categories by parent_id and deep
    def children_categories(parent_id = nil, deep = 0, show_in_menu = true)
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

  def children
    categories = []
    _children  = self.class.where(parent_id: self.id)

    _children.each do |cat|
      categories << cat
      categories += cat.children
    end

    categories
  end


  def parents
    categories  = []
    _parent_id  = self.parent_id

    while _parent_id && _category = self.class.find(_parent_id)
      categories << _category
      _parent_id =  cat.parent_id
    end

    categories
  end
end
