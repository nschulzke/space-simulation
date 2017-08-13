require 'rails_helper'

RSpec.describe Orbit, type: :model do
  describe "validates" do
    before :each do
      @star = Star.create mass: 1
      @orbit = Orbit.create
    end

    it "validates presence of orbitable" do
      expect(@orbit.errors[:orbitable]).to include("must exist")
    end

    it "validates presence of mass" do
      expect(@orbit.errors[:mass]).to include("can't be blank")
    end

    it "validates presence of radius" do
      expect(@orbit.errors[:radius]).to include("can't be blank")
    end

    it "has a default initial angle" do
      expect(@orbit.initial_angle).to be_a(BigDecimal)
    end

    it "has a default initial velocity" do
      orbit = Orbit.create orbitable: @star, mass: 1, radius: 2
      expect(orbit.initial_velocity).to be_a(BigDecimal)
      expect(orbit.initial_velocity).to eq orbit.orbital_velocity
    end
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
