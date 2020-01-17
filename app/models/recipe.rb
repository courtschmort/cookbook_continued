class Recipe < ApplicationRecord

  scope :sort_by_desc, -> {order(rating: :desc)}
  scope :sort_by_asc, -> {order(rating: :asc)}

  validates :title, presence: true
  validates_length_of :title, maximum: 100

  has_many :recipe_tags
  has_many :tags, :through => :recipe_tags

  before_save(:titleize_recipe)

  private
  def titleize_recipe
    self.title = self.title.titleize
  end

end
