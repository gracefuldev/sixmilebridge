module ApplicationHelper
  def auth_url(desired_path: request.env["PATH_INFO"])
    query_params = { origin: desired_path }.to_query
    if Rails.env.production?
      "/auth/google_oauth2?" + query_params
    else
      "/auth/developer?" + query_params
    end
  end
end
