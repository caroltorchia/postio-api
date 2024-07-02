require 'swagger_helper'

RSpec.describe 'api/v1/posts', type: :request do
  path '/api/v1/posts' do
    get('list posts') do
      tags 'Post'
      consumes 'application/json'
      produces 'application/json'
      security [bearerAuth: []]
      response(200, 'successful') do
        let(:user) { create(:user) }
        let(:Authorization) { auth_token(user) }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(401, 'unauthorized') do
        let(:Authorization) { "Bearer token" }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create post') do
      tags 'Post'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :post, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          content: { type: :string },
          user: { type: :object }
        },
        required: [
          'title'
        ]
      }
      security [bearerAuth: []]

      response(201, 'created') do
        let(:user) { create(:user) }
        let(:post) {  }
        let(:Authorization) { auth_token(user) }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(422, 'unprocessable entity') do
        let(:user) { create(:user) }
        let(:post) {  }
        let(:Authorization) { auth_token(user) }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(401, 'unauthorized') do
        let(:post) {}
        let(:Authorization) { "Bearer token" }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/posts/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show post') do
      tags 'Post'
      consumes 'application/json'
      produces 'application/json'
      security [bearerAuth: []]
      response(200, 'successful') do
        let(:user) { create(:user) }
        let(:post) { create(:post, user: user) }
        let(:id) { post.id }
        let(:Authorization) { auth_token(user) }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(404, 'not found') do
        let(:id) { '29b763d7-f1fb-40a3-b570-21d8fda766d8' }
        let(:user) { create(:user) }
        let(:Authorization) { auth_token(user) }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(401, 'unauthorized') do
        let(:id) { '29b763d7-f1fb-40a3-b570-21d8fda766d8' }
        let(:Authorization) { "Bearer token" }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    patch('update post') do
      tags 'Post'
      consumes 'application/json'
      produces 'application/json'
      security [bearerAuth: []]
      parameter name: :post, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          content: { type: :string },
          user: { type: :object }
        },
        required: [
          'title'
        ]
      }
      response(200, 'successful') do
        let(:user) { create(:user) }
        let(:post) { create(:post, user: user) }
        let(:id) { post.id }
        let(:Authorization) { auth_token(user) }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    put('update post') do
      tags 'Post'
      consumes 'application/json'
      produces 'application/json'
      security [bearerAuth: []]
      parameter name: :post, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          content: { type: :string },
          user: { type: :object }
        },
        required: [
          'title'
        ]
      }
      response(200, 'successful') do
        let(:user) { create(:user) }
        let(:post) { create(:post, user: user) }
        let(:id) { post.id }
        let(:Authorization) { auth_token(user) }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete post') do
      tags 'Post'
      consumes 'application/json'
      produces 'application/json'
      security [bearerAuth: []]
      response(204, 'no content') do
        let(:user) { create(:user) }
        let(:post) { create(:post, user: user) }
        let(:id) { post.id }
        let(:Authorization) { auth_token(user) }

        run_test!
      end
    end
  end
end
