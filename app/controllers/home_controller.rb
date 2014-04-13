class HomeController < ApplicationController
  def index
    @activities = Activity.all
    @activity = Activity.where(done: false).sample
  end

  def create
    activity = Activity.create!(params[:activity].permit(:name, :url))
    flash[:success] = "Created activity with name '#{activity.name}' and URL '#{activity.url}'"
    redirect_to root_path
  end

  def update
    activity = Activity.find(params[:activity][:id])
    activity.update_attributes!(done: !activity.done)
    flash[:success] = "Updated activity with name '#{activity.name}' and URL '#{activity.url}': done: #{activity.done}"
    redirect_to root_path
  end

  def delete
    activity = Activity.delete(params[:activity][:id])
    flash[:success] = "Deleted activity with name '#{activity.name}' and URL '#{activity.url}'"
    redirect_to root_path
  end
end
