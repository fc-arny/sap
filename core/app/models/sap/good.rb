# == Schema Information
#
# Table name: sap_goods
#
#  id              :integer          not null, primary key
#  name            :string(255)      not null
#  description     :text
#  value           :integer          not null
#  measure_id      :integer
#  is_approved     :boolean          default(TRUE)
#  is_group        :boolean          default(FALSE)
#  group_id        :integer
#  created_at      :datetime
#  updated_at      :datetime
#  image_thread_id :integer
#

class Sap::Good < Sap::Base
  has_image_thread :image_thread

  has_many :good_items, class_name: 'Sap::GoodItem'

  belongs_to :measure, class_name: 'Sap::Measure'
  belongs_to :category, class_name: 'Sap::Category'

  delegate :images, to: :image_thread, allow_nil: true

  def par
    "#{value} #{measure.name}" unless is_group
  end

  def has_images?
    image_thread.blank? || image_thread.images.count == 0 ? false : true
  end

  def category_enum
    result = Sap::Category.sort_by_ancestry(Sap::Category.where.not(id: id))
    result.map do |c|
      ["#{'--'*c.depth} #{c.name}", c.id]
    end
  end
end
