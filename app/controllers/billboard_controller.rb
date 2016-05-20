class BillboardController < ApplicationController
	def index
		@announcements = Announcement.all
	end
	def  new
		@announcement = Announcement.new
	end
	def create
  		@announcement = Announcement.new(announcement_params)
  		@announcement.save

  		redirect_to :action => :index
                end

                private

def announcement_params
  params.require(:announcement).permit(:title, :date,:description)
end
end
