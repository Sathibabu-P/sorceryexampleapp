class Teacher < ActiveRecord::Base
	 has_many :posts,  :as => :author, dependent: :destroy
end
