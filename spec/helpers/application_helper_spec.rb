require "rails_helper"

describe ApplicationHelper do
  describe '#bootstrap_class_for' do
    it 'returns an instance of String class' do
      expect(helper.bootstrap_class_for).to be_a String
    end

    it 'returns alert-success class when flash type is success' do
      expect(helper.bootstrap_class_for('success')).to eq 'alert-success'
    end

    it 'returns alert-danger class when flash type is error' do
      expect(helper.bootstrap_class_for('error')).to eq('alert-danger')
    end

    it 'returns alert-warning class when flash type is alert' do
      expect(helper.bootstrap_class_for('alert')).to eq('alert-warning')
    end

    it 'returns alert-info class when flash type is notice' do
      expect(helper.bootstrap_class_for('notice')).to eq('alert-info')
    end

    it 'returns the flash type when flash type does not match any case statement' do
      expect(helper.bootstrap_class_for('hello-world')).to eq('hello-world')
    end
  end
end