class HelloWorld
  def say_hello
    'Hello World!'
  end
end

describe HelloWorld do
  context 'When testing the HelloWorld class' do
    it "The say_hello method should return 'Hello World'" do
      hw = HelloWorld.new
      message = hw.say_hello
      expect(message).to eq 'Hello World!'
    end
  end
end
