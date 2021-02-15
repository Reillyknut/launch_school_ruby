# 5)

class Element
  attr_accessor :next

  def initialize(element, next_el = nil)
    @element = element
    @next = next_el
  end

  def datum
    @element
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_reader :top_element

  def initialize
    @top_element = nil
  end

  def self.from_a(list)
    new_list = SimpleLinkedList.new
    list&.reverse_each { |el| new_list.push(el) }
    new_list
  end

  def push(element)
    @top_element = Element.new(element, top_element)
  end

  def empty?
    top_element.nil?
  end

  def pop
    return nil if top_element.nil?

    old_top_element = top_element
    @top_element = top_element.next

    old_top_element.datum
  end

  def peek
    top_element ? top_element.datum : nil
  end

  def size
    return 0 if top_element.nil?

    total = 1
    next_element = top_element.next

    until next_element.nil?
      total += 1
      next_element = next_element.next
    end

    total
  end

  def head
    top_element
  end

  def next
    self.next
  end

  def reverse
    array = to_a.reverse
    SimpleLinkedList.from_a(array)
  end

  def to_a
    array = []
    el = top_element

    until el.nil?
      until el.datum.nil?
        array << el.datum
        el = el.next
        break if el.nil?
      end
    end

    array
  end
end
