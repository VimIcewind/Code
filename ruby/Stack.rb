class Stack
    def initialize
        @stack = []
        @sp = 0
    end

    def push(value)
        @stack[@sp] = value
        @sp += 1
    end

    def pop
        return nil if @sp == 0
        @sp -= 1
        return @stack[@sp]
    end
end

stack = Stack.new

stack.push(5)
stack.push(9)

puts(stack.pop())
puts(stack.pop())
