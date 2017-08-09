require 'rails_helper'

RSpec.describe Star, type: :model do
  it "validates presence of mass" do
    star = Star.new
    expect(star.valid?).to be false
  end
end
