// Lab 2 Part 1 - Tuples

typealias Employee = (name: String, id: String, jobtitle: String, yearOfService: Int, annualSalary: Double)

// employee tuple array
let employees: [Employee] = [
    (name: "Peter Long", id: "112-22-3011", jobtitle: "Volunteer Worker", yearOfService: 5, annualSalary: 1200.00),
    (name: "Martine Short", id: "116-23-6418", jobtitle: "Manager", yearOfService: 8, annualSalary: 78600.00),
    (name: "Susan Johnson", id: "123-32-3515", jobtitle: "Receptionist", yearOfService: 10, annualSalary: 38600.00),
    (name: "Paul Simon", id: "133-53-4019", jobtitle: "System Support Analyst", yearOfService: 8, annualSalary: 65000.00)
]

for employee in employees{
    print("Name: \(employee.name), ID: \(employee.id), Title: \(employee.jobtitle)")
}

func findHighestSalary(emps: [Employee]) -> Employee {
    return emps.max {$0.annualSalary < $1.annualSalary}!
}

print ("Highest paid employee: , \(findHighestSalary(emps: employees)) \n")

// instantiate dict to contain Employee objects
var dict_employees: [String: Employee] = [:]
for emp in employees{
    dict_employees[emp.id] = emp
}

for (id, emp) in dict_employees{
    print("Name: \(id), ID: \(emp.name), Title: \(emp.jobtitle)")
}

func FindHighestSalaryDict(emps: [String: Employee]) -> Employee? {
    return emps.values.max { $0.annualSalary < $1.annualSalary }
}

print("Highest paid employee from dictionary: \(FindHighestSalaryDict(emps: dict_employees)!)")
