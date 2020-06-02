module ApplicationHelper
  def auth_url
    "/auth/developer?" + { origin: request.env["PATH_INFO"] }.to_query
  end
end
