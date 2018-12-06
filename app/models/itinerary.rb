# == Schema Information
#
# Table name: itineraries
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  name_of_trip     :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  days_in_trip     :integer
#  location_of_trip :string
#

class Itinerary < ApplicationRecord
    belongs_to :user
    has_many :days, :dependent => :destroy

    has_many :hotels, :through => :days, :source => :hotel
    has_many :rests, :through => :days, :source => :rests
    has_many :places, :through => :days, :source => :places
end
