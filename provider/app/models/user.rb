class User
  include Mongoid::Document

  field :email, type: String
  field :password, type: String

  has_many :posts

  index({email: 1}, {unique: true})

end
