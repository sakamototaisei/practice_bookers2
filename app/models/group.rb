class Group < ApplicationRecord
  has_many :group_users
  # グループは複数のユーザーを持つ。group_usersから参加可能
  has_many :users, through: :group_users, dependent: :destroy
  # グループオーナー表示のために

  validates :name, presence: true
  validates :introduction, presence: true
  attachment :image, destroy: false
end
