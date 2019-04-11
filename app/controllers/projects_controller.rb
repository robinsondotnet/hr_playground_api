# coding: utf-8
class ProjectsController < ApplicationController

  def index
    render json: Project.all.as_json(include: { owner: { except: [:created_at, :updated_at]}}, except: [:created_at, :updated_at])
  end

  def create
    @post_body = params[:project]

    logger.debug @post_body

    @project = Project.create(
             name: @post_body["name"],
             description: @post_body["description"],
             owner_id: 1
           )

    if @project.valid? == false
      logger.debug "Ërror has ocurred"
      render json: @project.errors.messages
    else
      logger.debug "Ëverything is fine"
      render json: @project
    end

  end

end
