# create a new Class, User, that has the following attributes:
# - name
# - email
# - password
class User
    attr_accessor :name, :email, :password, :rooms
  
    def initialize(name, email, password)
      @name = name
      @email = email
      @password = password
      @rooms = []
    end
    #add a method to user so, user can enter to a room
    #user.enter_room(room)
    def enter_room(room)
      @rooms << room
      room.users << self
    end
    #add a method to user so, user can send a message to a room
    #user.send_message(room, message)
    #user.ackowledge_message(room, message)

    def send_message(room, message)
      Message.new(self, room, message)
    end
  
    def acknowledge_message(room, message)
    end
  end
# create a new Class, Room, that has the following attributes:
# - name
# - description
# - users
class Room
    attr_accessor :name, :description, :users
  
    def initialize(name, description)
      @name = name
      @description = description
      @users = []
    end
    # add a method to a room, so it can broadcast a message to all users
    # room.broadcast(message)
    def broadcast(message)
      @users.each do |user|
        user.acknowledge_message(self, message)
      end
    end
  end
  
# create a new Class, Message, that has the following attributes:
# - user
# - room
# - content
class Message
    attr_accessor :user, :room, :content
  
    def initialize(user, room, content)
      @user = user
      @room = room
      @content = content
    end