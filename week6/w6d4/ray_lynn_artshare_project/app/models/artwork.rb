class Artwork < ApplicationRecord
    validates :artwork_id, presence: true, uniqueness: {scope: :artist_id}
    validates :artist_id, presence: true, uniqueness: true 

    belongs_to :artist,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :User


    has_many :artwork_shares,
        foreign_key: :artwork_id,
        class_name: :artwork_shares

    has_many :shared_viewers,
        through: :artwork_shares,
        source: :viewer

end