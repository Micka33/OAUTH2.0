class Post
  include Mongoid::Document

  field :title, type: String

  belongs_to :user, index: true
end
