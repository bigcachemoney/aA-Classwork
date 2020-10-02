class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    
    #has_many :authored_polls
    #has_many :responses
end