require_relative '../classes/person'

describe Person do
  before :each do
    @person = Person.new(25, 'Amanda John', parent_permission: true)
  end

  it 'returns a person object' do
    expect(@person).to be_instance_of(Person)
  end

  it 'accepts 3 parameters' do
    expect(@person.age).not_to be(18)
    expect(@person.age).to be(25)
    expect(@person.name).to eq('Amanda John')
    expect(@person.parent_permission).to be true
  end

  it 'checks if person can use services' do
    expect(@person.can_use_services?).to be true
  end

  it 'checks that those under 18 without parent permission cannot use service' do
    @person.age = 17
    @person.parent_permission = false
    expect(@person.can_use_services?).to be false
  end

  it 'checks that those under 18 with parent permission can use service' do
    @person.age = 17
    @person.parent_permission = true
    expect(@person.can_use_services?).to be true
  end
end
