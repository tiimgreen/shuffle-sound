class Playlist < ActiveRecord::Base
  before_create :set_ref

  belongs_to :user

  has_many :tracks, dependent: :destroy

  validates :name, presence: true, length: { maximum: 100 }

  def to_param
    ref.to_s
  end

  def total_length
    seconds = 0
    self.tracks.each do |track|
      seconds += track.length_in_seconds
    end

    time = Time.at(seconds).utc

    if time.strftime("%H") == "00"
      time.strftime("%Mm %Ss")
    else
      time.strftime("%Hh %Mm")
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
