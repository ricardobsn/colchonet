class User < ApplicationRecord
  EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  validates_presence_of :email, :full_name, :location
  validates_length_of :bio, minimum: 10, allow_blank: false
  validates_uniqueness_of :email

  has_secure_password
  private

  def email_format
    errors.add(:email, :invalid) unless email.match(EMAIL_REGEXP)
  end
end
