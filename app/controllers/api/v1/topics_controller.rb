class Api::V1::TopicsController < ApplicationController
  def index
    topics = Topic.order(created_at: :desc)
    render json: { status: 'SUCCESS', message: 'loaded topics', data: topics }, status: :ok
  end

  def show
    topic = Topic.find(params[:id])
    render json: { status: 'SUCCESS', message: 'loaded the topic', data: topic }, status: :ok
  end

  def create
    topic = Topic.new(topic_params)
    if topic.save
      render json: { status: 'SUCCESS', data: topic }, status: :ok
    else
      render json: { status: 'SUCCESS', data: topic.errors }, status: :error
    end
  end

  def destroy
    topic = Topic.find(params[:id])
    topic.destroy
    render json: { status: 'SUCCESS', message: 'deleted the topic', data: topic }, status: :ok
  end

  def update
    topic = Topic.find(params[:id])
    if topic.update(topic_params)
      render json: { status: 'SUCCESS', message: 'updated the topic', data: topic }, status: :ok
    else
      render json: { status: 'SUCCESS', message: 'loaded the topic', data: topic }, status: :ok
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title)
  end
end
