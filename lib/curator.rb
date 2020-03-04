class Curator
  attr_reader :photographs, :artists
  def initialize
    @photographs = []
    @artists = []
  end

  def add(photo)
    @photographs << photo
  end
end
