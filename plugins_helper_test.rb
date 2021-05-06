require "test/unit"
require_relative './plugins_helper'

class PluginsHelperTest < Test::Unit::TestCase
	def setup
		@plugins_helper = PluginsHelper.new('admin', '0.22.0')
	end

	def teardown
		@plugins_helper = nil
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

  	def test_shas_windows_amd64_exe
  		sha = @plugins_helper.shas['windows-amd64.exe']
    	assert_equal sha, '2d9be90517987157d7951c857207160c91d50cd30cf6413279b6fc594bd48994', "incorrect SHA value"
  	end

  	def test_shas
  		shas = @plugins_helper.shas
    	assert_equal shas.size, 6, "expecting 6 different SHA values"
  	end

	def test_repo
  		repo = @plugins_helper.repo
    	assert_equal repo, 'https://github.com/knative-sandbox/kn-plugin-admin', "#{repo} value is not correct"
  	end
end