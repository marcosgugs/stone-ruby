# frozen_string_literal: true

RSpec.describe Stone::Siclos::Entity::CreateEstablishment do
  it 'initialize entity' do
    data = {
      is_establishment_to_production: 'true',
      legal_name: 'Marcos',
      business_name: 'Marcos',
      document_number: 'Marcos',
      tpv: '100.00',
      mcc: 6000,
      email_access_stone: 'marcos@maini.com.br',
      cell_phone: '(11) 98311-7568',
      partner_stone_id: '1234',
      cards_rate: [],
      capture_method: { amount_of_s920: '1' },
      address: {
        street_name: 'abcd',
        number: 'abcd',
        complement: 'abcd',
        neighborhood: 'abcd',
        zip_code: 'abcd',
        city: 'abcd',
        state: 'abcd'
      },
      bank: {
        bank_code: '1234',
        agency: '1234',
        agency_dv: '1234',
        account: '1234',
        account_dv: '1234',
        account_type: '1234'
      }
    }

    entity = Stone::Siclos::Entity::CreateEstablishment.new(data)

    base = Stone::Siclos::Client::Base.new
    puts base.remove_blank_values(entity)

    # puts entity.public_methods

    # puts entity.attributes.select { |_k, v| v }
  end
end
