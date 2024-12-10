class User < ApplicationRecord
  #bir kullanıcının birden fazla tweeti olabilir
  has_many :tweets
  #email ve username alanlarının boş olmamasını ve benzersiz olması gerektiğini belirttik.
  validates :email, :username, presence: true, uniqueness: true 

  #first_name ve last_name alanlarının boş olmaması gerektiğini belirttik.
  validates :first_name, :last_name, presence: true
end
