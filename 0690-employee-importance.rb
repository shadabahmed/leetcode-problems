=begin
# Employee info
class Employee
    attr_accessor :id, :importance, :subordinates
    def initialize( id, importance, subordinates)
        # It's the unique id of each node.
        # unique id of this employee
        @id = id
        # the importance value of this employee
        @importance = importance
        # the id of direct subordinates
        @subordinates = subordinates
    end
end
=end
# @param {Employee} employees
# @param {Integer} id
# @return {Integer}
def get_importance(employees, id)
  employee = employees.find{|e| e.id == id}
  return 0 unless employee
  sum = employee.importance
  employee.subordinates.each do |subordinate_id|
    sum += get_importance(employees, subordinate_id)
  end
  sum
end