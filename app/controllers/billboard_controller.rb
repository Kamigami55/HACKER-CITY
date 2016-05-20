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
    def show
        @announcement = Announcement.find(params[:id])
    end
    def edit
        @announcement = Announcement.find(params[:id])
    end
    def update
        @announcement = Announcement.find(params[:id])
        @announcement.update(announcement_params)
        redirect_to :action => :show, :id => @announcement
end
    
private
    def announcement_params
        params.require(:announcement).permit(:title, :date,:description)
    end
end
