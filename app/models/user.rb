class User < ActiveRecord::Base
  has_password
  validates_presence_of :username
  validates_format_of :username, :with => /^[a-z0-9_]+$/i, :message => 'may only contain letters, numbers and underscores'
end

