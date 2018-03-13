class Post < ApplicationRecord
  validates :title, presence: true 

  belongs_to :author
  belongs_to :sub_id
end
