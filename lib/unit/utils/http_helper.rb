# frozen_string_literal: true

require "uri"
require "net/http"
require "json"

module HttpHelper
  def self.get(url, headers:, params: nil)
    make_request(Net::HTTP::Get, url, headers, params: params)
  end

  def self.post(url, headers:, body: nil)
    make_request(Net::HTTP::Post, url, headers, body: body)
  end

  def self.put(url, body:, headers:)
    make_request(Net::HTTP::Put, url, headers, body: body)
  end

  def self.patch(url, body:, headers:)
    make_request(Net::HTTP::Patch, url, headers, body: body)
  end

  def self.delete(url, headers:, body: nil)
    make_request(Net::HTTP::Delete, url, headers, body: body)
  end

  def self.make_request(net_http, url, headers, body: nil, params: nil)
    uri = params.nil? ? URI(url) : URI("#{url}?#{encode(params)}")
    host = uri.host.to_s
    port = uri.port
    options = { use_ssl: uri.scheme == "https" }

    Net::HTTP.start(host, port, options) do |http|
      request = net_http.new uri, headers
      request.body = body unless body.nil?
      response = http.request request
      response.body = JSON.parse(response.body)
      response
    end
  end

  def self.encode(value, key = nil)
    case value
    when Hash then value.map { |k, v| encode(v, append_key(key, k)) }.join("&")
    when Array then value.map { |v| encode(v, "#{key}[]") }.join("&")
    when nil then ""
    else
      "#{key}=#{CGI.escape(value.to_s)}"
    end
  end

  def self.append_key(root_key, key)
    root_key.nil? ? key : "#{root_key}[#{key}]"
  end
end
