class User < ActiveRecord::Base
  validates :first_name,
            presence: { message: "can't be blank" }
  validates :last_name,
            presence: { message: "can't be blank" }
  validates :email,
            presence: { message: "can't be blank" },
            uniqueness: { message: "already registered!"},
            format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/, message: "Email not valid" }
  validates :password,
            presence: { message: "can't be blank" },
            length: { minimum: 8, message: "must be at least 8 characters" },
            confirmation: true

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
