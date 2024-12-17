require 'net/http'

class Turnstile
  URL = URI('https://challenges.cloudflare.com/turnstile/v0/siteverify')

  def self.verify(token:, ip:)
    body = {
      secret: Rails.application.credentials.dig(:turnstile_secret_key),
      response: token,
      remoteip: ip
    }
    response = Net::HTTP.post(URL, body.to_json, {'Content-Type': 'application/json'})
    JSON.parse(response.body).dig('success')
  end
end
