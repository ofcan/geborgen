module PostsHelper

  def extract_youtube_video_id(link)
    regEx = /(youtu\.be\/|youtube\.com\/(watch\?(.*&)?v=|(embed|v)\/))([^\?&"'>]+)/
    regEx.match(link)
    return $5
  end
  
    
end
