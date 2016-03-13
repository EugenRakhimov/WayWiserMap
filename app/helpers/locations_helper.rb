module LocationsHelper
  def point_to_float point
    return nil if !point
    point_f = {lat:point[:lat].to_f,lng:point[:lng].to_f}
  end
end
