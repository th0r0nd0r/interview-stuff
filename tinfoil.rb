=begin

Implement the programming language Treefuck, which is based on Brainfuck (another language).

You should write an interpreter (takes in a program as a string and execute it)
and implement any necessary underlying data structure(s).
The language consists of nine commands, listed below. A Treefuck program is
a sequence of these commands, possibly interspersed with other
characters (which are ignored). The commands are executed sequentially, with
some exceptions: an instruction pointer begins at the first command, and each
command it points to is executed, after which it normally moves forward to
the next command. The program terminates when the instruction pointer moves
past the last command.

The Treefuck language uses a simple machine model consisting of the program
and instruction pointer, as well as an infinitely large binary tree, with each
node initialized to zero.

Commands:
< -> Move the data pointer to point to the left subtree of the current node
> -> Move the data pointer to point to the right subtree of the current node
| -> Move the data pointer to point to the parent of the current node
+ -> Increment the byte stored in the current node
- -> Decrement the byte stored in the current node
. -> Output the byte stored in the current node to stdout
, -> Read one byte of input from stdin, and store it in the current node
[ -> If the current node's value is zero, jump the instruction pointer to the 
  command after the matching ]. Otherwise continue
] -> If the current node's value is not zero, jump the instruction pointer to the 
  command after the matching [. Otherwise continue

Examples:
Read a byte as input, then count down from that byte, outputting each number
,[.-]

# , => read byte with value 2
# [ => not zero, just go to next command
# . => print 2
# - => current node = 1
# ] => go back to dot



Read two bytes as input, then output their sum
<,|>,|<[-|+<]|>[-|+>]|.


Print "Hello World!"
++++++++[>++++[>++>+++>+++>+||||-]>+>+>->>+[|]|-]>>.>---.+++++++..+++.>>.|-.|.+++.------.--------.>>+.>++.


eval(",[.-]")

Interpreter.new.eval(",[.-]")

      root
 left  |  right
l2 | _    _ | r2
=end

# NOT THIS: [root, root, root]


# InifiniteTree


# methods to translate commands

# 


Class Intepreter
  def initalize
    @tree = InfiniteTree.new
    @current_node = InfiniteTree[0]
    @instruction_pointer = 0
    @str = ""
  end


  def eval(str)
    @str = str
    until @instruction_pointer >= str.length
      handle_input(str[@instruction_pointer])
      @instruction_pointer += 1
    end
  end

  def handle_input(input)
    if input == "<"
      less_than
    elsif input == ">"
      greater_than
    elsif input == "["
      left_bracket
    elsif input == "]"
      right_bracket
    #...
    end
  end

  def less_than
    @current_node = @current_node.left
  end

  def left_bracket
    if @current_node.value == 0
      left_counter = 0
      right_counter = 0
      @str[@instruction_pointer + 1..-1].each_char.with_index do |chr, i|
        if chr == "["
          left_counter += 1
        elsif chr == "]"
          if left_counter == right_counter
            @instruction_pointer = i
            return
          else
            right_counter += 1
          end
        end
      end
    end
  end

  def right_bracket
  end

end









