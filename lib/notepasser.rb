require "notepasser/version"
require "notepasser/init_db"
require "camping"
require "pry"

Camping.goes :Notepasser

module Notepasser
end

module Notepasser::Models
  
  class Users < ActiveRecord::Base
  end

  class Messages < ActiveRecord::Base
  end
end

module Notepasser::Controllers
  class Index < R '/'
    def get
    "Welcome to NotePasser"
    end
  end 

  class UserId < R '/users'
    def get(id)
      user = Notepasser::Models::Users.find(id)
      user.to_json
    end

    def put(id)
      new_user = Notepasser::Models::Users.create(id)
      new_user.to_json
    end

    def delete(id)
      delete_user = Notepasser::Models::Users.find(id)
      delete_user.destroy
    end
  end  

  class MessageId < R '/messages/(\d+)'
    def get(id)
      message = Notepasser::Models::Messages.find(id)
      message.to_json 
    end

    def put
      new_message = Notepasser::Models::Messages.create(@input)
      new_message.to_json
    end

    def delete(id)
      delete_message = Notepasser::Models::Messages.find(id)
      delete_message.destroy
    end
  end  
  class MessageController < R '/messages'
    def get
    end

    def put
      
    end

    def delete
    end
  end
end




