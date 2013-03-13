class MeController < ApplicationController
  # GET /members
  # GET /members.json
  before_filter :require_login, :except=>[:login_user,:prompt,:logout_user]
  before_filter :get_member, :except=>[:login_user,:prompt,:logout_user]


  def index
    @member = Member.find(session[:user_id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @member }
    end      
  end


  def teams
    @member = Member.find(session[:user_id])
    @teams = @member.teams
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @teams }
    end
  end

  def team
    @team = Team.find(params[:team_id])
  end


  def project
    @project = Project.find(params[:project_id])
    @note = Note.new
  end

  def add_note
    @note = Note.new(params[:note])

    if @note.save 
      redirect_to :controller=>"me", :action=>"project", :project_id => @note.project.id
    else
      render :json => @note
    end
  end

  def projects
    @projects = []
    @member = Member.find(session[:user_id])   
    @member.teams.map{|t| @projects = @projects + t.projects}
    #@member.teams.each do | team | 
    #  @projects = @projects + team.projects
    #end
    
    #@projects = @member.teams[0].projects
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @projects }
    end
  end

def login_user

    @member = Member.find_by_username_and_password(params[:username], params[:password])

    if !@member.nil?
      flash[:message] = "You have been logged in!"
      session[:is_logged_in] = true
      session[:is_admin] = @member.is_admin
      session[:user_id] = @member.id
      redirect_to '/me'

    else
      flash[:message] = "Login Failed. Please try again..."
      redirect_to "/login"
    end

  end

  def logout_user
    session[:is_logged_in] = nil
    session[:user_id] = nil
    session[:member] = nil
    session[:is_admin] = nil
    flash[:message] = "Goodbye. You have been logged out."
    redirect_to "/login"
  end

  def prompt

  end

  def require_login
    if !session.has_key? :user_id
      redirect_to "/login"
    end
  end

  def get_member
    if session.has_key? :member
        @member = Member.find(session[:user_id])      
    end

  end

end
