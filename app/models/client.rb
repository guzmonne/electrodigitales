class Client < ActiveRecord::Base
	attr_accessible :name,
									:member_number,
									:address, 
									:phone,
									:cellphone,
									:email,
									:document
end
