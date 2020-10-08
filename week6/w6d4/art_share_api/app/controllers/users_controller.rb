class UsersController < ApplicationController #Note that controllers are always plural
    def index
        render plain: "I'm in the index action!"
    end

    def create
        user = User.new(user_params) #params.require(:user).permit(:name, :email)
        # replace the `user_attributes_here` with the actual attribute keys
        if user.save
            render json: user
        else  
            render json: user.errors.full_message, status: :unprocessable_entity
        end
    end

    #save! will raise an error if not successful.
    #save will return boolean value like true or false.

    #example from class
#   def create
    #   user = User.new(params.require(:user).permit(:user_attributes_here))

    #   # replace the `user_attributes_here` with the actual attribute keys

    #   user.save!
    #   render json: user
#   end

    def show
        render json: params
    end 

    def update
        
    end  

#   protected
#   def toy_params
#     self.params[:toy].permit(:cat_id, :name, :ttype)
#   end

    protected
    def user_params
        params.require(:user).permit(:name, :email)
    end 

end

# class DropsController < ApplicationController
#   def index
#     # index should get all of a resource and send it to user 
#     drops = Drop.all 
#     render json: drops 
#   end

#   def show 
#     # debugger
#     drop = Drop.find(params[:id])
#     render json: drop
#   end

#   def create
#     # debugger
#     drop = Drop.new(drop_params)
#     # we dont' want to use .save! or .create! because it would throw an error
#     # we want to decide what happens if the save is successful or not
#     if drop.save
#       render json: drop 
#     else
#       render json: drop.errors.full_messages, status: 422
#     end
#   end

#   def update
#     # debugger
#     drop = Drop.find(params[:id])
#     if drop.update(drop_params) # this is using the ActiveRecord update method 
#       redirect_to drop_url(drop)
#     else
#       render json: drop.errors.full_messages, status: :unprocessable_entity
#     end
#   end

#   def destroy
#     # debugger
#     drop = Drop.find(params[:id])
#     drop.destroy
#     redirect_to drops_url
#   end

#   # private
#   def drop_params
#     params.require(:drop).permit(:body, :author_id)
#     # require looks for top level key of `drop` within params
#     # then only grabs (permits) the keys within drop of body and author_id
#   end 
# end