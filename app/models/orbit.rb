class Orbit < ApplicationRecord
  belongs_to :orbitable, polymorphic: true
  validates_presence_of :mass, :radius

  def force_of_gravity
    ( G_CONSTANT * mass * orbitable.mass ) / ( radius * radius )
  end

  def orbital_velocity
    Math.sqrt( ( G_CONSTANT * orbitable.mass ) / radius )
  end

  def angular_velocity
    orbital_velocity / radius
  end

  def elapsed_seconds
    DateTime.now.to_i - updated_at.to_i
  end
end
