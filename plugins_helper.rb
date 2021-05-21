require 'yaml'

class PluginsHelper
	PLUGINS_YAML='plugins.yml'

	def initialize(name, version)
		@name = name
		@version = version
	end


  	def file_name
  		return "kn-#{@name}"
  	end

  	def path_name
  		return "kn-plugin-#{@name}"
  	end

  	def base_url
  		return "https://github.com/knative-sandbox/#{self.path_name()}/releases/download/v#{@version}"
  	end

	def shas
		return load_plugins_yml[@version][@name]['shas']
	end	

	def sha(arch)
		return shas[arch]
	end

	def download
		return load_plugins_yml[@version][@name]['download']
	end

	def homepage
		download_url = self.download()
		return download_url.split("/releases/download/", -1)[0]
	end

	private

	def load_plugins_yml
		return YAML.load_file(PLUGINS_YAML)
	end
end