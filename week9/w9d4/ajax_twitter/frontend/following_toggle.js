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