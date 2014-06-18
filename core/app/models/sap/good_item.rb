# == Schema Information
#
# Table name: sap.good_items
#
#  id              :integer          not null, primary key
#  good_id         :integer          not null
#  store_gid       :string(255)      not null
#  price           :decimal(8, 2)    not null
#  store_id        :integer          not null
#  is_available    :boolean          default(TRUE)
#  order_pos       :integer
#  created_at      :datetime
#  updated_at      :datetime
#  image_thread_id :integer
#

class Sap::GoodItem < ActiveRecord::Base
  # Includes
  # include Sap::Filterable

  # Relationships
  belongs_to :good, class_name: Sap::Good.to_s
  belongs_to :store, class_name: Sap::Store.to_s

  def name
    "##{id}: #{good.name} (#{store.name})" unless new_record?
  end

  # Getting filtered
  def self.filter(attributes, sort = nil)
    relation = self.includes(:good => :category)

    unless sort.nil?
      relation.order! sprintf('sap_%<col>s %<dir>s', col: sort[:col], dir: sort[:dir])
    end


    attributes.inject(relation) do |scope, (key,value)|
      return scope if value.blank?

      case key.to_sym
        when :store
          scope.where(store_id: value)
        when :category
          # Find good that belongs to many categories at same time
          category = Sap::Category.find value
          scope.where(goods: {category_id: category.subtree_ids})
        when :order
          # Get only goods from basket
          scope.includes(:order_items).where(:sap_order_items => {order_id: value})
        else
          scope
      end
    end
  end

end
