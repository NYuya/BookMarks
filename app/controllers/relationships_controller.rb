class RelationshipsController < ApplicationController

  def followed
    @customer = Customer.find(params[:id])
    @customers = @customer.following_customer
  end

  def follower
    @customer = Customer.find(params[:id])
    @customers = @customer.follower_customer
  end


  def create
    customer = Customer.find(params[:follow_id])
    following = current_customer.follow(customer)
    if following.save
      flash[:success] = 'ユーザーをフォローしました'
      redirect_back(fallback_location: root_path)
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    customer = Customer.find(params[:follow_id])
    following = current_customer.unfollow(customer)
    if following.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
      redirect_back(fallback_location: root_path)
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_back(fallback_location: root_path)
    end
  end


end
