class PostRoutine < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  enum genre: { study: 0, exercise: 1, others: 2}

  validates :routine_info, length: { maximum: 30}
  validates :routine_info, presence: true


  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end

end
