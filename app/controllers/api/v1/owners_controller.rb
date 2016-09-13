  module Api;module V1
  class OwnersController < ApplicationController
    before_action :set_owner, only: [:articles, :show]

    # For rendersing all articles belongs to a person.
    def articles      
      render json: @owner, custom_key: true
    end

    # Pagination can be added here.
    def index
      @owners = Owner.all
      render json: @owners, include: [], adapter: :json
    end

    def show
      render json: @owner, include: [], custom_key: true
    end

    private
      # Setting up an owner and returning 'not found - 404' otherwise
      def set_owner
        @owner = Owner.find_by(name: params[:owner_name])
        unless @owner.present?
          head 404 and return
        end
      end

  end
end;end
