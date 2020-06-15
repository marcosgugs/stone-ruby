require 'dry-configurable'
require 'typhoeus'
require 'stone/version'

module Stone
  extend Dry::Configurable

  autoload :Siclos, 'stone/siclos'
  autoload :Conciliation, 'stone/conciliation'

  setting :siclos do
    setting :api_key, ENV.fetch('STONE_SICLOS_API_KEY', nil)
    setting :api_endpoint, ENV.fetch('STONE_SICLOS_ENDPOINT_URL', 'https://api.siclospag.com.br/connect-split/v1')
    setting :mcc, ENV.fetch('STONE_SICLOS_MCC', nil)
    setting :partner_stone_id, ENV.fetch('STONE_SICLOS_PARTNER_ID', nil)
    setting :use_exception, true
  end

  setting :conciliation do
    setting :app_key, ENV.fetch('STONE_CONCILIATION_APP_KEY', nil)
    setting :app_secret, ENV.fetch('STONE_CONCILIATION_APP_SECRET', nil)
    setting :auth_endpoint, ENV.fetch('STONE_CONCILIATION_AUTH_ENDPOINT', 'https://conciliation.stone.com.br/v1/merchant/{{stone_code}}/access-authorization')
    setting :file_endpoint, ENV.fetch('STONE_CONCILIATION_FILE_ENDPOINT', 'https://conciliation.stone.com.br/conciliation-file/v2.2/{{referenceDate}}')
  end

  def self.configure
    yield self.config
  end

end
