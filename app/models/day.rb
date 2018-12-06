# == Schema Information
#
# Table name: days
#
#  id                 :integer          not null, primary key
#  itinerary_id       :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  order_in_itinerary :integer
#

class Day < ApplicationRecord
    belongs_to :itinerary
    has_one :planned_stay, :dependent => :destroy
    has_many :planned_meals, :dependent => :destroy
    has_many :planned_funs, :dependent => :destroy
    
    has_one :hotel, :through => :planned_stay, :source => :hotel
    has_many :rests, :through => :planned_meals, :source => :rest
    has_many :places, :through => :planned_funs, :source => :place
end
