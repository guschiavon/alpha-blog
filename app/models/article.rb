class Article < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { minimum: 6, maximum: 100 } # the entry needs to have a title which is between 6 and 100 characters in order to be saved as a database record
  validates :description, presence: true, length: { minimum: 20, maximum: 3500 } # the entry needs to have a description between 20 & 500 words in order to be saved as a database record
  has_one_attached :cover_picture
end
