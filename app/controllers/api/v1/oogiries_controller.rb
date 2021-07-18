module Api
  module V1
    class OogiriesController < ApplicationController
      before_action :set_oogiri, only: [:show, :update, :destroy]
      
      def index
        @oogiries = Oogiri.all
        render json: @oogiries
      end

      # GET /oogiries/1
      def show
        render json: @oogiri
      end

      # POST /oogiries
      def create
        @oogiri = Oogiri.new(oogiri_params)

        if @oogiri.save
          render json: @oogiri, status: :created, location: @oogiri
        else
          render json: @oogiri.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /oogiries/1
      def update
        if @oogiri.update(oogiri_params)
          render json: @oogiri
        else
          render json: @oogiri.errors, status: :unprocessable_entity
        end
      end

      # DELETE /oogiries/1
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