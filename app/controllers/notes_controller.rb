class NotesController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @note = Note.new
    authorize(@note)
  end
  
  def create
    @note = Note.new(note_params)
    @note.user = current_user
    authorize(@note)
    if @note.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    note_finder
    authorize(@note)
  end

  def update
    note_finder
    authorize(@note)
    if @note.update(note_params)
      redirect_to root_path
    else
      render :edit  
    end
  end
  
 
  
  def show
    note_finder
    authorize(@note)
  end

  def index
    @notes = Note.none
    if current_user
      @notes = policy_scope(Note.all)
    end
  end

  def destroy
    note_finder
    authorize(@note)
    @note.delete
    redirect_to notes_path
  end

  private

  def note_finder
    @note = Note.finde(params[:id])
  end

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
