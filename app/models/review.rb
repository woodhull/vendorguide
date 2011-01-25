class Review < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :user
  validates_presence_of :vendor
  validates_presence_of :score
  validates_presence_of :description
  validates_numericality_of :score
end
