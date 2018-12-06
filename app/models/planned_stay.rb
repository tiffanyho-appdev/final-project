# == Schema Information
#
# Table name: planned_stays
#
#  id           :integer          not null, primary key
#  hotel_id     :integer
#  day_id       :integer
#  order_in_day :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  itinerary_id :integer
#

class PlannedStay < ApplicationRecord
    belongs_to :hotel, :class_name => "Hotel"
    belongs_to :day
    
    
end
