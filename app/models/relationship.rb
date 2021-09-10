class Relationship < ApplicationRecord
  # follower=>フォローする人　followed=>フォローされる
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
end
