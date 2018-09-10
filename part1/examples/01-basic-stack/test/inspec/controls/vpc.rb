# encoding: utf-8

title 'vpc'

stack_instance_id = attribute('stack_instance_id', description: 'Which stack to test')

describe aws_vpc_list do
  its('name') { should include "vpc-#{stack_instance_id}" }
end

region = attribute('region', description: 'aws region')
describe region do
  it 'region attribute should be available' do
    subject.should_not eq('')
  end
end
