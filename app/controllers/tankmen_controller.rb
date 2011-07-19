class TankmenController < ApplicationController
   helper_method :sort_column, :sort_direction, :increment

  # GET /tankmen
  # GET /tankmen.xml
  def index

    @tankmen = Tankman.search(params[:search]).order(sort_column + " " + sort_direction)
    @histories = History.all

  end

  # GET /tankmen/1
  # GET /tankmen/1.xml
  def show
    @tankman = Tankman.find(params[:id])
    @history = History.where(:tankman_id => @tankman).paginate(:per_page => 15, :page => params[:page])



  end

  # GET /tankmen/new
  # GET /tankmen/new.xml
  def new
    @post = Post.all
    @tankman = Tankman.new


  end

  # GET /tankmen/1/edit
  def edit
    @post = Post.all
    @tankman = Tankman.find(params[:id])
#    if params[:inc]
#       @tankman = Tankman.find(params[:id]).decrement(:rate)
#
#
#        if @tankman.update_attributes(params[:tankman])
#          redirect_to(tankmen_path, :notice => 'Tankman was successfully decremented.')
#
#        else
#         render :action => "edit"
#
#        end
#      @tankman.histories.create(:rate => @tankman.rate)
#    else
#       @tankman = Tankman.find(params[:id]).increment(:rate)
#
#       if @tankman.update_attributes(params[:tankman])
#                 redirect_to(tankmen_path, :notice => 'Tankman was successfully incremented.')
#
#       else
#                render :action => "edit"
#       end
#
#      @tankman.histories.create(:rate => @tankman.rate)
#    end
  end



  # POST /tankmen
  # POST /tankmen.xml
  def create
    @post = Post.all
    @tankman = Tankman.new(params[:tankman])


      if @tankman.save
        redirect_to(@tankman, :notice => 'Tankman was successfully created.')
      else
        render :action => "new"
      end
  end

  # PUT /tankmen/1
  # PUT /tankmen/1.xml
  def update
    @tankman = Tankman.find(params[:id])

      if @tankman.update_attributes(params[:tankman])
      redirect_to(@tankman, :notice => 'Tankman was successfully updated.')
      else
      render :action => "edit"
      end
    @tankman.histories.create(:rate => @tankman.rate)
  end

  # DELETE /tankmen/1
  # DELETE /tankmen/1.xml
  def destroy
    @tankman = Tankman.find(params[:id])
    @tankman.destroy

    redirect_to(tankmen_url)

  end

  def increment
    @tankman = Tankman.find(params[:id])
    @tankman.increment!(:rate)
    @tankman.histories.create(:rate => @tankman.rate)
    index
    render "index"
  end

  def decrement
    @tankman=Tankman.find(params[:id])
    @tankman.decrement!(:rate)
    @tankman.histories.create(:rate => @tankman.rate)
    index
    render "index"
  end

  private

  def sort_column
    Tankman.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end




end
