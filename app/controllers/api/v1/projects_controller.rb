module Api
  module V1
    class ProjectsController < ApplicationController

      def index
        @projects = Project.order(created_at: "DESC")
        respond_to do |format|
          format.json { render 'index.json.jbuilder' }
        end
      end

      def create
        project = Project.new(project_params)
        project.save!
        # head :success
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

    end
  end
end