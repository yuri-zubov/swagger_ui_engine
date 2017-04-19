require 'test_helper'

module SwaggerUiEngine
  class DocsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @routes = Engine.routes
    end

    test 'index action should redirect when single doc version' do
      get '/swagger'
      assert_response :redirect
    end

    test 'custom config options should work successfully' do
      get '/swagger/docs/v1'
      assert_match('url = "api_docs/v1/swagger.yaml"', @response.body)
      assert_match('docExpansion: "list"', @response.body)
      assert_match('defaultModelRendering: "model"', @response.body)
    end

    test 'default config options should work successfully' do
      get '/swagger/docs/v1'
      assert_match('showRequestHeaders: "false"', @response.body)
      assert_match('jsonEditor: "false"', @response.body)
      assert_match('validatorUrl: "null"', @response.body)
    end
  end
end
