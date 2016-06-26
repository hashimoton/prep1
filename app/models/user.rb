class User

  def initialize(yaml_file = "db/users.yml")
    @records = nil
    if yaml_file.present? && File.exists?(yaml_file)
      @records = YAML.load_file(yaml_file)
    end
  end
  
  def all
    return @records
  end
end
