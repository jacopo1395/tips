class Users::UnlocksController < Devise::UnlocksController
  # GET /recent_pois
   def getpois
     recents = Is_recent.find_by userMail: current_user.email
     poi1= Poi.find_by recents.id1
     
   end

end
