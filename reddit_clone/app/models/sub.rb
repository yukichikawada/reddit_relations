class Sub < ApplicationRecord
  validates :title, :description, presence: true

  belongs_to :user,
    foreign_key: :moderator,
    class_name: :User

  has_many :posts,
    foreign_key: :sub_id,
    class_name: :Post

end
