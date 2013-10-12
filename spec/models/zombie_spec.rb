require 'spec_helper'

describe Zombie do
  it 'requires name' do
    zombie = Zombie.new
    zombie.should_not be_valid
  end

  it 'has clones' do
    zombie = Zombie.new(name: 'Ash Clone 3')
    zombie.name.should match(/Ash Clone \d/)
  end

  it 'has tweets' do
    zombie = Zombie.new(name: 'Ash', tweets: ['o hai', 'kthnxbai'])
    zombie.tweets.should include('o hai')
  end

  it 'starts with two weapons' do
    zombie = Zombie.new(name: 'Ash')
    zombie.weapons.count.should == 2
    zombie.should have(2).weapons
  end

  it 'changes the number of Zombies' do
    zombie = Zombie.new(name: 'Ash')
    expect { zombie.save! }.to change { Zombie.count }.by(1)
  end

  it 'raises error calling #save! oninvalid zombie' do
    expect { Zombie.new.save! }.to raise_error(ActiveRecord::RecordInvalid)
  end
end

