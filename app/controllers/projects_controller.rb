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
      render json: @project.errors.messages, :status => 500
    else
      logger.debug "Ëverything is fine"
      render json: @project, :status => 201
    end

  end

  def show
    @project_id = params[:id]
    logger.debug "showing id #{@project_id}"

    @project = Project.find_by_id(@project_id).as_json(include: { owner: { except: [:created_at, :updated_at]}}, except: [:created_at, :updated_at])

    if @project
      render json: @project
    else
      render json: {}, :status => 404
    end

  end


end
