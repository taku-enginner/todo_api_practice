module Api
  module V1
    class BaseController < ApplicationController
      include Api::Errors
    end
  end
end