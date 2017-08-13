require 'rails_helper'

RSpec.describe Orbit, type: :model do
  it "validates presence of orbitable" do
    star = Star.create mass: 1
    orbit = Orbit.create mass: 1, radius: 1
    expect(orbit.valid?).to be false
  end
  it "validates presence of mass" do
    star = Star.create mass: 1
    orbit = Orbit.create orbitable: star, radius: 1
    expect(orbit.valid?).to be false
  end
  it "validates presence of radius" do
    star = Star.create mass: 1
    orbit = Orbit.create orbitable: star, mass: 1
    expect(orbit.valid?).to be false
  end
  it "has a default initial angle" do
    star = Star.create mass: 1
    orbit = Orbit.create orbitable: star, mass: 1, radius: 1
    expect(orbit.initial_angle).to eq 0.0
  end
  it "has a default initial velocity" do
    star = Star.create mass: 1
    orbit = Orbit.create orbitable: star, mass: 1, radius: 1
    expect(orbit.initial_velocity).to eq orbit.orbital_velocity
  end
  it "calculates force of gravity" do
    earth = Star.create mass: 5.972E24
    object = Orbit.create orbitable: earth, mass: 1, radius: 6371000
    expect(object.force_of_gravity.round(1)).to eq 9.8.to_d
  end
  it "calculates orbital velocity" do
    earth = Star.create mass: 5.972E24
    object = Orbit.create orbitable: earth, mass: 1, radius: (400000 + 6371000)
    expect(object.orbital_velocity.round).to eq 7672
  end
  it "calculates angular velocity" do
    earth = Star.create mass: 5.972E24
    object = Orbit.create orbitable: earth, mass: 1, radius: (400000 + 6371000)
    expect(object.angular_velocity.round(5)).to eq 0.00113
  end
  it "calculates elapsed seconds" do
    star = Star.create mass: 1
    orbit = Orbit.create orbitable: star, mass: 1, radius: 1, updated_at: DateTime.now - 10.seconds
    expect(orbit.elapsed_seconds).to eq 10
  end
end
