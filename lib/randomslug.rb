# Randomslug

def randomslug(len)
  # Since we can't guarantee enough entropy with small lenghts, we'll just
  # retry if it's not long enough.
  begin
    slug = SecureRandom.base64(len * 4).scan(/[a-z]/).join[0, len]
    
    if slug.length < len
      raise "ShortLengthException" 
    end

  rescue ShortLengthException
    retry
  end
  
  return slug
end