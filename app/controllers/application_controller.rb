class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :respond_with_blank, :if => :html_request?

  private
  def respond_with_blank
    render text: '', status: 200
  end

  def html_request?
    params[:format] =~ /html/ || request.env['Content-Type'] =~ /html/
  end
end
