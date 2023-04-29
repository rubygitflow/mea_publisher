# frozen_string_literal: true

module ApiHelpers
  def init_current_user
    get people_url
  end

  def do_request(method, path, params = {}, headers = {})
    send method, path, params:, headers:
  end

  def json
    @json ||= JSON.parse(response.body)
  end
end
