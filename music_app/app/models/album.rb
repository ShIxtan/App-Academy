# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  band_id    :integer          not null
#  category   :string(1)        not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string           not null
#

class Album < ActiveRecord::Base
  validates :band, :category, :name, presence: true
  validates :category, inclusion: { in: %w(L S) }

  has_many(
    :tracks,
    class_name: 'Track',
    foreign_key: :album_id,
    primary_key: :id
  )

  belongs_to(
    :band,
    class_name: 'Band',
    foreign_key: :band_id,
    primary_key: :id,
    dependent: :destroy
  )
end
