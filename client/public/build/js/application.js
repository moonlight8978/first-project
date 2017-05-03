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

	'use strict';

	var _app = __webpack_require__(1);

	var _app2 = _interopRequireDefault(_app);

	var _eroges = __webpack_require__(2);

	var _eroges2 = _interopRequireDefault(_eroges);

	var _form = __webpack_require__(3);

	var _form2 = _interopRequireDefault(_form);

	var _app3 = __webpack_require__(4);

	var _app4 = _interopRequireDefault(_app3);

	var _eroges3 = __webpack_require__(5);

	var _eroges4 = _interopRequireDefault(_eroges3);

	var _form3 = __webpack_require__(6);

	var _form4 = _interopRequireDefault(_form3);

	function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

	_app2.default.controller('ErogesController', _eroges2.default).controller('FormController', _form2.default);

	_app2.default.config(_app4.default).config(_eroges4.default).config(_form4.default);

/***/ }),
/* 1 */
/***/ (function(module, exports) {

	'use strict';

	Object.defineProperty(exports, "__esModule", {
	    value: true
	});
	angular.module('app', ['ui.router', 'ngMap', 'angular-loading-bar', 'ngStorage', 'ngResource', 'ui.bootstrap']);

	var appModule = angular.module('app');

	exports.default = appModule;

/***/ }),
/* 2 */
/***/ (function(module, exports) {

	'use strict';

	Object.defineProperty(exports, "__esModule", {
	    value: true
	});

	function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

	var ErogesController = function ErogesController($resource) {
	    var _this = this;

	    _classCallCheck(this, ErogesController);

	    this.eroges = [];
	    $resource('http://localhost:3000/eroges/:id', { 'query': { method: 'GET', isArray: true } }).query(function (results) {
	        _this.eroges = results;
	        console.log('GET!');
	    });
	};

	ErogesController.$inject = ['$resource'];

	exports.default = ErogesController;

/***/ }),
/* 3 */
/***/ (function(module, exports) {

	'use strict';

	Object.defineProperty(exports, "__esModule", {
	    value: true
	});

	var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

	function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

	var FormController = function () {
	    function FormController($resource, $q) {
	        _classCallCheck(this, FormController);

	        this.$resource = $resource;
	        this.product = {
	            price: 0,
	            title: '',
	            original: '',
	            product_type: ''
	        };
	    }

	    _createClass(FormController, [{
	        key: 'submit',
	        value: function submit() {
	            this.$resource('http://localhost:3000/products/:id', { 'save': { method: 'POST' } }).save(this.product, function (response) {
	                console.log('Success!');
	            });
	        }
	    }]);

	    return FormController;
	}();

	FormController.$inject = ['$resource', '$q'];

	exports.default = FormController;

/***/ }),
/* 4 */
/***/ (function(module, exports) {

	'use strict';

	Object.defineProperty(exports, "__esModule", {
	    value: true
	});
	function appState($stateProvider, $urlRouterProvider, $locationProvider) {
	    $stateProvider.state('app', {
	        url: '',
	        views: {}
	    });

	    // $locationProvider.html5Mode({
	    //     enabled: true,
	    //     requireBase: false
	    // });
	    $locationProvider.hashPrefix('');
	    $urlRouterProvider.otherwise('/');
	};

	appState.$inject = ['$stateProvider', '$urlRouterProvider', '$locationProvider'];

	exports.default = appState;

/***/ }),
/* 5 */
/***/ (function(module, exports) {

	'use strict';

	Object.defineProperty(exports, "__esModule", {
	    value: true
	});
	function erogesState($stateProvider) {
	    $stateProvider.state('eroges', {
	        parent: 'app',
	        url: '/eroges',
	        views: {
	            'content@': {
	                templateUrl: 'app/eroges/eroges.html',
	                controller: 'ErogesController',
	                controllerAs: 'vm'
	            }
	        }
	    });
	}

	erogesState.$inject = ['$stateProvider'];

	exports.default = erogesState;

/***/ }),
/* 6 */
/***/ (function(module, exports) {

	'use strict';

	Object.defineProperty(exports, "__esModule", {
	    value: true
	});
	function formState($stateProvider) {
	    $stateProvider.state('form', {
	        parent: 'app',
	        url: '/form',
	        views: {
	            'content@': {
	                templateUrl: 'app/form/form.html',
	                controller: 'FormController',
	                controllerAs: 'vm'
	            }
	        }
	    });
	}

	formState.$inject = ['$stateProvider'];

	exports.default = formState;

/***/ })
/******/ ]);