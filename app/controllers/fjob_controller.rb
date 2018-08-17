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
        if (params[:create].nil? and params[:edit].nil? and params[:write].nil? and  params[:photo].nil? and params[:design].nil? and params[:trans].nil? and params[:market].nil? and params[:etc].nil?) == false
            params[:create] = "creat"
            params[:edit] = "edit"
            params[:write] = "write"
            params[:photo] = "photo"
            params[:design] = "design"
            params[:trans] = "trans"
            params[:market] = "market"
            params[:etc] = "etc"
        end
        if (params[:mon].nil? and params[:tue].nil? and params[:wed].nil? and params[:thu].nil? and params[:fri].nil? and params[:sat].nil? and params[:sun].nil?) == false
            params[:mon] = "mon"
            params[:tue] = "tue"
            params[:wed] = "wed"
            params[:thu] = "thu"
            params[:fri] = "fri"
            params[:sat] = "sat"
            params[:sun] = "sun"
        end
        if (params[:contract].nil?) == false
            params[:contract] = Fjob.all
        end
        if (params[:start_time].nil?) == false
            params[:start_time] = Fjob.all
        end
        if (params[:end_time].nil?) == false
            params[:end_time] = Fjob.all
        end
        
        if (params[:city].nil?) == false
            params[:city] = Fjob.all
        end
        if (params[:gu].nil?) == false
            params[:gu] = Fjob.all
        end
        if (params[:working_time].nil?) == false
            params[:working_time] = Fjob.all
        end
        if (params[:home].nil? and params[:office].nil?) == false
            params[:home] = "home"
            params[:office] = "office"
        end
        @check_data = Fjob.where('category = ? OR category = ? OR category = ? OR category = ? OR category = ? OR category = ? OR category = ? OR category = ?', params[:create], params[:edit], params[:write], params[:photo], params[:design], params[:trans], params[:market], params[:etc]).where('date = ? OR date = ? OR date = ? OR date = ? OR date = ? OR date = ? OR date = ?', params[:mon], params[:tue], params[:wed], params[:thu], params[:fri], params[:sat], params[:sun]).where('contract = ?', params[:contract]).where('starttime = ?', params[:start_time]).where('endtime = ?', params[:end_time]).where('timetotal = ?', params[:totaltime]).where('location = ? OR location = ?', params[:city], params[:gu]).where('home_environment = ? OR home_environment = ?', params[:home], params[:office])
    end
    
    def profile
         @p_job=Fjob.find(params[:id])
         @p_user=User.find(params[:id])
    end
    
  end
