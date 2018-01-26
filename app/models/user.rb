# frozen_string_literal: true

class User < ApplicationRecord
  include Authentication
  has_many :trips

  validates :email, presence: true
end
