class Article < ApplicationRecord
  belongs_to :user
  validates :title, :presence => true, :uniqueness => true, :length => { :maximum => 100 }
  validates :author, :presence => true, :uniqueness => false, :length => { :maximum => 100 }
end
