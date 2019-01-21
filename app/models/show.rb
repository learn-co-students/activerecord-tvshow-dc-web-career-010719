class Show < ActiveRecord::Base

  def self.highest_rating
    self.most_popular_show.rating
  end

  def self.most_popular_show
    order(rating: :desc).first
  end

  def self.lowest_rating
    self.least_popular_show.rating
  end

  def self.least_popular_show
    order(rating: :asc).first
  end

  def self.ratings_sum
    self.sum(:rating)
  end

  def self.popular_shows
    where("rating > ?", 5)
  end

  def self.shows_by_alphabetical_order
    order(:name)
  end
end
