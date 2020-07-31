module User::Operation
  class Index < Trailblazer::Operation
    step :fetch_users
    step :request_valid?
    fail :set_error_message, fail_fast: true
    step :sample_step
    fail :set_second_error_message

    def fetch_users(ctx, **)
      ctx[:users] = User.all
    end

    def request_valid?(ctx, **)
      ctx[:is_valid]
    end

    def sample_step(_ctx, **)
      true
    end

    def set_error_message(ctx, **)
      ctx[:error] = 'Invalid request'
    end

    def set_second_error_message(ctx, **)
      ctx[:error] = 'Invalid second request'
    end
  end
end
