module Api
  module V1
    class ProjectsController < ApplicationController

      def index
        projects = Project.all
        render json: { status: 'SUCCESS', message: 'Loaded posts', projects: projects }
      end

    end
  end
end