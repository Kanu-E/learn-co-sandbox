
class Apimanager
   
   BASE_URL = "https://api-football-v1.p.rapidapi.com/v2/"
   
  def get_response_body(season)
     
     url = URI(BASE_URL + "players/team/40/#{season}")
  
   http = Net::HTTP.new(url.host, url.port)
   http.use_ssl = true
   http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  request = Net::HTTP::Get.new(url)
  request["x-rapidapi-host"] = 'api-football-v1.p.rapidapi.com'
  request["x-rapidapi-key"] = 'f47b22bc51msh636f36585a287e6p195cccjsn2fff44e4cc45'

   response = http.request(request)
     response.body
  end
  
  def active_players(season)
   players = JSON.parse(self.get_response_body(season))
   players["api"]["players"].select{|player| player["games"]["appearences"] > 0}
  end
  
  def get_players(competition)
    player_array = self.active_players("2019-2020").select{|player| player["league"] == competition}
    Players.mass_create(player_array)
  end
  
end




