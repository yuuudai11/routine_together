class Comment < ApplicationRecord


  belongs_to :post_routine
  belongs_to :user

  validates :comment,length: {minimum: 1, maximum: 50}

end
