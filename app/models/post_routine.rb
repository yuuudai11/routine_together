class PostRoutine < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy

  enum genre: { study: 0, exercise: 1, others: 2}

end
