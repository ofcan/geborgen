require 'rails_helper'

RSpec.describe PostsHelper, type: :helper do
  
  describe "extract youtube video id" do

    it "should extract youtube video id properly" do
      link = 'https://www.youtube.com/watch?v=9bZkp7q19f0'
      link_extract = extract_youtube_video_id(link)
      expect(link_extract).to eq('9bZkp7q19f0')
    end

  end

end
