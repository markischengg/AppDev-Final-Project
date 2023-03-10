Rails.application.routes.draw do

  # Routes for the Offering resource:
  get("/", { :controller => "user_authentication", :action => "sign_in_form"})

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })

  #USER HOMEPAGE
  get("/user_homepage", { :controller => "user_authentication", :action => "homepage" })  
  #------------------------------

  #SELECT A OFFERING HOMEPAGE
  get("/offerings", { :controller => "offerings", :action => "index"})
  # CREATE
  post("/insert_offering", { :controller => "offerings", :action => "create" })
  
  get("/offerings/:path_id", { :controller => "offerings", :action => "show" })
  
  # UPDATE
  
  post("/modify_offering/:path_id", { :controller => "offerings", :action => "update" })
  
  # DELETE
  get("/delete_offering/:path_id", { :controller => "offerings", :action => "destroy" })

  #------------------------------

  # Routes for the Booking resource:
  
  #BOOKING HOMEPAGE
  get("/bookings", { :controller => "bookings", :action => "index"})

  get("/bookingschedule/:date", { :controller => "bookings", :action => "index"})

  # INSERT BOOKING
  post("/insert_booking", { :controller => "bookings", :action => "create" })
  
  get("/bookings/:path_id", { :controller => "bookings", :action => "show" })
  
  # UPDATE
  
  post("/modify_booking/:path_id", { :controller => "bookings", :action => "update" })
  
  # DELETE
  get("/delete_booking/:path_id", { :controller => "bookings", :action => "destroy" })

  #------------------------------

  # Routes for the Court resource:

  # CREATE
  post("/insert_court", { :controller => "courts", :action => "create" })
          
  # READ
  get("/courts", { :controller => "courts", :action => "index" })
  
  get("/courts/:path_id", { :controller => "courts", :action => "show" })
  
  # UPDATE
  
  post("/modify_court/:path_id", { :controller => "courts", :action => "update" })
  
  # DELETE
  get("/delete_court/:path_id", { :controller => "courts", :action => "destroy" })

  #------------------------------


  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------


   #------------------------------

  # Routes for the Calendar/Scehdule:
  get("/calendar/:date", {:controller => "calendar", :action => "show"})

end
