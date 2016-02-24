class ApplicationController < ActionController::Base
  helper_method :current_user, :most_recent_tool, :current_tool_count, :current_potential_revenue, :current_tool_summary
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def most_recent_tool
    if session[:most_recent_tool].nil?
      "No tools Registered"
    else
      Tool.find(session[:most_recent_tool]).name
    end
  end

  def current_tool_count
    session[:current_tool_count]
  end

  def current_potential_revenue
    session[:current_potential_revenue]
  end

  def current_tool_summary
    "#{current_tool_count} tools with a potential revenue of #{current_potential_revenue}"
  end
end
