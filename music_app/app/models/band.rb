# == Schema Information
#
# Table name: bands
#
#  id         :integer          not null, primary key
#  name       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Band < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many(
    :albums,
    class_name: 'Album',
    foreign_key: :band_id,
    primary_key: :id,
    dependent: :destroy
  )

  has_many(
    :tracks,
    through: :albums,
    source: :track
  )
end
