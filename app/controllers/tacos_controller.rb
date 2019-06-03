class TacosController < ApplicationController
  def new
    @taco = Taco.new
  end

  def index
    @tacos = Taco.all
  end

  def create
    shell = Shell.create(
      soft: params[:taco][:shell]
    )
    shell.save
    taco = Taco.create(
      name: params[:taco][:name], 
      shell_id: shell.id
      )
      taco.save
      redirect_to tacos_path
    # if taco.save
    #   redirect_to tacos_path
    # else
    #   render :new
    # end
  end
end
