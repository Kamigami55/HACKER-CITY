class BillboardController < ApplicationController
    before_action :set_announcement, :only => [ :show, :edit, :update, :destroy]
    def index
        @announcements = Announcement.all
    end
    def  new
        @announcement = Announcement.new
        @page_title = "HACKER CITY - Make a announcement"
    end
    def create
        @announcement = Announcement.new(announcement_params)
        if @announcement.save
            redirect_to :action => :index
        else
            render :action => :new
        end
    end
    def show
        @page_title = "HACKER CITY - " + @announcement.title
    end
    def edit
        @page_title = "HACKER CITY - " + @announcement.title
    end
    def update
        if @announcement.update(announcement_params)
            redirect_to :action => :show, :id => @announcement
        else
            render :action => :edit
        end
    end
    def destroy
        @announcement.destroy
        redirect_to :action => :index
    end
    
private
    def announcement_params
        params.require(:announcement).permit(:title, :date,:description)
    end
    def set_announcement
        @announcement = Announcement.find(params[:id])
    end
end
