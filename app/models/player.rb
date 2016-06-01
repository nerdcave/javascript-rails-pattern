class Player < ApplicationRecord
  validates_presence_of :email, :high_score
end
