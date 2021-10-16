class ProjectsController < ApplicationController
    before_action :authenticate_manager!, only: [:new, :create, :show]
    #before_action :authenticate_developer!, only: [:show, :search_projects]

    def show        
        @project = Project.find(params[:id])    
    end

    def new
        @project = Project.new
    end

    def create
        @project = Project.new(project_params)
        @project.manager = current_manager
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
            :expiration_date, :require_presential_meetings)
    end
end