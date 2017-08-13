class Orbit < ApplicationRecord
  belongs_to :orbitable, polymorphic: true
  validates_presence_of :mass, :radius

  after_initialize :set_defaults, unless: :persisted?

  def force_of_gravity
    BigDecimal( ( G_CONSTANT * mass * orbitable.mass ) / ( radius * radius ) ) unless orbitable.nil?
  end

  def orbital_velocity
    BigDecimal( ( G_CONSTANT * orbitable.mass ) / radius ).sqrt(PRECISION) unless orbitable.nil?
  end

  def angular_velocity
    orbital_velocity / radius
  end

  def elapsed_seconds
    DateTime.now.to_i - updated_at.to_i
  end

  private
    def set_defaults
      unless mass.nil? or radius.nil?
        self.initial_velocity ||= orbital_velocity
      end
    end
end
