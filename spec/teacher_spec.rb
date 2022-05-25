require_relative '../teacher'

describe Teacher do
  before :all do
    @teacher = Teacher.new(50, 'Math', 'Neira')
  end
  context 'Testing teacher Class' do
    it 'Should have name Neira' do
      name = @teacher.name
      expect(name).to eql 'Neira'
    end
    it 'Should have specialization Math' do
      name = @teacher.specialization
      expect(name).to eq 'Math'
    end
    it 'Should have age 50' do
      name = @teacher.age
      expect(name).to eq 50
    end
    it 'Should be able to use services' do
      name = @teacher.can_use_services?
      expect(name).to be true
    end
  end
end
