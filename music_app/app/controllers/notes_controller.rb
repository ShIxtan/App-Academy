class NotesController < ApplicationController
  def create
    note = Note.new(note_params)
    note.user_id = current_user.id
    note.track_id = params[:track_id]
    note.save

    redirect_to track_url(params[:track_id])
  end

  def destroy
    Note.destroy(params[:id])
    redirect_to track_url(params[:track_id])
  end

  private

  def note_params
    params.require(:note).permit(:text)
  end
end
