require 'rails_helper'

describe Tag do
  it { should have_many(:recipes).through(:recipe_tags) }

  it("downcases the name of an tag") do
    tag = Tag.create({categories: "Thai"})
    expect(tag.categories()).to(eq("thai"))
  end
end
