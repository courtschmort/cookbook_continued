class Tag < ApplicationRecord

  validates :categories, presence: true

  has_many :recipe_tags
  has_many :recipes, :through => :recipe_tags

  before_save(:downcase_tag)

  private
  def downcase_tag
    self.categories = self.categories.downcase
  end
  
end
