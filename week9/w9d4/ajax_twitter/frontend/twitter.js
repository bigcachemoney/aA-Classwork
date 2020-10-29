const FollowToggle = require("./following_toggle.js");

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
