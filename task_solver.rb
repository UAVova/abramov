
module AbramovTasks1
  def t_331b(n)
    answers = []
    n = n.to_i
    (0..Math.sqrt(n)).each do |x|
      (0..Math.sqrt(n)).each do |y|
        (0..Math.sqrt(n)).each do |z|
          sum = 2**x + 2**y + 2**z
          answers << Hash[:x, x, :y, y, :z, z, :sum, sum] if sum == n
        end
      end
    end
    answers
  end
end

# Second module
module AbramovTasks2
  def t_108(n)
    n = n.to_i
    pow = 0
    sum = 1
    while sum <= n
      pow += 1
      sum = 2**pow
    end
    puts "(2^#{pow} = #{sum}) > #{n}"
  end
end

# Abramov tasks solver
class AbramovSolver
  include AbramovTasks1
  include AbramovTasks2
  attr_accessor :modules, :tasks

  def initialize
    @tasks = []
    @modules = AbramovSolver.included_modules.reject do |item|
      ['JSON::Ext::Generator::GeneratorMethods::Object',
       'Kernel'].include?(item.to_s)
    end
    @modules.each do |mod|
      @tasks << mod.public_instance_methods.select {|func| /t_\d+.{0,2}/ =~ func.to_s}.map {|x| x.to_s.delete('t_')}
    end
  end

  def start
    puts 'Hey there! Here are some tasks that i can solve for you:'
    puts @tasks.join(', ')
    puts "Please, enter the name of the task you want to solve?
    \nExample: 108, 91a and etc."
    task_number = gets.chomp
    return if task_number == 'exit' || task_number.empty?
    return "We can't solve such a complex task :D" unless @tasks.find { |x| x.include?(task_number) }
    puts "To solve this task, you need to pass
          #{method("t_#{task_number}").arity} arguments, separated by comma:"
    arguments = gets.chomp.split(',')
    puts send("t_#{task_number}", *arguments)
    puts "We hope you are happy with our solution!
          \nPsss.. Wanna solve more tasks? (yes/no)"
    gets.chomp == 'yes' ? start : return
  end
end

abramov = AbramovSolver.new
abramov.start
