class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :set_users, only: [:new, :edit, :copy]

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  end

  # GET /groups/new
  def new
    #@group = Group.new(:name => params[:name])
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end
  
  def copy
    @old = Group.find(params[:id])
    @group = Group.new
    @group.attributes = @old.attributes
    
    render :action => "new"
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
    @group.save
    #respond_to do |format|
    #  if @group.save
    #    format.html { redirect_to @group, notice: 'Group was successfully created.' }
    #    format.json { render :show, status: :created, location: @group }
    #  else
    #    format.html { render :new }
    #    format.json { render json: @group.errors, status: :unprocessable_entity }
    #  end
    #end
    if @group.description == "true"
      #redirect_to edit_user_path(1) 
      redirect_to copy_group_path(@group.id)
      #redirect_to users_path
    else
      redirect_to groups_path
    end
    #redirect_to :action => "new", :name => "test" 
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end
    
    def set_users
      @users = User.all
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name, :description, :user_ids => [])
    end
end
