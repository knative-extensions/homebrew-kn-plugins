require 'yaml'

class PluginsHelper
	PLUGINS_YAML='plugins.yml'

	def initialize(name, version)
		@name = name
		@version = version
	end

	def shas
		return load_plugins_yml[@name][@version]['shas']
	end	

	def sha(arch)
		return shas[arch]
	end

	def repo
		return load_plugins_yml[@name][@version]['repo']
	end

	private

	def load_plugins_yml
		return YAML.load_file(PLUGINS_YAML)
	end
end