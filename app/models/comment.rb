class Comment < ApplicationRecord
  validates :body, presence: true, allow_blank: false
  belongs_to :article, optional: true
end
