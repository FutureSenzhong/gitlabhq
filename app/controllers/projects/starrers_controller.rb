# frozen_string_literal: true

class Projects::StarrersController < Projects::ApplicationController
  include SortingHelper

  # Authorize
  before_action :require_non_empty_project

  def index
    @sort = params[:sort].presence || sort_value_name

    @starrers = UsersStarProjectsFinder.new(params).execute
    @starrers = @starrers.by_project(@project)

    @starrers = @starrers.sort_by_attribute(@sort).page(params[:page])
  end
end
