class AgentsController < ApplicationController

  def index
    @agents = Agent.all
  end

  def new
    @agent = Agent.new
  end

  def create
    puts 'create called'
    logger.debug('create hitted')
    name = agent_params[:name]
    image = agent_params[:image].read
    if agent_params[:status] == 1
      disabled_at = nil
    else
      disabled_at = Date.today
    end
    logger.debug(disabled_at)
    @agent = Agent.new
    @agent.name = name
    @agent.image = image
    @agent.disabled_at = disabled_at
 
    if @agent.save
      redirect_to agents_url
    else
      render 'new'
    end
  end

  def edit
    @agent = Agent.find(params[:id ])
  end

  def update
    @agent = Agent.find(params[:id])
    name = agent_params[:name]
    image = agent_params[:image].read
    if agent_params[:status].to_i == 1
      disabled_at = nil
    else
      disabled_at = Date.today
    end
    
    logger.debug(disabled_at)
    @agent.name = name
    @agent.image = image
    @agent.disabled_at = disabled_at
 
    if @agent.save
      redirect_to agents_url
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @agent = Agent.find(params[:id ])
    @agent.destroy
 
    redirect_to agents_url
  end

  def show_image 
    agent = Agent.find(params[:id ]) 
    send_data agent.image,  type: 'image/*', disposition: 'inline' 
  end

private
  def agent_params
    params.require(:agent).permit(:name, :image, :status)
  end
end
