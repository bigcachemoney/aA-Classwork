/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./frontend/following_toggle.js":
/*!**************************************!*\
  !*** ./frontend/following_toggle.js ***!
  \**************************************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: module */
/*! CommonJS bailout: module.exports is used directly at 64:0-14 */
/***/ ((module) => {

FollowToggle = function ($button) { //$button -> searches through entire _form.html.erb for $button
    this.userId = $button.data("user-id");
    this.followState = $button.data("initial-follow-state");
    this.$button = $button;
    this.render();
    this.$button.click(this.handleClick.bind(this));
}

FollowToggle.prototype.render = function (){
    // debugger
    if (this.followState === "Following") {
        debugger
        this.$button.text("Unfollow");
        // this.$button.prop("disabled", true);
    }
    if (this.followState === "Unfollowing") {
         debugger
        this.$button.text("Follow");
        // this.$button.prop("disabled", true);
    }
    // if (this.followState === "Followed") {
    //     // debugger
    //     this.$button.text("Unfollow");
    //     // this.$button.prop("disabled", false);
    // }
    // if (this.followState === "Unfollowed") {
    //     // debugger
    //     this.$button.text("Follow");
    //     // this.$button.prop("disabled", false);
    // }
}


FollowToggle.prototype.handleClick = function(e){
    const verb = this.followState === "Following" ? "delete" : "post";
    that = this;
     debugger
        e.preventDefault();
        $.ajax({
            method: verb,
            url: `/users/${this.userId}/follow`,
            dataType: "json",
            success : function(){
                debugger
                if (that.followState === "Following"){
                    debugger
                    that.followState = "Unfollowing";
                    debugger
                    that.render();
                }
                if (that.followState === "Unfollowing"){
                    that.followState = "Following";
                    that.render();
                }
            },
            error() {
                // debugger
                console.error("An error occurred.");
            }
        });

}

module.exports = FollowToggle;

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		if(__webpack_module_cache__[moduleId]) {
/******/ 			return __webpack_module_cache__[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
(() => {
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: __webpack_require__ */
const FollowToggle = __webpack_require__(/*! ./following_toggle.js */ "./frontend/following_toggle.js");

$(function () {
    const $buttons = $('.follow-toggle')
    // debugger;
    for (let i = 0; i < $buttons.length; i++){
        const $button = $($buttons[i]); //need to convert $button[i] from object into an jquery array
        new FollowToggle($button);
    }
    
});



// //js goes here :)
// var ChatMachine = require("./ChatMachine.js");

// $(function () {
//     new ChatMachine($('.chat'));
// });

})();

/******/ })()
;
//# sourceMappingURL=bundle.js.map