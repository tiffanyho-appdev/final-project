# == Schema Information
#
# Table name: hotels
#
#  id            :integer          not null, primary key
#  hotel_name    :string
#  hotel_address :string
#  hotel_rating  :float
#  hotel_link    :string
#  hotel_pic     :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Hotel < ApplicationRecord
    has_many :planned_stays, :dependent => :destroy
    
    has_many :days, :through => :planned_stays, :source => :day
    has_many :itineraries, :through => :days, :source => :itinerary
end
