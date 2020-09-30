require 'byebug'

class PolyTreeNode
    attr_reader :value, :parent, :children
    def initialize(value, children = [] ) 
        @value = value
        @parent = nil
        @children = children
    end

    def inspect
        @value
    end

    def parent=(new_parent_node) 
        old_parent_node = self.parent 
        @parent = new_parent_node

        @parent.children << self if @parent != nil && !@parent.children.include?(self) 
        old_parent_node.children.delete(self)  if old_parent_node != nil && old_parent_node != @parent
    end


    def add_child(child)
        child.parent = self
    end

    def remove_child(child)
        if child.parent == nil
           raise "node is not a child"
        else
            child.parent = nil
        end
    end

    def dfs(value)
        return self if self.value == value
        self.children.each do |child|
            result = child.dfs(value)  
            return result unless result.nil?
        end
        nil
    end

          

    def bfs(value)
        # debugger
        queue = [self] #[5,4]
        until queue.empty?
            ele = queue.shift 
            if value == ele.value 
                return self
            end
            ele.children.each {|child| queue << child } #[2,3]
        end
    end
end

