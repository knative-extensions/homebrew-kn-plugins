require "test/unit"
require_relative './plugins_helper'

class PluginsHelperTest < Test::Unit::TestCase
	def setup
		@plugins_helper = PluginsHelper.new('admin', '0.22.0')
	end

	def teardown
		@plugins_helper = nil
	end

  	def test_file_name
  		file_name = @plugins_helper.file_name()
  		assert_equal file_name, "kn-admin"
  	end

  	def test_path_name
  		path_name = @plugins_helper.path_name()
  		assert_equal path_name, "kn-plugin-admin"
  	end

  	def test_base_url
  		base_url = @plugins_helper.base_url()
  		assert_equal base_url, "https://github.com/knative-sandbox/kn-plugin-admin/releases/download/v0.22.0"
  	end

  	def test_sha_darwin_amd64
  		sha = @plugins_helper.sha('darwin-amd64')
    	assert_equal sha, 'd1232dffcfaca518b77f54b6ce49b478b1e9409203acb9ea4a1cfe38194f5576', "incorrect SHA value"
  	end

  	def test_shas_darwin_amd64
  		sha = @plugins_helper.shas['darwin-amd64']
    	assert_equal sha, 'd1232dffcfaca518b77f54b6ce49b478b1e9409203acb9ea4a1cfe38194f5576', "incorrect SHA value"
  	end

  	def test_shas_linux_amd64
  		sha = @plugins_helper.shas['linux-amd64']
    	assert_equal sha, '863ea33842f6ec32eaa6818f45554e1cb997731a52248d659c687c9d2ff00f23', "incorrect SHA value"
  	end

  	def test_shas
  		shas = @plugins_helper.shas
    	assert_equal shas.size, 2, "expecting 2 different SHA values"
  	end

	def test_download
  		download = @plugins_helper.download()
    	assert_equal download, "https://github.com/knative-sandbox/kn-plugin-admin/releases/download/v0.22.0", "#{download} value is not correct"
  	end

	def test_homepage
  		homepage = @plugins_helper.homepage()
  		print homepage
    	assert_equal homepage, 'https://github.com/knative-sandbox/kn-plugin-admin', "#{homepage} value is not correct"
  	end
end