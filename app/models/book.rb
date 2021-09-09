class Book < ApplicationRecord
  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
  validates :body, length: {maximum: 200}

  # 引数で渡されたユーザーidがfavoritesテーブル内に存在(exists?)
  # するかを調べる。あればtrue,なければfalseを返す
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
