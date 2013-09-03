# == Schema Information
#
# Table name: sap_good_items # Object contained link to good object and good's price in the store
#
#  id               :integer          not null, primary key # Object contained link to good object and good's price in the store
#  good_id          :integer          not null              # Link to real good
#  good_id_in_store :string(255)      not null              # Store inside good's ID for sync list
#  price            :decimal(, )      not null              # Price in the store
#  store_id         :integer          not null              # The store
#  order_pos        :integer
#  created_at       :datetime
#  updated_at       :datetime
# -------------------------------------------------------------
class Sap::GoodItem < ActiveRecord::Base
  # Fields
  #attr_accessible :id, :good_id, :price, :store_id, :store_gid, :order_pos

  # Relationships
  belongs_to :good, :class_name => 'Sap::Good'
  belongs_to :store, :class_name => 'Sap::Store'

  # Geting filtred
  def self.filter(attributes, sort = nil)
    relation = self.includes(:good => :categories)

    unless sort.nil?
      relation.order! sprintf('sap_%<col>s %<dir>s', col: sort[:col], dir: sort[:dir])
    end


    attributes.inject(relation) do |scope,(key,value)|
      return scope if value.empty?

      case key.to_sym
        when :store
          scope.where(:store_id => value)
        when :category
          # Find good that belogs to many categories at sametime
          scope.where(:sap_category_good => {category_id: value})
        when :order
          # Get only goods from basket
          scope.includes(:order_items).where(:sap_order_items => {order_id: value})
        else
          scope
      end
    end
  end

end
