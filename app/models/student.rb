class Student < ActiveRecord::Base
	
	 has_many :posts, :as => :author, dependent: :destroy
end
