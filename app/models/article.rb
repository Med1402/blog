class Article < ApplicationRecord
  include Visible

  belongs_to :user
  has_many :comments, dependent: :destroy

  has_one_attached :image

  validates :title, presence: true, uniqueness: true
  validates :body, presence: true, length: { minimum: 10 }
end

