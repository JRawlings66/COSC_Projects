// Lab 2 Part 2 - Structs

struct Employee{
    let name: String?
    let id: String?
    let jobtitle: String?
    let yearOfService: Int?
    let annualsalary: Double?
    
    init (name: String? = nil, id: String? = nil, title: String? = nil, year: Int? = nil, salary: Double? = nil){
        self.name = name
        self.id = id
        jobtitle = title
        yearOfService = year
        annualsalary = salary
    } // init
} //struct

// create array of Employee struct objects
let structEmployees: [Employee] = [
    Employee(name: "Peter Long", id: "112-22-3011", title: "Volunteer Worker", year: 5, salary: 1200.00),
    Employee(name: "Martine Short", id: "116-23-6418", title: "Manager", year: 8, salary: 78600.00),
    Employee(name: "Susan Johnson", id: "123-32-3515", title: "Receptionist", year: 10, salary: 38600.00),
    Employee(name: "Paul Simon", id: "133-53-4019", title: "System Support Analyst", year: 8, salary: 65000.00)
]

for emp in structEmployees{
    print("Name: \(emp.name ?? ""), ID: \(emp.id ?? ""), Job Title: \(emp.jobtitle ?? "")")
}

func highestSalaryStruct(emps: [Employee]) -> Employee {
    return emps.max { ($0.annualsalary ?? 0) < ($1.annualsalary ?? 0) }!
}

print("\nHighest paid employee: \(highestSalaryStruct(emps: structEmployees).name ?? ""), Title: \(highestSalaryStruct(emps: structEmployees).jobtitle ?? ""), Salary: $\(highestSalaryStruct(emps: structEmployees).annualsalary ?? 0.0)")


