class TeamsController < ApplicationController
  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @teams }
    end
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @team = Team.find(params[:id])
    if flash[:member]
      @member = flash[:member]
    else
      @member = Member.new
    end

    
    @roles = Role.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @team }
    end
  end

  # GET /teams/new
  # GET /teams/new.json
  def new
    @team = Team.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @team }
    end
  end

  def add_to_roster
    @team = Team.find(params[:roster][:team_id])
    @roster = Roster.new(params[:roster])
    #render :json => @team

    if @roster.save 
         redirect_to :back, :notice => 'Member was successfully added.' 
        #format.json { render :json => @team, :status => :created, :location => @team }
    else
        flash[:roster] = @roster
        format.html { redirect_to @team, :notice => 'Member NOT successfully added.' }
        #format.json { render :json => @errors, :status => :unprocessable_entity }
    end

  end

  def add_member
    
    @member = Member.new(params[:member])
    @team = Team.find(params[:team_id])
    @member.teams << @team
    #roster = params[:roster]

    respond_to do |format|
      if @member.save

        @roster = Roster.last
        @roster.role_id = params[:roster]["role_id"]
        @roster.save

        format.html { redirect_to @team, :notice => 'Member was successfully added.' }
        format.json { render :json => @team, :status => :created, :location => @team }
      else
        flash[:member] = @member
        format.html { redirect_to @team, :notice => 'Member NOT successfully added.' }
        format.json { render :json => @member.errors, :status => :unprocessable_entity }
      end
    end
  

  end

  # GET /teams/1/edit
  def edit
    @team = Team.find(params[:id])
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(params[:team])

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, :notice => 'Team was successfully created.' }
        format.json { render :json => @team, :status => :created, :location => @team }
      else
        format.html { render :action => "new" }
        format.json { render :json => @team.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /teams/1
  # PUT /teams/1.json
  def update
    @team = Team.find(params[:id])

    uploaded_io = params[:team][:logo]
    
    File.open(Rails.root.join('public', 'teams/logos', uploaded_io.original_filename), 'w') do |file|
      file.write(uploaded_io.read)
    end
    
    params[:team][:logo] = uploaded_io.original_filename

    respond_to do |format|
      if @team.update_attributes(params[:team])
        format.html { redirect_to @team, :notice => 'Team was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @team.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    respond_to do |format|
      format.html { redirect_to teams_url }
      format.json { head :no_content }
    end
  end
end
