class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    belongs_to :tailor
    belongs_to :seller
    belongs_to :admin

    def role
    	return "a" if self.admin
    	return "s" if self.seller
    	return "t" if self.tailor
    	"b"    				
    end
end
