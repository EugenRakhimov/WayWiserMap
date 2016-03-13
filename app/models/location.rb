class Location
  def self.all
    return [
      {:info=>"Extreme Health & Nutrition Superstore", :lat=>-36.849118, :lng=>174.75818}, 
      {:info=>"Extreme Edge Rock Climbing", :lat=>-36.890965134949624, :lng=>174.85063076019287}, 
      {:info=>"Extreme Edge Indoor Rock Climbing", :lat=>-36.907920241355896, :lng=>174.63758289813995}, 
      {:info=>"Extreme Pc", :lat=>-36.88407712034136, :lng=>174.73198222521816}, 
      {:info=>"eXtreme", :lat=>-36.76603647992121, :lng=>174.73644072729263}, 
      {:info=>"Extreme Trampoline", :lat=>-36.927270024448184, :lng=>174.78625774383545}, 
      {:info=>"Extreme Indoor Kart", :lat=>-36.944023, :lng=>174.880729}, 
      {:info=>"ExtremePC", :lat=>-36.883541, :lng=>174.731873}, 
      {:info=>"extreme go karting", :lat=>-36.943978, :lng=>174.88097}, 
      {:info=>"Extreme Indoor GoK-arting", :lat=>-36.9286271221012, :lng=>174.91262398139864}, 
      {:info=>"Extreme Clothing", :lat=>-37.014426, :lng=>174.894832}, {:info=>"Extreme Pizza", :lat=>-37.032196, :lng=>174.867671}, 
      {:info=>"100% Extreme Albany", :lat=>-36.7227102066969, :lng=>174.70693878987947},
      {:info=>"Freelance Adventures (North Shore Holiday Programmes)", :lat=>-36.777031524998996, :lng=>174.76900041103363}, 
      {:info=>"Bigfoot Adventures", :lat=>-36.784803, :lng=>174.741588}, 
      {:info=>"Freelance Adventures", :lat=>-36.73958913797198, :lng=>174.7201144695282}, 
      {:info=>"Freelance Adventures (Manukau Holiday Programmes)", :lat=>-37.00306675892849, :lng=>174.913512468338}, 
      {:info=>"Zipline Eco Adventures", :lat=>-36.802152485159084, :lng=>175.06725770947426}, 
      {:info=>"Freelance Adventures (Orewa Holiday Programmes)", :lat=>-36.574706635005086, :lng=>174.69133973121643}, 
      {:info=>"Tree Adventures", :lat=>-36.73990035565431, :lng=>174.42018245168381}, 
      {:info=>"4trak adventures", :lat=>-36.74543738365173, :lng=>174.427902}, 
      {:info=>"Bigfoot Adventures", :lat=>-36.739728, :lng=>174.420447},
      {:info=>"St Pierre's Sushi & Seafood", :lat=>-36.850011340407114, :lng=>174.76398468017578},
      {:info=>"umi sushi", :lat=>-36.84983369089178, :lng=>174.76392374875977}, 
      {:info=>"Victoria Sushi", :lat=>-36.84761044569667, :lng=>174.7578050877453}, 
      {:info=>"St Pierre's Sushi & Seafood", :lat=>-36.8577969220888, :lng=>174.76034951054183}, 
      {:info=>"Sumo Yakitori Sushi", :lat=>-36.84659002076927, :lng=>174.76428508758545}, 
      {:info=>"Sumo Sushi", :lat=>-36.84595342401992, :lng=>174.76731422451496}, 
      {:info=>"Bien Sushi", :lat=>-36.84680499889728, :lng=>174.76866016207828}, 
      {:info=>"The Sushi Room", :lat=>-36.84776975195719, :lng=>174.76702042715806}, 
      {:info=>"St Pierre's Sushi & Seafood", :lat=>-36.84369658957306, :lng=>174.76592123508453}, 
      {:info=>"Yummy Sushi", :lat=>-36.85199456345288, :lng=>174.7639543404183}, 
      {:info=>"St Pierres Sushi", :lat=>-36.861414008897704, :lng=>174.77000606791364}, 
      {:info=>"Matsu Sushi", :lat=>-36.848419696560576, :lng=>174.75381740769114}, 
      {:info=>"Sushi Pac", :lat=>-36.84925821496481, :lng=>174.76454067737376}, 
      {:info=>"Cima Sushi", :lat=>-36.848241, :lng=>174.750588}, 
      {:info=>"Sushi", :lat=>-36.84660071500915, :lng=>174.76416338297983}, 
      {:info=>"St Pierre's Sushi & Seafood", :lat=>-36.848076479285325, :lng=>174.74405100626862}, 
      {:info=>"Sushi Train Chancery Station", :lat=>-36.847879243348174, :lng=>174.76720715993747}, 
      {:info=>"Sushi Train", :lat=>-36.84377397196287, :lng=>174.76328641881372}, 
      {:info=>"Sushi Pac", :lat=>-36.84468984236407, :lng=>174.76605492844615}, 
      {:info=>"St. Pierre's Sushi", :lat=>-36.85024790540814, :lng=>174.7632813201455}, 
      {:info=>"Sushi Factory", :lat=>-36.84716, :lng=>174.766375}, 
      {:info=>"Sushi&sake", :lat=>-36.847692, :lng=>174.761437}, 
      {:info=>"yb sushi", :lat=>-36.850326, :lng=>174.765012}, 
      {:info=>"Sushi & Sake", :lat=>-36.851056, :lng=>174.764636}, 
      {:info=>"St Pierre's Sushi", :lat=>-36.854260763765375, :lng=>174.76793111650315}, 
      {:info=>"Umiya Sushi", :lat=>-36.846406, :lng=>174.765975}, 
      {:info=>"Samurai Sushi", :lat=>-36.850372, :lng=>174.763451}, 
      {:info=>"Isha Sushi", :lat=>-36.84816421822228, :lng=>174.76546350856322}, 
      {:info=>"Kami Sushi", :lat=>-36.84753108, :lng=>174.761552}, 
      {:info=>"Nikko Sushi and Sake Bar", :lat=>-36.850006, :lng=>174.764126}]
  end
  def self.around(center_point, south_west = nil, north_east = nil)
      south_west = {lat:center_point[:lat]-0.0876, lng:center_point[:lng]-0.23 } if !south_west
      north_east = {lat:center_point[:lat]+0.0876, lng:center_point[:lng]+0.23 } if !north_east          
      points = all.select { |point| point_in_bounds?(point,south_west,north_east) }
      # I select points that have more distance from        
      sorted = points.sort {|point_x, point_y| distance(point_x, center_point) <=> distance(point_y,center_point)}
      return sorted.reverse[0,10] if sorted.length > 10
      return sorted
  end
  def self.point_in_bounds?(point,south_west,north_east)     
      return false if (point[:lat] < south_west[:lat])
      return false if (point[:lng] < south_west[:lng])
      return false if (point[:lat] > north_east[:lat])
      return false if (point[:lng] > north_east[:lng])
      return true
  end
  def self.distance(point1, point2)
      (point1[:lat]-point2[:lat])**2+(point1[:lng]-point2[:lng])**2
  end
end