# == Schema Information
#
# Table name: planned_funs
#
#  id           :integer          not null, primary key
#  place_id     :string
#  day_id       :integer
#  order_in_day :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  itinerary_id :integer
#

class PlannedFun < ApplicationRecord

end
