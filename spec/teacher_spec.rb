require_relative '../classes/teacher.rb'

describe Teacher do

    before :each do
        @teacher= Teacher.new('math',19,'sam')
    end

    it 'it should return true' do
      expect(@teacher.can_use_services?).to be true 
    end

    it 'it should return parameters' do
       expect(@teacher.specialization).to eql('math')
       expect(@teacher.age).to be(19)
       expect(@teacher.name).to eql('sam') 
    end

    it 'it should return instance' do
        expect(@teacher).to be_instance_of Teacher
    end
end

