namespace :nginx do
  %w(start stop restart reload).each do |task_name|
    desc "#{task} Nginx"
    task "force_#{task}" do
      on roles(:app), in: :sequence, wait: 5 do
        sudo "/usr/sbin/service nginx #{task_name}"
      end
    end
  end
end

