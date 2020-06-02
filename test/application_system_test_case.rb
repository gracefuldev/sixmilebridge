require "test_helper"

Capybara.server_host = ENV.fetch("CAPYBARA_SERVER_HOST")
Capybara.server_port = ENV.fetch("CAPYBARA_SERVER_PORT")

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  parallelize(workers: 1)
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400],
                       options: {
                         browser: :remote,
                         url: "http://host.docker.internal:9515",
                       }

  def log_in(islander)
    assert_selector "h1", text: "User Info"
    fill_in "Name", with: "Your favorite pokemon"
    fill_in "Email", with: islander.email
    click_on "Sign In"
  end
end
