module Api
  module V1
    class OogirisController < ApplicationController
      before_action :set_oogiri, only: [:show, :update, :destroy]
      
      def index
        @oogiris = Oogiri.all
        render json: @oogiris
      end

      # GET /oogiris/1
      def show
        render json: @oogiri
      end

      # POST /oogiris
      def create
        @oogiri = Oogiri.new(oogiri_params)

        if @oogiri.save
          render json: @oogiri, status: :created, location: @oogiri
        else
          render json: @oogiri.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /oogiris/1
      def update
        if @oogiri.update(oogiri_params)
          render json: @oogiri
        else
          render json: @oogiri.errors, status: :unprocessable_entity
        end
      end

      # DELETE /oogiris/1
      def destroy
        @oogiri.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_oogiri
          @oogiri = Oogiri.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def oogiri_params
          params.require(:oogiri).permit(:title, :oogiri, :description, :file_url, :image_url)
        end
        
    end
  end
end