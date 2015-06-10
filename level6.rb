
class Player
  def initialize
    @health = 20
    @captive_saved = false
  end
  
  def play_turn(warrior)
    
    if warrior.feel(:backward).empty? && @captive_saved == false
      warrior.walk!(:backward)
    
    elsif warrior.feel(:backward).captive? && @captive_saved == false
      warrior.rescue!(:backward)
      @captive_saved = true
    elsif attack?(warrior) && warrior.feel.empty? == false
      warrior.attack!
    elsif attack?(warrior) && warrior.health < 10
      warrior.walk!(:backward)
    elsif attack?(warrior) == false && warrior.health < 15
      warrior.rest!
    elsif warrior.feel.empty?  
      warrior.walk!
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