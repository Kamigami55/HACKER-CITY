class Announcement < ActiveRecord::Base
	validates_presence_of :title, :date
end
