# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :text             not null
#  password_digest :text             not null
#  session_token   :text             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'bcrypt'

class User < ActiveRecord::Base
  attr_reader :password

  validates :email, :password_digest, :session_token, presence: true
  validates :email, :session_token, uniqueness: true
  after_initialize :ensure_session_token

  has_many(
    :notes,
    class_name: 'Note',
    foreign_key: :user_id,
    primary_key: :id,
    dependent: :destroy
  )


  def reset_session_token!
    self.session_token = generate_session_token
    save!
    session_token
  end

  def self.find_by_credentials(email, password)
    user = find_by(email: email)

    return nil if user.nil?
    user.password?(password) ? user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  private

  def generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def ensure_session_token
    self.session_token ||= generate_session_token
  end
end
