class User::Operation::Demo < Trailblazer::Operation
  step :get_records

  step :request_from_web_app?,
       Output(:success) => Track(:web_app),
       Output(:failure) => Track(:mobile_app)

  step :time_interval_filter,
       Output(:success) => Track(:web_app),
       magnetic_to: :web_app

  step :status_filter,
       Output(:success) => Track(:web_app),
       magnetic_to: :web_app

  step :set_response_for_web,
       magnetic_to: :web_app

  step :state_filter,
       Output(:success) => Track(:mobile_app),
       magnetic_to: :mobile_app

  step :set_response_for_mobile,
       magnetic_to: :mobile_app

  def get_records(ctx, **)
    ctx[:records] = UserRequest.all
    puts 'Recodes has been fetched'
    true
  end

  def request_from_web_app?(ctx, **)
    return ctx[:request_type] == 'web_app'
  end

  def time_interval_filter(ctx, **)
    @time_filtered_records = ctx[:records].select('id', 'status', 'state')
    puts 'time interval filtered'
    true
  end

  def status_filter(_ctx, **)
    @status_filtered_records = @time_filtered_records.select('id', 'state')
    puts 'status filtered'
    true
  end

  def set_response_for_web(_ctx, **)
    puts 'response for web application'
    p @status_filtered_records
  end

  def state_filter(ctx, **)
    @state_filtered_records = ctx[:records].select('id', 'status', 'time_interval')
    puts 'state filtered'
    true
  end

  def set_response_for_mobile(_ctx, **)
    puts 'reponse for mobile application'
    p @state_filtered_records
  end
end
