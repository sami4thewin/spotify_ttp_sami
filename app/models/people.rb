class People < ApplicationRecord

  validates_presence_of :name, :favoriteCity

end
