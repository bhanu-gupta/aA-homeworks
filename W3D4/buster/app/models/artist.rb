class Artist < ApplicationRecord
  has_many :albums,
    class_name: 'Album',
    foreign_key: :artist_id,
    primary_key: :id

  def n_plus_one_tracks
    albums = self.albums
    tracks_count = {}
    albums.each do |album|
      tracks_count[album.title] = album.tracks.length
    end

    tracks_count
  end

  def better_tracks_query
    # TODO: your code here
    tracks_count = {}
    tracks = self.albums.joins(:tracks).select('albums.*','COUNT(*) as tracks_length').group('albums.id')
    tracks.each do |track|
      tracks_count[track.title] = track.tracks_length
    end
    tracks_count
  end
end
