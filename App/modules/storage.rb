require 'json'

class Storage
  def save_data(class_name, data)
    obj = []
    data.each do |o|
      obj.push(o.to_json)
    end
    path = "./storage/#{class_name}.json"
    File.open(path, 'w') do |file|
      JSON.dump(obj, file)
    end
  end
end
