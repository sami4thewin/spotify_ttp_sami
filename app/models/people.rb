class Person < ApplicationRecord

  validates_presence_of :name, :favoriteCity

end
