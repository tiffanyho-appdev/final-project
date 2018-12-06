# == Schema Information
#
# Table name: restaurants
#
#  id           :integer          not null, primary key
#  rest_name    :string
#  rest_address :string
#  rest_genre   :string
#  rest_rating  :float
#  rest_link    :string
#  rest_pic     :string
#  rest_menu    :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Restaurant < ApplicationRecord
    has_many :planned_meals, :foreign_key => "rest_id", :dependent => :destroy
    
    has_many :days, :through => :planned_meals, :source => :day
    has_many :itineraries, :through => :days, :source => :itinerary
end
