class WelcomeController < ApplicationController

    def trigger_job
        HelloWorldJob.perform_now
        redirect_to other_job_done_path
    end
end
