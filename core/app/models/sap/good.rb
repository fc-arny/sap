# == Schema Information
#
# Table name: sap_goods
#
#  id            :integer          not null, primary key
#  name          :string(255)      not null
#  measure_id    :integer          not null
#  measure_value :integer          not null
#  measure_step  :integer          default(1), not null
#  description   :text
#  is_approved   :boolean          default(FALSE)
#  order_pos     :integer          default(0)
#  created_at    :datetime
#  updated_at    :datetime
#
class Sap::Good < ActiveRecord::Base
  # Includes
  has_image_thread :image_thread

  # Associations
  has_many :good_items, class_name: Sap::GoodItem.to_s
  has_and_belongs_to_many :categories, class_name: Sap::Category.to_s, join_table: 'sap.category_goods'

  belongs_to :measure, class_name: Sap::Measure

  #belongs_to :vendor, :class_name => 'Sap::Vendor'
  def par
    "#{value} #{measure.name}" unless is_group
  end

  def has_images?
    image_thread.blank? || image_thread.images.count == 0 ? false : true
  end
end
