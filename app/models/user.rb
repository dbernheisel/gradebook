class User < ActiveRecord::Base
  attr_accessor :remember_token

  has_many :guardian_relationships, ->(user){ where("guardian_relationships.student_id = :user_id OR guardian_relationships.guardian_id = :user_id", user_id: user.id) }
  has_many :instructor_relationships, ->(user){ where("instructor_relationships.student_id = :user_id OR instructor_relationships.instructor_id = :user_id", user_id: user.id) }
  has_many :assignments, -> { where role: "instructor" }
  has_many :grades, -> { where role: "student" }

  has_secure_password

  validates :email, presence: true,
                    uniqueness: true,
                    format: {
                      with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
                      message: "Not a valid email address",
                      on: :create
                    }
  validates :password, length: { minimum: 8 }, allow_nil: true

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

end
