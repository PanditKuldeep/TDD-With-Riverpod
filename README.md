# TDD with Riverpod

Test-driven development (TDD) example with Riverpod

## Getting Started

TDD stands for **Test-Driven Development**, which is a software development approach that prioritizes writing tests before writing the actual code. 

The process typically involves the following steps:

**Step 1 Write a Test**:
Before writing any code for a new feature or modifying existing code, developers write a test case that defines a specific function or improvement the code should achieve. 
These tests are written in anticipation of the code that needs to be implemented.


**Step 2 Run the Test**:
Execute the test to ensure it fails initially. This step confirms that the test is valid and that it accurately reflects the desired behavior of the code that will be implemented.


**Step 3 Write the Code**:
Develop the minimum amount of code necessary to make the test pass. The focus is on creating a solution that satisfies the test case.


**Step 4 Run All Tests**:
Execute all the tests to ensure that the new code doesn't break any existing functionality. 
This step is crucial for maintaining the reliability of the codebase.


**Step 5 Refactor the Code (if needed)**:
After the tests pass, the developer may refactor the code to improve its structure, readability, or performance.
The key is to make these improvements without changing the external behavior of the code.


**Step 6 Repeat**:
Iterate through this cycle by writing additional tests, implementing code, and refactoring until the software meets the desired specifications.


## Code snippet

```
test('email cannot be null or empty',(){
bool caseOne = validator.validateEmail(value: null);
bool caseTwo = validator.validateEmail(value: '');
expect(caseOne, false);
expect(caseTwo, false);
});
```
