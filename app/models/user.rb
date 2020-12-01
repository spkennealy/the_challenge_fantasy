# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  username        :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email          (email) UNIQUE
#  index_users_on_session_token  (session_token) UNIQUE
#  index_users_on_username       (username) UNIQUE
#
class User < ApplicationRecord
    validates :username, :email, :session_token, presence: true
    validates :username, :email, uniqueness: true
    validates :password, length: { minimum: 4, allow_nil: true }


    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        user && user.valid_password?(password_digest) ? user : nil
    end
end
