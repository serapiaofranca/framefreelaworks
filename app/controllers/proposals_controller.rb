class ProposalsController < ApplicationController

	def show
		@proposal = Proposal.find(params[:id])
	end

	def create
		@proposal = current_developer.proposals.new(proposal_params)
		@proposal.project = Project.find(params[:project_id])
		
		if @proposal.save
            redirect_to @proposal, notice: t('.success')
        else
            render :new
        end
	end

	def accept
		@proposal = Proposal.find(params[:id])
		@proposal.accepted!
		redirect_to @proposal.project
	end

	def reject
		@proposal = Proposal.find(params[:id])
		@proposal.rejected!
		redirect_to @proposal.project
	end


	private

	def proposal_params
		params.require(:proposal).permit(:motivation, :hourly_rate, 
			:weekly_available_hours, :expected_completion)
	end
end