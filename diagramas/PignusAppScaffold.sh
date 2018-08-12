rails g scaffold VehicleType name:string:uniq description:text
rails g scaffold SecurityCompany business_name:string:uniq address:string phone:string email:string:uniq identification:string:uniq
rails g scaffold ItemType name:string:uniq description:text
rails g scaffold WeaponLocation name:string:uniq phone:string contact:string notes:string
rails g scaffold MemberType name:string:uniq description:text
rails g scaffold AgentType name:string:uniq type:string:uniq
rails g scaffold EventType name:string:uniq description:text
rails g scaffold CommunityType name:string:uniq description:text
rails g scaffold WeaponType name:string:uniq type:string
rails g scaffold StaffJob name:string description:text
rails g scaffold SecurityAgentRole name:string:uniq description:text
rails g scaffold Country name:string:uniq
rails g scaffold EventStatus name:string:uniq description:text
rails g scaffold ContractStatus name:string:uniq description:text
rails g scaffold AlertStatus name:string:uniq description:text
rails g scaffold EndowmentStatus name:string:uniq description:text
rails g scaffold CheckVehicleStatus name:string:uniq description:text
rails g scaffold AssetStockStatus name:string:uniq description:text
rails g scaffold WeaponStatus name:string:uniq description:text
rails g scaffold BlackListStatus name:string:uniq description:text
rails g scaffold AssetStatus name:string:uniq description:text
rails g scaffold ItemStatus name:string:uniq description:text
rails g scaffold DayOfWeek name:string:uniq
rails g scaffold Vehicle plate_number:string:uniq colour:string year:string brand:string model:string engine_number:string engine_size:integer vehicle_type:references
rails g scaffold Weapon name:string weapon_status:references notes:string weapon_type:references weapon_location:references
rails g scaffold Schedule name:string start_hour:time end_hour:time day_of_week:references
rails g scaffold Asset name:string notes:string entry_date:date quantity:integer location:string asset_status:references who:string
rails g scaffold City name:string:uniq country:references
rails g scaffold Person last_name:string first_name:string phone:string identification:string:uniq city:references home_address:string office_address:string
rails g scaffold Community name:string:uniq address:string phone:string admin_address:string email:string:uniq webSite:string attendant:string notes:string postal_code:string community:references community_type:references
rails g scaffold Member address:string office_address:string notes:string community:references person:references
rails g scaffold SecurityAgent security_agent_role:references division:string admission_date:date security_company:references security_agent:references weapon:references agent_type:references schedule:references person:references
rails g scaffold Visitor checkin_date:date checkout_date:date notes:string destination:string vehicle:references community:references person:references
rails g scaffold CheckVehicle id:string entry_date:string notes:string exit_date:date cost:double check_vehicle_status:references station:string community:references vehicle:references
rails g scaffold AssetStock stock_name:string manager:string last_update:date asset_stock_status:references asset:references community:references
rails g scaffold LostObject name:string date:date notes:string returned_to:string return_date:date phone:string community:references
rails g scaffold Contract title:string date:date expiration:date type:string notes:string contractor:string hired:string contract_status:references community:references security_company:references
rails g scaffold Endowment stock_name:string date:date accountable:string endowment_status_id:string contract:references
rails g scaffold Event title:string notes:string date:date hour:time reported_by:string site:string facts:string event_status:references location:string end_date:date end_hour:time contact_name:string contact_phone:string community:references event_type:references secutity_agent:references
rails g scaffold Staff name:string phone:string admission_date:date notes:string address:string staff:references staff_Job:references community:references
rails g scaffold CheckStaff entry_date:date exit_date:date notes:string staff:references
rails g scaffold BlackList notes:string date:date black_list_status:references facts:string person:references
rails g scaffold User username:string:uniq password:string last_login:date email:string:uniq person:references
rails g scaffold Alert title:string content:string creation_date:date alert_status:references coordinates:string evidence:string community:references user:references
rails g scaffold Layout name:string address:string phone:string attendant:string community:references
rails g scaffold Item name:string item_status:references amount:integer characteristics:string accountable:string endowment:references item_type:references
rails g scaffold MinuteBook date:date generated_by:string notes:string file:string community:references
rails g scaffold MemberTypeMember member:references member_type:references
rails g scaffold AlertCommunity alert_community:references community:references alert:references
rails g scaffold CommunityStaff staff:references community:references
rails g scaffold AgentSchedule schedule:references security_agent:references contract:references
