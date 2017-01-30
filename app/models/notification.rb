class Notification < ActiveRecord::Base
    
    belongs_to :user

    validates_presence_of :user_id
    validates_presence_of :notify_msg
    
    
def edit
    
end

def index

end

    
def show

end


end
