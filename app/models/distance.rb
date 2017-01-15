class Distance
  include HTTParty
  include ActiveModel::Model

  URL = "https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&origins=%s&destinations=%s&key=AIzaSyAwnJakQLD1DPjeRgB-oDoBZAMs4WrH2Jo"

  attr_accessor :origin, :destination

  validates :origin, :destination, presence: true

  def for_car
    self.class.get(url)
  end

  private

  def url
    URL % [ origin, destination ]
  end
end
