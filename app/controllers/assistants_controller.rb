class AssistantsController < ApplicationController
  def index
    @assistants = current_user.assistants
    @assistant = Assistant.new
  end

  def create
    @assistants = current_user.assistants
    @assistant = Assistant.new(assistant_params)
    @assistant.user = current_user
    # raise
    if @assistant.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.append(:assistants, partial: "assistants/assistant",
          locals: {assistant: @assistant})
        end
        format.html { redirect_to questions_path }
      end
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def assistant_params
    params.require(:assistant).permit(:question)
  end
end
