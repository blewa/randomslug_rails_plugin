# Randomslug

def randomslug(len)
  # Since we can't guarantee enough entropy with small lenghts, we'll just
  # retry if it's not long enough.
  begin
    slug = SecureRandom.base64(len * 4).scan(/[a-z]/).to_s[0, len]
  retry if slug.length < len
  end
  
  return slug
end