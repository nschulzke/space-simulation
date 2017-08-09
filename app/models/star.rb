class Star < ApplicationRecord
  has_many :orbits, as: :orbitable
  validates_presence_of :mass
end
