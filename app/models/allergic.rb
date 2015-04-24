class Allergic < ActiveRecord::Base
	belongs_to :kid
	belongs_to :allergy
end
