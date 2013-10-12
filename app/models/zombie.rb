class Zombie < ActiveRecord::Base

  attr_accessor :tweets

  validates :name, presence: true

  WEAPONS = %w(Axe Shotgun)
  def weapons
    WEAPONS
  end
end

