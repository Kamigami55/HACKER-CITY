class BillboardController < ApplicationController
    before_action :set_announcement, :only => [ :show, :edit, :update, :destroy]
    def index
        @announcements = Announcement.page(params[:page]).per(7)
    end
    def  new
        @announcement = Announcement.new
        @page_title = "HACKER CITY - New announcement"
    end
    def create
        @announcement = Announcement.new(announcement_params)
        if @announcement.save
            redirect_to billboard_index_path
            flash[:notice] = "Post successfully."
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
            flash[:notice] = "Update successfully."
        else
            render :action => :edit
        end
    end
    def destroy
        @announcement.destroy
        redirect_to billboard_index_path
        flash[:alert] = "Delete successfully"
    end
    
private
    def announcement_params
        params.require(:announcement).permit(:title, :date,:description)
    end
    def set_announcement
        @announcement = Announcement.find(params[:id])
    end
end
