require 'bcrypt'
# require './data_mapper_setup.rb'

class User
  attr_reader :password
  attr_accessor :password_confirmation

  include DataMapper::Resource

  property :id, Serial
  property :email, String, required: true
  property :password_digest, Text

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  validates_confirmation_of :password
  #validates_presence_of :email       # implied by required: true (in DataMapper)
  validates_presence_of :password

end