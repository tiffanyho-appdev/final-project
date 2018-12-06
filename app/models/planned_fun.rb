# == Schema Information
#
# Table name: planned_funs
#
#  id           :integer          not null, primary key
#  place_id     :integer
#  day_id       :integer
#  order_in_day :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  itinerary_id :integer
#

class PlannedFun < ApplicationRecord
    belongs_to :place, :class_name => "Place"
    belongs_to :day
end
