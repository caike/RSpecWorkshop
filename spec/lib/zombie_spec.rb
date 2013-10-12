require 'spec_helper'
require 'zombie'

describe Zombie do
  it 'is named Ash' do
    zombie = Zombie.new
    zombie.name.should == 'Ash'
  end

  it 'has no brains' do
    zombie = Zombie.new
    zombie.brains.should < 1
  end

  it 'is hungry' do
    zombie = Zombie.new
    zombie.should be_hungry
  end

  it 'does not run' # pending example

  xit 'it did run at some point but not anymore' do
    1.should == 2
  end
end

