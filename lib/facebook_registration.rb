module FacebookRegistration
@facebook_configuration = {}
  @raw_facebook_configuration = {}
  @current_adapter = nil
  @set_asset_host_to_callback_url = true
  @path_prefix = nil
  @use_curl    = false

  class << self

    def load_configuration(facebook_yaml_file)
      return false unless File.exist?(facebook_yaml_file)
      @raw_facebook_configuration = YAML.load(ERB.new(File.read(facebook_yaml_file)).result)
      if defined? Rails.env
        @raw_facebook_configuration = @raw_facebook_configuration[Rails.env]
      end
      @raw_facebook_configuration
    end

    def facebook_config
      @facebook_configuration
    end
  end
end



if defined? Rails
  require 'helpers/helpers'
  require 'rails/signed_request'
end
