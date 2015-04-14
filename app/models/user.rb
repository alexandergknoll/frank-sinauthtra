class User < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :email, :password
  validates_format_of :email, :with => /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/,
    :message => "Invalid email address"

  def password
    @password = BCrypt::Password.new(password_digest)
  end

  def password=(user_input)
    @password = BCrypt::Password.create(user_input)
    self.password_digest = @password
  end

  def self.authenticate(credentials)
    if user = self.find_by_email(credentials[:email])
      return user if user.password == credentials[:password]
    end
  end

end
