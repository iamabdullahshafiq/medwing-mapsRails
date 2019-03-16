# == Schema Information
#
# Table name: locations
#
#  id          :integer          not null, primary key
#  title       :string(100)      not null
#  description :text
#  latitude    :float            not null
#  longitude   :float            not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Location < ApplicationRecord
end
