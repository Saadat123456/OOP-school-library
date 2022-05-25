require_relative '../student'

describe Student do
  before :all do
    @student = Student.new(14, 6, 'Neira', parent_permission: false)
  end
  context 'Testing Student Class' do
    it 'Should have name Neira' do
      name = @student.name
      expect(name).to eql 'Neira'
    end
    it 'Should have classroom 6' do
      name = @student.classroom
      expect(name).to eq 6
    end
    it 'Should have age 14' do
      name = @student.age
      expect(name).to eq 14
    end
    it 'Should not have parent permission' do
      name = @student.can_use_services?
      expect(name).to be false
    end
  end
end
