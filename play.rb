module M
  def self.f
    p 'M.f'
  end
  def self.g
    p 'M.g'
  end
end

class B
  def self.inherited(child)
    M.methods(false).each { |m|
        orig = M.method(m)
        child.define_singleton_method(m) {
          orig.call
        }
      }
  end
end

class M::A < B
end

p M::A.methods(false)
M::A.f
M::A.g