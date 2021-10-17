class ProfilesController < ApplicationController
    before_action :authenticate_developer!, only: [:new, :create, :show]      

    def new
        @profile = Profile.new
    end

    def show
        if current_developer.profile       
            @profile = Profile.find(params[:id])
        else
            redirect_to root_path
        end
    end

    def create
        @profile = Profile.new(profile_params)
        @profile.developer = current_developer
        if @profile.save
            redirect_to @profile, notice: 'Perfil completado com sucesso'
        else
            render :new
        end
    end     

    private

    def profile_params
        params.require(:profile).permit(:full_name, :social_name, :birth_date, :education,
            :skills, :employment_history, :avatar)
    end
end