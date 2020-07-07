 class Players
  
    @@all = []
    
    attr_accessor :name, :details, :age, :height 
  
  def initialize(name, age, height, details)
    @name, @age, @height, @details = name, age, height, details
    save
    
  end
  
  def self.mass_create(player_array)
    player_array.each do |playerhash|
      self.new(playerhash["player_name"], playerhash["age"], playerhash["height"], playerhash)
    end
  end
  
  def save 
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def goals
    self.details['goals']["total"]
  end
  
  def concede
    self.details['goals']["conceded"]
  end
  
  def assists
    self.details['goals']["assists"]
  end 
  
  def shots 
    self.details["shots"]["total"]
  end
  
  def shots_on_target 
    self.details["shots"]["on"]
  end  
  
  def starts
    self.details["games"]["lineups"] 
  end
  
  def appearences
    self.details["games"]["appearences"]
  end
  
   def position
    self.details["position"]
  end 

   def rating
    self.details["rating"]
   end 
   
   def nation
     self.details["nationality"]
   end
   
   def birth_place
     self.details["birth_place"]
   end
   
   def birth_country
     self.details["birth_country"]
   end
   
   def minutes_played
     self.details["minutes_played"]
   end   
 
    def goals_per_minute
     details["minutes_played"] / goals
   end  
   
   def red
     details["cards"]["red"]
   end
   
   def yellow
     details["cards"]["yellow"]
   end
   
   def passes
    details["passes"]["total"]
   end  
   
   def complete_passes
    details["passes"]["total"] * details["passes"]["total"] /100
   end
   
   def key_passes
    details["passes"]["key"]
   end 
   
   def tackles
     details["tackles"]["total"]
   end
   
   def blocks
     details["tackles"]["blocks"]
   end
   
   def interceptions
     details["tackles"]["interceptions"]
   end   

   def fouls
     details["fouls"]["committed"]
   end 

   def show_player_details_1
       <<-STAT
       
       #{self.name}, #{self.position} 
       
       Personal Details:
       national Team                        #{self.nation}
       Place of birth                       #{self.birth_place}, #{self.birth_country}
       Age                                  #{self.age}
       Height                               #{self.height}
       
        STAT
   end      
  
   def show_player_details_2  
        if self.position == "Goalkeeper"
          keeper_stats
        elsif self.position == "Defender"
          defender_stats
        else
          attacker_stats
        end
   end
        
   def show_player_details_3   
      <<-STAT
      
       Team Play:
       
       Appearences                          #{self.appearences}
       rating                               #{self.rating}
       Passes                               #{self.passes}
       Complete Passes                      #{self.complete_passes}
       Key Passes                           #{self.key_passes}
       
       Discipline:
        
        Fouls Committed                     #{self.fouls}
        Yellow Cards                        #{self.yellow}
        Red Cards                           #{self.red}
        
      STAT
        
    end   
    
    def keeper_stats
        <<-STAT
     
      Goals Conceded                        #{self.concede}
      
       STAT
    end
    
    def defender_stats
      <<-STAT
      Defencive Record:
       Tackles                              #{self.tackles}
       Blocks                               #{self.blocks}
       Interceptions                        #{self.interceptions}
       
       Attacking record:
       Goals                                #{self.goals}
       Assists                              #{self.assists}
       Shots                                #{self.shots}
       Shots on target                      #{self.shots_on_target}
    
       STAT
    end
    
    def attacker_stats
      
       <<-STAT
      
       Attacking Record:
       Goals                                #{self.goals}
       Assists                              #{self.assists}
       Shots                                #{self.shots}
       Shots on target                      #{self.shots_on_target}
       
       STAT
       
    end
     
 end