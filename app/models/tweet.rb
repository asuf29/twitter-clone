class Tweet < ApplicationRecord
  #tweetin hangi kullanıcıya ait olduğunu belirttik.
  belongs_to :user
end
