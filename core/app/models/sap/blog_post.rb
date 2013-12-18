# -------------------------------------------------------------
# Blog posts model
# -------------------------------------------------------------
class Sap::BlogPost < ActiveRecord::Base

  # Relationships
  belongs_to :category, class_name: 'Sap::BlogCategory'

  # Scopes
  scope :last_news, -> {
    joins(:category).where('sap.blog_categories.url = :url', url: 'news').order('publish_date DESC')
  }

  # Short description 
  def cut(length = 100)
    [self.body[0..length], '...'].join
  end
end