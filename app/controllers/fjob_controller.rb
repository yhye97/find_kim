class FjobController < ApplicationController
    
    def create
            fjob= Fjob.find(current_user.id)
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
          redirect_to :action => "show", :id => current_user.id
    end

    def show
        @fjob=Fjob.find(current_user.id)
        @friend=Friendship.all
        @count=0 #요청온 파트너 counter
        @myreview=Review.find(current_user.id)
       
    end
    
    #  def homepage
    #      @fjob=Fjob.find(current_user.id)  #완식이 추가함 
    #      @recommend=Review.all
    #      @r_cateogry=Fjob.all
    #  end

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
        redirect_to :action => "show", :id => current_user.id
    end
    
    def search_result
        @search_data = Fjob.where('nickname = ? OR category = ? OR location = ? OR career = ?', params[:search_want], params[:search_want], params[:search_want], params[:search_want])
        @c_user=Fjob.find(current_user.id)
        contract = params[:contract]
        start_time = params[:start_time]
        end_time = params[:end_time]
        city = params[:city]
        gu = params[:gu]
        working_time = params[:working_time]
        if contract.nil? == true
            contract= Fjob.all
        end
        if start_time.nil? == true
            start_time = Fjob.all
        end
        if end_time.nil? == true
            end_time = Fjob.all
        end
        
        if city.nil? == true
            city = Fjob.all
        end
        if gu.nil? == true
            gu = Fjob.all
        end
        if working_time.nil? == true
            working_time = Fjob.all
        end
        @check_data = Fjob.where('contract = ?', contract).where('starttime = ?', start_time).where('endtime = ?', end_time).where('timetotal = ?', working_time).where('location = ? OR location = ?', city, gu)
    end
    
    def profile
         @p_job=Fjob.find(params[:id])
         @p_user=User.find(params[:id])
    end
    
  end
