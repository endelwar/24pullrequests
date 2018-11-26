class ContributionsController < ApplicationController
  respond_to :html, :json

  def index
    @pull_requests = pull_requests.page(params[:page])
    respond_with @pull_requests
  end

  def new
    @contribution = Contribution.new
  end

  def create
    @contribution = Contribution.new(event_params)
    @contribution.user_id = current_user.id
    if @contribution.save
      redirect_to @contribution
    else
      render :new
    end
  end

  def edit
  end

  def meta
    @pull_requests_decorator = PullRequestsDecorator.new(pull_requests)
    respond_with @pull_requests_decorator
  end

  protected

  def pull_requests
    Contribution.year(current_year).order('created_at desc').includes(:user)
  end

  def contribution_params
    params.require(:contribution).permit(:title, :body, :repo_name, :issue_url)
  end
end
