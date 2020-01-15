require 'rails_helper'

describe Recipe do
  it { should have_many(:tags).through(:recipe_tags) }
end
