class User < ApplicationRecord
  #email ve username alanlarının boş olmamasını ve benzersiz olması gerektiğini belirttik.
  validates :email, :username, presence: true, uniquenness: true 

  #first_name ve last_name alanlarının boş olmaması gerektiğini belirttik.
  validates :first_name, :last_name, presence: true
end
