class Track < ActiveRecord::Base
  belongs_to :playlist

  validates :url, uniqueness: { case_sensitive: false,
                                scope: :playlist,
                                message: "that song is already in the playlist" }

  def title
    get_info
    @parsed_response['title']
  end

  def thumbnail
    get_info
    @parsed_response['thumbnail_url']
  end

  def html
    get_info
    @parsed_response['html']
  end

  def length
    get_info
    Time.at(@video_info.duration).utc.strftime("%M:%S")
  end

  def length_in_seconds
    get_info
    @video_info.duration
  end

  private

  def get_info
    @url = "http://www.youtube.com/oembed?url=#{self.url}&format=json"
    @parsed_response = JSON.parse(HTTParty.get(@url).to_json)
    @video_info = VideoInfo.new(self.url)
  end
end
