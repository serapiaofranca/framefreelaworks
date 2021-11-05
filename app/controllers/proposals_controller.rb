class ProposalsController < ApplicationController
  before_action :authenticate_developer!, only: %i[new create cancel]
  before_action :authenticate_manager!, only: %i[new accept reject]

  before_action :set_proposal, only: %i[show destroy accept reject cancel]

  def show
    if current_manager || current_developer && current_developer.profile
      @proposal = Proposal.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def new
    @project = Project.find(params[:project_id])
    @proposal = Proposal.new
  end

  def create
    @proposal = current_developer.proposals.new(proposal_params)
    @proposal.project = Project.find(params[:project_id])

    if @proposal.save
      redirect_to @proposal, notice: t('.success')
    else
      @project = @proposal.project
      render :new
    end
  end

  def accept
    @proposal.accepted!
    redirect_to @proposal.project
  end

  def reject
    @proposal.justification = params[:justification]
    if @proposal.valid? && @proposal.rejected!
      redirect_to @proposal.project
    else
      render :show
    end
  end

  def cancel
    @proposal.justification = params[:justification]
    if @proposal.valid? && @proposal.canceled!
      redirect_to @proposal.project
    else
      render :show
    end
  end

  private

  def proposal_params
    params.require(:proposal).permit(:motivation, :hourly_rate,
                                     :weekly_available_hours, :expected_completion, :project_id)
  end

  def set_proposal
    @proposal = Proposal.find(params[:id])
  end
end
