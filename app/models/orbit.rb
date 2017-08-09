class Orbit < ApplicationRecord
  belongs_to :orbitable, polymorphic: true
end
