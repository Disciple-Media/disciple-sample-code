# frozen_string_literal: true

module MemberSSO
  class API < Grape::API
    @@users = [] # rubocop:disable Style/ClassVars

    format :json

    resources :users do
      params do
        optional :email, type: String
      end
      get do
        if params[:email].present?
          { "users" => @@users.select { |u| u["email"] == params[:email] } }
        else
          { "users" => [] }
        end
      end

      params do
        requires :id, type: String
      end
      route_param :id do
        get do
          if (user = @@users.find { |u| u["id"] == params[:id] })
            { "user" => user }
          else
            status 404
          end
        end
      end

      params do
        requires :email
      end
      post do
        if @@users.any? { |u| u[:email] == params[:email] }
          status :unprocessable_entity
        else
          user = { id: SecureRandom.hex, email: params[:email] }
          @@users << user
          { "user" => user }
        end
      end
    end
  end
end
