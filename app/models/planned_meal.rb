# == Schema Information
#
# Table name: planned_meals
#
#  id           :integer          not null, primary key
#  rest_id      :integer
#  day_id       :integer
#  order_in_day :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  itinerary_id :integer
#

class PlannedMeal < ApplicationRecord
    belongs_to :rest, :class_name => "Restaurant"
    belongs_to :day
    
    
end
