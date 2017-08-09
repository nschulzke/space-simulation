class Star < ApplicationRecord
  has_many :orbits, as: :orbitable
end
