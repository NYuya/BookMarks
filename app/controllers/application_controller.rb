class ApplicationController < ActionController::Base
	after_action :allow_iframe, only: [:hoge]

    private
    def allow_iframe
        response.headers['X-Frame-Options'] = "ALLOWALL"
    end
end
