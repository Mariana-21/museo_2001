class Curator
  attr_reader :photographs, :artists
  def initialize
    @photographs = []
    @artists = []
  end

  def add_photograph(photo)
    @photographs << photo
  end

  def add_artist(artist)
    @artists << artist
  end

  def find_artist_by_id(id)
    @artists.find {|artist| artist.id == id}
  end

  def photographs_by_artist
    result = {}
    @artists.each do |artist|
      result[artist] = @photographs.find_all {|photo| photo.artist_id == artist.id}
    end
    result
  end

  def artists_with_multiple_photographs
    photographs_by_artist.map do |artists, photos|
      if photos.count > 1
        artists.name
      end
    end.compact
  end
  def photographs_taken_by_artist_from(country)
    @photographs.find_all do |photo|
      @artists.each do |artist|
        photo.artist_id == artist.id && artist.country == country
      end
      photo
    end
  end
end
