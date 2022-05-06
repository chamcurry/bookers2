class Book < ApplicationRecord
  belongs_to :user
# 　validates :title, presence: true
#   validates :body, presence: true
end