class Geocaching < ActiveRecord::Base
   acts_as_gmappable
    
  attr_accessible :latitude, :longitude, :address ,:name,:multicaching_id,:summary,:position,:checker
  belongs_to :multicaching
  validates :address, :presence => true

  def gmaps4rails_address

    address
  end

  def gmaps4rails_infowindow
    "
    <h3>#{name}</h3>
    <h4> Address :  #{address}</h4>
    <h4> Latitude :      #{latitude}</h4>
    <h4> Longitude :     #{longitude}</h4>
   <h2><a href=\"geocachings/#{id}/edit\"  style = \"background-color :#FFFFFF;font-family:arial;color:#0000FF;\">Edit The Marker</a></h2>
   <h2><a href=\"geocachings/#{id}/\" data-confirm=\"Are you sure?\" data-method=\"delete\" rel=\"nofollow\" style = \"background-color :#FFFFFF;font-family:arial;color:#0000FF;\">Delete The Marker</a></h2>
    "
  end
  def gmaps4rails_marker_picture
    if( self.name == "Introduction" || self.name == "End")
      return {"picture" => "/images/beachflag2.png",
        "width" => 50, #beware to resize your pictures properly
        "height" => 50, #beware
         "marker_anchor" => [10,35],
        "shadow_anchor" => [10,35],
        
        

      }
    end
    {"picture" => "/images/middle.png",
      "width" => 50, #beware to resize your pictures properly
      "height" => 50, #beware
       "marker_anchor" => [10,35],
        "shadow_anchor" => [10,35],
      
       
    }
  end



end
