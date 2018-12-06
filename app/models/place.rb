# == Schema Information
#
# Table name: places
#
#  id                :integer          not null, primary key
#  place_name        :string
#  place_address     :string
#  place_description :string
#  place_rating      :float
#  place_link        :string
#  place_pic         :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Place < ApplicationRecord
    has_many :planned_funs, :dependent => :destroy
    
    has_many :days, :through => :planned_funs, :source => :day
    has_many :itineraries, :through => :days, :source => :itinerary
end
