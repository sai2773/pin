class PinsController < ApplicationController
before_action :find_pin, only: [:show, :edit, :update, :destory]

def index
	@pins= Pin.all.order("created_at DESC")
end

def show
end

def new
@pin=Pin.new
end

def create
@pin=Pin.new(pin_params)

if @pin.save
	redirect_to @pin, notice:"successfully created new pin."
else
	render 'new'
end
end

def edit
end
def destroy
	@pin.destroy
	redirect_to root_path
end
def update
     if @pin.update(pin_params)
     	redirect_to @pin, notice: "Pin was successfully updaed"
     else 
     	render 'edit'
     end
end

private
def pin_params
	params.require(:pin).permit(:title, :description)
end
def find_pin
@pin=Pin.find(params[:id])
end
end
