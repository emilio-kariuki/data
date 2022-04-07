const mongoose = require('mongoose');
const schema = mongoose.Schema;

const EmployeeSchema = new schema({
    name: {
        type: String,
    },
    employeeNo: {
        type: Number,
    }
});
const Employee = mongoose.model('employee', EmployeeSchema);
module.exports = Employee;