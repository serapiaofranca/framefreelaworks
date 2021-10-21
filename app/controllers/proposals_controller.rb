class ProposalsController < ApplicationController

	before_action :set_proposal, only: %i[ show destroy accept reject cancel ]

	def show		
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

	def destroy
		@project = Project.find(@proposal.project.id)
		@proposal.destroy
		redirect_to @project, notice: t('.destroyed')
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
			:weekly_available_hours, :expected_completion, :project)
	end

	def set_proposal
		@proposal = Proposal.find(params[:id])
	end
end