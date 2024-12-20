class Tweet < ApplicationRecord
  #tweetin hangi kullanıcıya ait olduğunu belirttik.
  belongs_to :user
  #bir tweet birden fazla yoruma sahip olabilr
  has_many :comments, dependent: :destroy
end
