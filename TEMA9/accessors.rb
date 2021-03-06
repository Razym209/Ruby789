module Accessors
  def attr_accessor_with_history(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      history_var = "@#{name}_history".to_sym
      define_method("#{name}_history".to_sym) { instance_variable_get(history_var) }
      define_method(name.to_s.to_sym) { instance_variable_get(var_name) }
      set_with_history(name, var_name, history_var)
    end
  end

  def strong_attr_accessor(name, class_name)
    var_name = "@#{name}".to_sym
    define_method("#{name}_strong".to_sym) { instance_variable_get(var_name) }
    define_method("#{name}_strong=".to_sym) do |value|
      raise TypeError unless value.is_a? class_name

      instance_variable_set(var_name, value)
    end
  end

  private

  def set_with_history(name, var_name, history_var)
     define_method("#{name}=".to_sym) do |value|
      if instance_variable_get(history_var)
        instance_variable_get(history_var) << instance_variable_get(var_name)
      else
        instance_variable_set(history_var, [])
      end
       instance_variable_set(var_name, value)
    end
  end
end

class Test
  extend Accessors
  attr_accessor_with_history :a, :b
  strong_attr_accessor :a, String
  strong_attr_accessor :b, Integer
end
