class Zombie < ActiveRecord::Base

  attr_accessor :tweets, :custom_weapons, :graveyard

  validates :name, presence: true

  WEAPONS = %w(Axe Shotgun)
  def weapons
    [custom_weapons, WEAPONS].flatten.compact
  end

  def brains
    0
  end

  def craving
    if vegetarian?
      'vegan brains'
    else
      'brains'
    end
  end

  def swing(weapon)
    weapons.include?(weapon)
  end

  def geolocate
    loc = Zoogle.graveyard_locator(self.graveyard)
    "#{loc.latitude}, #{loc.longitude}"
  end

  class Zoogle
    def self.graveyard_locator
    end
  end
end

