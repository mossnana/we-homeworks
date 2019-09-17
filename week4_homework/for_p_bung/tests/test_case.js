var expect = require('chai').expect;
var {checkGrade} = require('../grade')

let gradeA = checkGrade(80)
let gradeB = checkGrade(70)
let gradeC = checkGrade(60)
let gradeD = checkGrade(50)
let gradeF = checkGrade(49)

describe('Case Point = 80, Grade must be A', function() {
  it('Should pass', function() {
    expect(gradeA).to.equal("A");
  });
});

describe('Case Point = 70, Grade must be B', function() {
  it('Should pass', function() {
    expect(gradeB).to.equal("B");
  });
});

describe('Case Point = 60, Grade must be C', function() {
  it('Should pass', function() {
    expect(gradeC).to.equal("C");
  });
});

describe('Case Point = 50, Grade must be D', function() {
  it('Should pass', function() {
    expect(gradeD).to.equal("D");
  });
});

describe('Case Point = 49, Grade must be F', function() {
  it('Should pass', function() {
    expect(gradeF).to.equal("F");
  });
});

