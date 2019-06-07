class Animal
  def bark
    p '----------1-----------bark'
    p 'Yeah, it’s barking.'
  end
end

class Dog < Animal
  attr_accessor :name, :age

  def initialize(name, age=1)
    p '----------2-----------Dog_init'
    @name = name
    @age = age
  end
end

class MechaDog < Dog

  def initialize(name, age=1)
    p '----------3-----------MechaDog_init'
    super(name, age=1)
    @data = { 'apache' => 'apache', 'bsd' => 'mit', 'chef' => 'apache' }
  end

  def proc arg
    p '----------4-----------proc'
    path = (arg.split[0]).split('/')[1..-1]
    p path #表示は[]だった
    if path.nil?
      p '----------5_1-----------if'
      keys=[]
      @data.each do |key, _value|
        keys << key
      end
      p keys
    elsif path.size == 2
      p '----------5_2-----------elseif'
      @data[path[0].chomp] = path[1]
      p path[1]
    else
      p '----------5_3-----------else'
      p path[0] + " => " + @data[path[0]].to_s
    end
  end

end


mdog = MechaDog.new('tom')
mdog.bark
p mdog.age
p mdog.name
mdog.proc "GET /bsd HTTP/1.1"