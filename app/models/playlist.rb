class Playlist < ActiveRecord::Base
  before_create :set_ref

  belongs_to :user

  has_many :tracks, dependent: :destroy

  validates :name, presence: true, length: { maximum: 100 }

  def to_param
    ref.to_s
  end

  def total_length
    time = 0
    self.tracks.each do |track|
      time += track.length_in_seconds
    end

    if Time.at(time).utc.strftime("%H") == "00"
      Time.at(time).utc.strftime("%Mm %Ss")
    else
      Time.at(time).utc.strftime("%Hh %Mm")
    end
  end

  private

  def set_ref
    begin
      ref = rand(999_999).to_s.center(6, rand(9).to_s).to_i
    end while Playlist.exists?(ref: ref)
    self.ref = ref
  end
end
