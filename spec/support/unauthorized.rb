shared_examples '401' do
  its(:status) { is_expected.to be 401 }
  its(:body) { is_expected.to match_json_expression(status: 'error') }
end
