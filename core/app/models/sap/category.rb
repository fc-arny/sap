# == Schema Information
#
# Table name: sap_categories
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  url        :string(255)      not null
#  order_pos  :integer          default(0)
#  created_at :datetime
#  updated_at :datetime
# -------------------------------------------------------------
class Sap::Category < ActiveRecord::Base
  # Includes
  has_ancestry
  has_image_thread :images

  # Association
  has_and_belongs_to_many :goods, class_name: Sap::Good.to_s, join_table: 'category_goods'

  # Scopes
  scope :menu, -> { where(show_in_menu: true) }

  # Callbacks
  after_commit :flush_cache

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

  def parent_enum
    result = self.class.sort_by_ancestry(self.class.where.not(id: id))
    result.map do |c|
      ["#{'--'*c.depth} #{c.name}", c.id]
    end
  end

  private

  def flush_cache
    Rails.cache.delete([:header, :categories])
    Rails.cache.delete([:header, :subcategories])
  end
end
