class Post < ActiveRecord::Base
  has_many :tankmen

  validates_presence_of :title

end
