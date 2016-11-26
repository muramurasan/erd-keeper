require "thor"
require "fresh_erd"

class Command < Thor
  default_command :generate

  desc "generate", "generate ER diagrams."
  method_option :input,
                type: :string,
                default: "fresh_erd.yml",
                desc: "Specify the path of the configuration file"
  method_option :output,
                type: :string,
                default: ".",
                desc: "Specify the path of the output file"
  def generate
    FreshErd::GenerateErd.new.exec(options[:input], options[:output])
  end
end
