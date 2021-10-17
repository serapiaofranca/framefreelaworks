class ProjectsController < ApplicationController
    before_action :authenticate_manager!, only: [:new, :create, :my_projects]      

    def show
        if current_manager || current_developer.profile
            @project = Project.find(params[:id])    
            @proposal = Proposal.new   
        else
            redirect_to root_path
        end
    end
    

    def new
        @project = Project.new
    end

    def create
        @project = current_manager.projects.new(project_params)
        if @project.save
            redirect_to @project, notice: 'Projeto cadastrado com sucesso'
        else
            render :new
        end
    end

    def my_projects
        @projects = current_manager.projects
    end

    def search_projects                  
        @projects = Project.where("requirements ||
                                          title || 
                                          description like ?", "%#{params[:search]}%")
        render :search_projects                        
    end   
    
    private

    def project_params
        params.require(:project).permit(:title, :description, :requirements, :hourly_rate,
            :expiration_date, :require_presential_meetings, :start_date, :end_date)
    end
end