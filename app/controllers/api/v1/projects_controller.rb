module Api
  module V1
    class ProjectsController < ApplicationController
      before_action :set_project, only: [:edit, :update]
      def index
        @projects = Project.order(created_at: "DESC")
        respond_to do |format|
          format.json { render 'index.json.jbuilder' }
        end
      end

      def edit
        respond_to do |format|
          format.json { render 'edit.json.jbuilder' }
        end
      end

      def create
        project = Project.new(project_params)
        project.save!
      end

      def update
        @project.assign_attributes(project_params)
        @project.save
      end

      private

        # プロジェクトパラメータ取得
        # @return [Object] params パラメータ
        def project_params
          params.require(:project).permit(
            :project_name, :sales_amount, :working_group,
            :start_date, :end_date
          )
        end

        def set_project
          @project = ::Project.find(params[:id])
        end

    end
  end
end