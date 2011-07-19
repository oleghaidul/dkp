class Tankman < ActiveRecord::Base
  has_many :histories
  belongs_to :post

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

  validates_presence_of :name, :rate



end
