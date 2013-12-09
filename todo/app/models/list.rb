class List < ActiveRecord::Base
  belongs_to :user
  has_many :dos
  has_many :sharings

end
