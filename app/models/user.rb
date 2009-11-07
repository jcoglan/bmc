class User < ActiveRecord::Base
  has_password
  validates_presence_of :username
  validates_length_of :username, :within => 3..60
  validates_format_of :username, :with => /^[a-z0-9_]+$/i, :message => 'may only contain letters, numbers and underscores'
end

