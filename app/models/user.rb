# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  full_name       :string(255)
#  password_digest :string(255)
#  email           :string(255)
#  avatar          :string(255)
#  enabled         :boolean
#  role            :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  has_secure_password
end
