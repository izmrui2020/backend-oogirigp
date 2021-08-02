module Api
  module V1
    class OogirisController < ApplicationController
      before_action :set_oogiri, only: [:show, :update, :destroy]
      
      def list
      end

      def index
        @oogiris = Oogiri.page(params[:page] ||= 1).per(5).order('created_at DESC')
        pagination = resources_with_pagination(oogiris)

        render json: @oogiris
      end

      # GET /oogiris/1
      def show
        render json: @oogiri, each_serializer: OogiriSerializer
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
          params.require(:oogiri).permit(
            :title, :oogiri, :description, :image)
        end
        
    end
  end
end