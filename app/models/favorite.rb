class Favorite < ApplicationRecord

  belongs_to :post_routine
  belongs_to :user

end
