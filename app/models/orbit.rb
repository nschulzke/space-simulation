class Orbit < ApplicationRecord
  belongs_to :orbitable, polymorphic: true
  validates_presence_of :mass, :radius

  def force_of_gravity
    ( G_CONSTANT * mass * orbitable.mass ) / ( radius * radius )
  end
end
