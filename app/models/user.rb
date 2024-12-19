class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #bir kullanıcının birden fazla tweeti olabilir
  has_many :tweets
  #bir kulanıcının birden fazla yorumu olabilr
  has_many :comments
  #email ve username alanlarının boş olmamasını ve benzersiz olması gerektiğini belirttik.
  validates :email, :username, presence: true, uniqueness: true 
  #her kullanıcının bir profil resmi olmalı
  has_one_attached :profile_picture
  #first_name ve last_name alanlarının boş olmaması gerektiğini belirttik.
  validates :first_name, :last_name, presence: true
end
