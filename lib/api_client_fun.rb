require 'api_client_fun/resource'
require "api_client_fun/version"
module ApiClientFun
  class << self
    attr_accessor :api_client_fun_resource
  end
  def self.profile_for_name(user_name)
    return unless user_name.present?
    all_users = get_users
    return all_users if all_users[:error].present?
    user = all_users['users'].select{|user| user['name'].present? && user['name'].downcase == user_name.downcase}.last
    return user['profile'] if user.present?
    {error: 'Profile not found'}
  end

  def self.get_users
    api_client_fun_resource.get_json_request('users')
  end

  def self.get_user_by_id(id)
    api_client_fun_resource.get_json_request("users/#{id}")
  end

  self.api_client_fun_resource = Resource
end
