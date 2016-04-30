require "yaml"
require "fresh_erd/version"

CONFIG_YAML = "fresh_erd.yml"

module FreshErd
  def self.exec
    if File.exist?(CONFIG_YAML)
      load_yaml = YAML.load_file(CONFIG_YAML)
      diagrams = load_yaml["diagrams"]

      diagrams.each do |diagram_name , diagram|
        models = diagram.map { |m| m }
        output_erd(diagram_name, models)
      end
    else
      system "bundle exec erd --filename=project --filetype=png"
    end
  end

  def self.output_erd(diagram_name = "erd", models = nil)
    system "bundle exec erd --only='#{models.join(",")}' --filename=#{diagram_name} --filetype=png"
  end
end

module InspectRepository
  def self.files_modified_since
    ref = `git merge-base HEAD master`.chomp
    return unless ref

    files = `git diff --diff-filter=AM --name-only #{ref}`.lines.map(&:chomp).grep(/\.rb$/)
    files = files.select { |file| File.dirname(file).include?("models") }
    files = files.map { |file| File.basename(file) }
    files
  end
end
