class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 
 has_many :friendships
 has_many :reviews
 
  devise :database_authenticatable, :registerable,# :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
 # new columns need to be added here to be writable through mass assignment
 
 
end
