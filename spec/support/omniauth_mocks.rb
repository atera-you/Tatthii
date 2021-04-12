module OmniauthMocks
  def twitter_mock
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      "provider" => "twitter",
      "uid" => "11111",
      "info" => {
        "name" => "Mock User",
        "image" => "http://mock_image_url.com",
      },
      "credentials" => {
        "token" => "mock_token",
        "secret" => "mock_secret"
      },
    })
  end

  def twitter_invalid_mock
    OmniAuth.config.mock_auth[:twitter] = :invalid_credentails
  end
end