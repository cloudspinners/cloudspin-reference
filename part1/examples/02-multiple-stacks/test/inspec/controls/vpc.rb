# encoding: utf-8

title 'vpc'

stack_instance_id = attribute('stack_instance_id', description: 'Which stack to test')

describe aws_vpc_list do
  its('name') { should include "vpc-#{stack_instance_id}" }
end

describe attribute('region', description: 'aws region') do
  it 'region attribute should be available' do
    expect(subject).not_to eq('')
  end
end
