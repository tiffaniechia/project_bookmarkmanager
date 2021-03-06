require 'bcrypt' #bcrypt will generate a password hash

class User

  include DataMapper::Resource
  
    property :id, Serial
    property :email, String, :unique => true, :message => "This email is already taken"
    property :password_digest, Text

    has n, :links, :through => Resource
    has n, :tags, :through => Resource 

    attr_reader :password
    attr_accessor :password_confirmation

    validates_confirmation_of :password, :message => "Sorry, your passwords don't match"
    validates_uniqueness_of :email

    
    

    def password=(password)
      @password = password
      self.password_digest = BCrypt::Password.create(password)
    end  

    def self.authenticate(email, password)
      user = first(:email => email)
      if user && BCrypt::Password.new(user.password_digest) == password
        user
      else
        nil
      end    
    end 

end  