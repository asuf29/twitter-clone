class Comment < ApplicationRecord
  #yorumun hangi tweet e ait olduğunu belirttik
  belongs_to :tweet 
  belongs_to :user
end
