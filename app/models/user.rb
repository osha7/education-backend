class User < ApplicationRecord
    has_secure_password

    validates :user_name, uniqueness: true, presence: true
    validates :email, uniqueness: true, presence: true
    validates :password_digest, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    # ex of how else to write the above: validates_presence_of :name, :title, :content
end
