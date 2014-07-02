class Playlist < ActiveRecord::Base
  before_create :set_ref

  belongs_to :user

  has_many :tracks, dependent: :destroy

  validates :name, presence: true, length: { maximum: 100 }

  def to_param
    ref.to_s
  end

  private

  def set_ref
    begin
      ref = rand(999_999).to_s.center(6, rand(9).to_s).to_i
    end while Playlist.exists?(ref: ref)
    self.ref = ref
  end
end
