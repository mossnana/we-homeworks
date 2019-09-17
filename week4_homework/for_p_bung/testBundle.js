/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

	context = __webpack_require__(1);
	context.keys().forEach(context);
	module.exports = context;


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

	var map = {
		"./test_case.js": 2
	};
	function webpackContext(req) {
		return __webpack_require__(webpackContextResolve(req));
	};
	function webpackContextResolve(req) {
		return map[req] || (function() { throw new Error("Cannot find module '" + req + "'.") }());
	};
	webpackContext.keys = function webpackContextKeys() {
		return Object.keys(map);
	};
	webpackContext.resolve = webpackContextResolve;
	module.exports = webpackContext;
	webpackContext.id = 1;


/***/ }),
/* 2 */
/***/ (function(module, exports, __webpack_require__) {

	var expect = __webpack_require__(3).expect;
	var {checkGrade} = __webpack_require__(4)

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



/***/ }),
/* 3 */
/***/ (function(module, exports) {

	module.exports = require("chai");

/***/ }),
/* 4 */
/***/ (function(module, exports) {

	exports.checkGrade = (point) => {
	    if(point >= 80) {
	        return "A"
	    } else if(point >= 70) {
	        return "B"
	    } else if(point >= 60) {
	        return "C"
	    } else if(point >= 50) {
	        return "D"
	    } else {
	        return "F"
	    }
	}

/***/ })
/******/ ]);