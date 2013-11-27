# This implementation is related to this issue : https://github.com/applicake/doorkeeper/issues/307
# Here is the reason : https://github.com/applicake/doorkeeper/pull/285
# Here is the solution : http://stackoverflow.com/questions/19299806/how-to-make-a-rails-4-api-with-mongoid-orm-an-oauth2-provider/20038694#20038694
module Moped
  module BSON
    ObjectId = ::BSON::ObjectId

    class Document < Hash
      class << self
        def deserialize(io, document = new)
          __bson_load__(io, document)
        end

        def serialize(document, io = "")
          document.__bson_dump__(io)
        end
      end
    end
  end
end