class ProposalsController < ApplicationController

	def show
		@proposal = Proposal.find(params[:id])
	end

	def create
		@proposal = Proposal.new(proposal_params)
		@proposal.developer = current_developer
		@proposal.project = Project.find(params[:project_id])
		@proposal.save
		if @proposal.save!
            redirect_to @proposal, notice: 'Proposta enviada com sucesso, esperando aprovação'
        else
            render :new
        end
	end

	private

	def proposal_params
		params.require(:proposal).permit(:motivation, :hourly_rate, 
			:weekly_available_hours, :expected_completion)
	end
end