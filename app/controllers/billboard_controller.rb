class BillboardController < ApplicationController
    before_action :set_announcement, :only => [ :show, :edit, :update, :destroy]
    def index
        @announcements = Announcement.page(params[:page]).per(5)
    end
    def  new
        @announcement = Announcement.new
        @page_title = "HACKER CITY - Make a announcement"
    end
    def create
        @announcement = Announcement.new(announcement_params)
        if @announcement.save
            redirect_to billboard_index_path
            flash[:notice] = "announcement was successfully created"
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
            redirect_to billboard_url(@announcement)
            flash[:notice] = "event was successfully updated"
        else
            render :action => :edit
        end
    end
    def destroy
        @announcement.destroy
        redirect_to billboard_index_path
        flash[:alert] = "event was successfully deleted"
    end
    
private
    def announcement_params
        params.require(:announcement).permit(:title, :date,:description)
    end
    def set_announcement
        @announcement = Announcement.find(params[:id])
    end
end
