class Comment < ApplicationRecord
  belongs_to :recipe
  belongs_to :user
  belongs_to :parent, class_name:'Comment', optional: true
  has_many :comments, foreign_key: :parent_id
end
