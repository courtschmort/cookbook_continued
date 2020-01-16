require 'rails_helper'

describe Recipe do
  it { should have_many(:tags).through(:recipe_tags) }
  it { should validate_presence_of :title }
  it { should validate_length_of(:title).is_at_most(100) }

  it("titleizes the name of an recipe") do
    recipe = Recipe.create({title: "pad see ew"})
    expect(recipe.title()).to(eq("Pad See Ew"))
  end
end
