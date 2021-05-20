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

  def edit
    @section = Section.find_by(id: params[:id])
    @entry = Entry.find_by(id: @section.entry_id)
    if !@section || @entry.user != current_user
        redirect_to entry_params(@entry)
    end
  end

  def update
    @section = Section.find_by(id: params[:id])
    @entry = Entry.find_by(id: @section.entry_id)
    if @section.update(section_params)
      redirect_to entry_path(@entry)
    else
      redirect_to entry_path(@entry)
    end
  end

  def destroy
    @section = Section.find_by(id: params[:id])
    @entry = Entry.find_by(id: [@section.entry_id])
    if @section
        @section.destroy
    end
    redirect_to entry_path(@entry)
end

  private
    def section_params
      params.require(:section).permit(:data)
    end

end