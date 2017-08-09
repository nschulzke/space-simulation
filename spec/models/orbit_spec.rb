require 'rails_helper'

RSpec.describe Orbit, type: :model do
  it "validates presence of orbitable" do
    star = Star.new
    orbit = Orbit.new mass: 1, radius: 1
    expect(orbit.valid?).to be false
  end
  it "validates presence of mass" do
    star = Star.new
    orbit = Orbit.new orbitable: star, radius: 1
    expect(orbit.valid?).to be false
  end
  it "validates presence of radius" do
    star = Star.new
    orbit = Orbit.new orbitable: star, mass: 1
    expect(orbit.valid?).to be false
  end
end
