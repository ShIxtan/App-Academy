# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  album_id   :integer          not null
#  name       :string           not null
#  bonus      :string(1)        not null
#  lyrics     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ActiveRecord::Base
  validates :album, :name, :bonus, :lyrics, presence: true
  validates :bonus, inclusion: { in: %w(B R) }

  belongs_to(
    :album,
    class_name: 'Album',
    foreign_key: :album_id,
    primary_key: :id
  )

  has_many(
    :notes,
    class_name: 'Note',
    foreign_key: :track_id,
    primary_key: :id,
    dependent: :destroy
  )


  has_one :band, through: :album, source: :band
end
