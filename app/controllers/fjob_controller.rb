class FjobController < ApplicationController

    def create
            fjob= Fjob.new
            fjob.name=current_user.name
            fjob.nickname=current_user.nickname
            fjob.portfolio_img=params[:fjob_portfolio_img]
            fjob.career=params[:fjob_career]
            fjob.category=params[:fjob_category]
            fjob.contract=params[:fjob_contract]
            fjob.date=params[:fjob_date]
            fjob.starttime=params[:fjob_starttime]
            fjob.endtime=params[:fjob_endtime]
            fjob.timetotal=params[:fjob_timetotal]
            fjob.home_environment=params[:fjob_home_environment]
            fjob.location=params[:fjob_location]
            fjob.save
           redirect_to '/review/create_review'
    end

    def show
        @fjob=Fjob.find(current_user.id)
        @friend=Friendship.all
        @count=0 #요청온 파트너 counter
        @myreview=Review.find(current_user.id)
       
    end
    
    def homepage
        @recommend=Review.all
    end

    def new
            
    end
       
    def category
       @fjob = Fjob.all
       
    end
       
    def edit
        @edit_fjob=Fjob.find(current_user.id)

    end
    
    def update
        update_fjob=Fjob.find(current_user.id)
        update_fjob.portfolio_img=params[:fjob_portfolio_img]
        update_fjob.career=params[:fjob_career]
        update_fjob.category=params[:fjob_category]
        update_fjob.contract=params[:fjob_contract]
        update_fjob.date=params[:fjob_date]
        update_fjob.starttime=params[:fjob_starttime]
        update_fjob.endtime=params[:fjob_endtime]
        update_fjob.timetotal=params[:fjob_timetotal]
        update_fjob.home_environment=params[:fjob_home_environment]
        update_fjob.location=params[:fjob_location]
        update_fjob.save
        redirect_to'/fjob/show/:current_user.id'
    end
    
    def search_result
        @search_data = Fjob.where('nickname = ? OR category = ? OR location = ? OR career = ?', params[:search_want], params[:search_want], params[:search_want], params[:search_want])
        @c_user=Fjob.find(current_user.id)
        if params[:contract].blank? == true
            params[:contract] =params[:fjob_contract]
        end
        if params[:start_time].blank? == true
            params[:start_time] =params[:fjob_starttime]
        end
        if params[:end_time].blank? == true
            params[:end_time] =params[:fjob_endtime]
        end
        
        if params[:city].blank? == true
            params[:city] =params[:fjob_location]
        end
        if params[:gu].blank? == true
            params[:gu] =params[:fjob_location]
        end
        if params[:working_time].blank? == true
            params[:working_time] =params[:fjob_timetotal]
        end
        @check_data = Fjob.where('contract = ?', params[:contract]).where('starttime = ?', params[:start_time]).where('endtime = ?', params[:end_time]).where('timetotal = ?', params[:totaltime]).where('location = ? OR location = ?', params[:city], params[:gu])
    end
    
    def profile
         @p_job=Fjob.find(params[:id])
         @p_user=User.find(params[:id])
    end
    
  end
