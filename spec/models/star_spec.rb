require 'rails_helper'

RSpec.describe Star, type: :model do
  it "has a mass" do
    star = Star.new(mass: 10)
    expect(star.mass).to eql(10)
  end
end
