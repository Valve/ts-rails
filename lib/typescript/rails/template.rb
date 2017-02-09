require 'typescript/rails'
require 'tilt/template'

class TypeScript::Rails::Template < ::Tilt::Template
  self.default_mime_type = 'application/javascript'

  # @!scope class
  class_attribute :default_bare

  def self.engine_initialized?
    defined? ::TypeScript::Rails::Compiler
  end

  def initialize_engine
    require_template_library 'typescript/rails/compiler'
  end

  def prepare
    if !options.key?(:bare) and !options.key?(:no_wrap)
      options[:bare] = self.class.default_bare
    end
  end

  def evaluate(context, locals, &block)
    @output ||= ::TypeScript::Rails::Compiler.compile(file, data, context)
  end

  # @override
  def allows_script?
    false
  end
end
