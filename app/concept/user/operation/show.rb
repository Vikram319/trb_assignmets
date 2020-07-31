module User::Operation
  class Show < Trailblazer::Operation

    step :find
    fail :set_error_message

    def find(ctx, id:, **)
      ctx[:user] = User.find_by(id: id)
    end

    def set_error_message(ctx, **)
      ctx[:error] = "User does not exit"
    end
  end
end
