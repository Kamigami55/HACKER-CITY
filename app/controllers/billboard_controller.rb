class BillboardController < ApplicationController
	def index
		@announcements = Announcement.all
	end
end
