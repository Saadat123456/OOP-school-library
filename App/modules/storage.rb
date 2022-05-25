require 'json'

class Storage
  def initialize
    @base_path = './storage/'
    @ext = '.json'
  end

  def save_data(class_name, data)
    obj = data
    path = "#{@base_path}#{class_name}#{@ext}"
    File.open(path, 'w') do |file|
      JSON.dump(obj, file)
    end
  end

  def load_data(class_name)
    path = "#{@base_path}#{class_name}#{@ext}"
    File.open(path) do |file|
      data = file.read
      return JSON.parse(data)
    end
  end
end
