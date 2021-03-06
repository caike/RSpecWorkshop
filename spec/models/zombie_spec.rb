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

  it 'responds to name' do
    subject.should respond_to(:name)
  end

  it 'responds to name too' do
    should respond_to(:name)
  end

  it('responds to name as well') { should respond_to(:name) }

  it { should respond_to(:name) }

  its(:weapons) { should == Zombie::WEAPONS }
  its(:brains) { should be_zero }

  context 'when hungry' do
    it 'craves brains' do
      zombie = Zombie.new
      zombie.craving.should == 'brains'
    end

    context 'with a veggie preference' do
      subject { Zombie.new(vegetarian: true) }

      its(:craving) { should == 'vegan brains' }
    end

    context 'with custom weapons' do
      subject(:zombie) { Zombie.new(custom_weapons: sword) }

      let(:sword) { 'sword' }
      its(:weapons) { should include(sword) }

      it 'can use its sword' do
        zombie.swing(sword).should == true
      end
    end
  end

  describe 'creating a Zombie' do
    let!(:zombie) { Zombie.create(name: 'Joe') }

    its(:name) { should be_nil }
    it('creates a zombie') { Zombie.count.should == 1 }
  end

  describe 'a violent Zombie' do
    let(:zombie) { Zombie.create(name: 'Joe') }

    it 'stubs' do
      zombie.stub(:custom_weapons){ ['Banana'] }
      zombie.weapons.should include('Banana')
    end

    it 'mocks' do
      zombie.should_receive(:custom_weapons)
      zombie.weapons
    end
  end

  describe 'a location aware zombie' do
    let(:zombie) { Zombie.create }

    it 'returns formatted lat and long' do
      location = double(latitude: 2, longitude: 3)
      Zombie::Zoogle.stub(:graveyard_locator) { location }
      zombie.geolocate.should == '2, 3'
    end
  end

  describe 'using the new expect() syntax' do
    it 'requires name' do
      zombie = Zombie.new
      expect(zombie).not_to be_valid
    end

    it 'is named Ash' do
      zombie = Zombie.new(name: 'Ash')
      expect(zombie.name).to eq('Ash')
    end
  end
end

