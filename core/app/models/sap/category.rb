# == Schema Information
#
# Table name: sap.categories
#
#  id           :integer          not null, primary key
#  name         :string(255)      not null
#  url          :string(255)      not null
#  position     :integer          default(0)
#  show_in_menu :boolean          default(TRUE)
#  created_at   :datetime
#  updated_at   :datetime
#  ancestry     :string
#  images_id    :integer
#

class Sap::Category < ActiveRecord::Base
  # Includes
  has_ancestry
  has_image_thread :images

  # Association
  has_and_belongs_to_many :goods, class_name: Sap::Good.to_s, join_table: 'sap.category_goods'

  # Scopes
  scope :menu, -> { where(show_in_menu: true).order(:position) }
  scope :by_url, -> (url) { where(url: url).first }

  # Callbacks
  after_commit :flush_cache

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
