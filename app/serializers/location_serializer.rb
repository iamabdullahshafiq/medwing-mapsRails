# == Schema Information
#
# Table name: locations
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  latitude    :float
#  longitude   :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class LocationSerializer < ActiveModel::Serializer
  attributes :id, :title
end
