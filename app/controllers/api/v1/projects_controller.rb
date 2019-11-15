module Api
  module V1
    class ProjectsController < ApplicationController
      before_action :set_project, only: [:edit, :update, :destroy]
      def index
        @projects = Project.order(created_at: "DESC")
      end

      def show
      end

      def edit
      end

      def create
        @project = Project.new(project_params)
        if @project.save
          render json: @project, status: :ok
        else
          render json: { errors: @project.errors.full_messages, render: 'edit.json.jbuilder' }, status: :unprocessable_entity
        end
      end

      def update
        @project.assign_attributes(project_params)
        if @project.save
          render json: @project, status: :ok
        else
          render json: { errors: @project.errors.full_messages, render: 'edit.json.jbuilder' }, status: :unprocessable_entity
        end
      end

      def destroy
        @project.destroy
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