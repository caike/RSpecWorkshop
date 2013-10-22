class Zombie < ActiveRecord::Base

  attr_accessor :tweets, :custom_weapons

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
end

