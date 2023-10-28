class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :authentication_keys => [:user_name]

  has_one_attached :image
  has_many :post_routines
  has_many :comments
  has_many :favorites

  validates :user_name, length: {minimum: 1, maximum: 10}, uniqueness: true

  def get_profile_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpeg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  #ゲストログイン用メソッド

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.user_name = "ゲスト"
      user.is_deleted = false
    end
  end
# 参考URL https://zenn.dev/airiin/articles/75786bd5864125

end
