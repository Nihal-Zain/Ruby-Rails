class Api::V1::EditorsController < ApplicationController
    before_action :set_editor, only: [:show, :update, :destroy]
    
    def index
        editors = Editor.all
        render json: editors
    end
    
    def show
        render json: @editor
    end
    
    def create
        editor = Editor.new(editor_params)
        if editor.save
        render json: editor, status: :created
        else
        render json: editor.errors, status: :unprocessable_entity
        end
    end
    
    def update
        if @editor.update(editor_params)
        render json: @editor
        else
        render json: @editor.errors, status: :unprocessable_entity
        end
    end
    
    def destroy
        @editor.destroy
        head :no_content
    end
    
    private
    
    def set_editor
        @editor = Editor.find(params[:id])
    end
    
    def editor_params
        params.require(:editor).permit(:name, :email, :password)
    end
end
