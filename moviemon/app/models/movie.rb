class Movie
  def initialize(attributes = {})
    attributes.each do |movie|
      @title = movie["Title"]
      @year = movie["Year"]
      @director = movie["Director"]
      @genre = movie["genre"]
      @rating = movie["Ratings"][0]["Value"]
      @poster = movie["Poster"]
    end
  end
end