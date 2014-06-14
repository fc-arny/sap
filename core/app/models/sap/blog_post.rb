# == Schema Information
#
# Table name: sap.blog_posts
#
#  id             :integer          not null, primary key
#  title          :string(255)      not null
#  body           :text             not null
#  category_id    :integer
#  published      :boolean          default(FALSE)
#  published_date :datetime
#  created_at     :datetime
#  updated_at     :datetime
#

# -------------------------------------------------------------
# Blog posts model
# -------------------------------------------------------------
class Sap::BlogPost < ActiveRecord::Base

  # Relationships
  belongs_to :category, class_name: 'Sap::BlogCategory'

  # Scopes
  scope :recent, ->{ published.order('published_date DESC') }
  scope :published, ->{ where(published: true) }
  scope :last_posts, ->(category){
    joins(:category).where('sap.blog_categories.url = :url', url: category)
  }

  # Triggers
  before_save :set_published_date

  # Short description 
  def cut(length = 100)
    [self.body[0..length], '...'].join
  end

  # Comments count 
  def comments_count
    # TODO: Get comment count
    rand(500)
  end

  def to_param
    "#{id}-#{title.parameterize}"
  end

  private

  # Set published blog
  def set_published_date
    if new_record?
      self.published_date ||= Time.now
    end
  end
end
