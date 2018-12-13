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

end
