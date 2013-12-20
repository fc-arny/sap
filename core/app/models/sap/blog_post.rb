# -------------------------------------------------------------
# Blog posts model
# -------------------------------------------------------------
class Sap::BlogPost < ActiveRecord::Base

  # Relationships
  belongs_to :category, class_name: 'Sap::BlogCategory'

  # Scopes
  scope :recent, ->{ order('published_date DESC') }
  scope :published, ->{ where(published: true) }
  scope :last_posts, ->(category){
    published.joins(:category).where('sap.blog_categories.url = :url', url: category)
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