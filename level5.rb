
class Player
  def initialize
    @health = 20
  end
  
  def play_turn(warrior)

    # if @health <= warrior.health && warrior.feel.empty? == false
      # warrior.attack!
    if attack?(warrior) && warrior.feel.empty? == false
      warrior.attack!
    elsif attack?(warrior) == false && warrior.health < 15
      warrior.rest!
    elsif warrior.feel.empty?  
      warrior.walk!
    elsif warrior.feel.captive?
      warrior.rescue!
    else
      warrior.attack!

    end
    
    @health = warrior.health

  end
  def attack?(warrior)
    if warrior.health < @health
      true
    else
      false
    end
  end
end