class SectionsController < ApplicationController
  def create
    @entry = Entry.find(params[:entry_id])
    @section = @entry.sections.build(section_params)
    if @section.save
        redirect_to entry_path(@entry)
    else
        redirect_to entries_path 
    end
  end

  private
    def section_params
      params.require(:section).permit(:data)
    end

end