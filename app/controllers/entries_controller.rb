class EntriesController < ApplicationController
    def index
        @entries = current_user.entries

    end

    def show
        @entry = Entry.find_by(id: params[:id])
        @section = Section.new
    end
    
    def new
        @entry = Entry.new
    end

    def create
        @entry = current_user.entries.build(entry_params)
        if @entry.save
            flash[:message] = "Entry Created"
            redirect_to entries_path
        else
            flash[:message] = "Incorrect login information"
            render :new
        end
    end

    def edit
        @entry = Entry.find_by(id: params[:id])
        if !@entry || @entry.user != current_user
            redirect_to entry_params(@entry)
        end
    end

    def update
        @entry = Entry.find_by(id: params[:id])
        if @entry.update(entry_params)
            redirect_to entry_path(@entry)
        else
            render :new
        end
    end
    
    def destroy
        @entry = Entry.find_by(id: params[:id])
        if @entry
            @entry.destroy
        end
        redirect_to entries_path
    end

    private

    def entry_params()
        params.require(:entry).permit(:name, :notes, :status)
    end
end

# <%= form_for([@entry, @section]) do |f| %>
#     <%= f.text_field :data, :placeholder => "Enter a new item..." %>
#     <%= f.submit :style => "display: none" %>
#   <% end %> 