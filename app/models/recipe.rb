class Recipe < ApplicationRecord
  USER_MEMOIZATION = {}

  belongs_to :author, class_name: "User", foreign_key: "user_id"

  ##
  # Related author record. If memoize option is true, will attempt to retrieve from
  # memory for faster return.
  #
  # Returns User
  def author_with_optional_memoization(memoize: false)
    return author unless memoize

    USER_MEMOIZATION[user_id] ||= author
  end
end
