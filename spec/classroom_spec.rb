require_relative '../classroom'

describe Classroom do
  before :all do
    @classroom = Classroom.new('Math')
  end
  context 'Testing classroom Class' do
    it 'Should have label Math' do
      label = @classroom.label
      expect(label).to eql 'Math'
    end

    it 'Should have no Students' do
      students = @classroom.students
      expect(students).to eql []
    end
  end
end
