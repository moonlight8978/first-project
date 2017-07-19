module X
  def loz
    p @a
  end


end

class A
  include X

  def initialize(a)
    @a = a
  end

  def a
    p @a[0]
  end
end

a = A.new([1,2])
a.a
a.loz

