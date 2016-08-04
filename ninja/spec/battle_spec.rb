require 'battle'
require 'bear'
require 'ninja'

RSpec.describe Battle do
  let(:fighter1){
    Bear.new(name: "Smokey", health: 200, power: 100)
  }
  let(:fighter2){
    Ninja.new(name: "Steeleyes", health: 400, power: 250)
  }
  let(:battle){
    Battle.new(fighter1: fighter1, fighter2: fighter2)
  }

  it ".new creates a new Battle" do
    expect(battle).to be_an_instance_of Battle
  end

  it "#fighter1 returns Bear object" do
    expect(battle.fighter1).to equal(fighter1)
  end

  it "#fighter2 returns Ninja object" do
    expect(battle.fighter2).to equal(fighter2)
  end

  it "#fight between two fighters" do
    battle.fight
    expect(battle.fighter1.health).to eql(-50)
    expect(battle.fighter2.health).to eql(300)
  end


end
