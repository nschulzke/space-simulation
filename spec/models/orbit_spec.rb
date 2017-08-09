require 'rails_helper'

RSpec.describe Orbit, type: :model do
  it "validates presence of orbitable" do
    star = Star.new mass: 1
    orbit = Orbit.new mass: 1, radius: 1
    expect(orbit.valid?).to be false
  end
  it "validates presence of mass" do
    star = Star.new mass: 1
    orbit = Orbit.new orbitable: star, radius: 1
    expect(orbit.valid?).to be false
  end
  it "validates presence of radius" do
    star = Star.new mass: 1
    orbit = Orbit.new orbitable: star, mass: 1
    expect(orbit.valid?).to be false
  end
  it "calculates force of gravity" do
    star = Star.new mass: 1
    orbit = Orbit.new orbitable: star, mass: 1, radius: 1
    expect(orbit.force_of_gravity).to be G_CONSTANT
  end
  it "calculates gravity accurately" do
    earth = Star.new mass: 5.972E24
    object = Orbit.new orbitable: earth, mass: 1, radius: 6371000
    expect(object.force_of_gravity.round(1)).to be 9.8
  end
end
