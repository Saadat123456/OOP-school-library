require_relative '../person'

describe Person do
  before :all do
    @person = Person.new(14, 'Alejandro', parent_permission: false)
  end

  before :each do
    @person.age += 1
  end
  context 'Testing Person Class' do
    it 'Should have name Alejandro When we call correct_name() function' do
      name = @person.correct_name
      expect(name).to eq 'Alejandro'
    end

    it 'Should have age of 16' do
      age = @person.age
      expect(age).to eq 16
    end

    it 'Alejandro Should Not be able to use services' do
      can_use = @person.can_use_services?
      expect(can_use).to be false
    end

    it 'Alejandro Should be able to use services' do
      can_use = @person.can_use_services?
      expect(can_use).to be true
    end
  end
end
