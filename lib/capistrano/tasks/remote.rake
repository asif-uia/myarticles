namespace :remote do
  %w(restart).each do |command|
    desc "Commands [#{command}] for puma application"
    task command do
      on roles(:app, select: :primary), in: :sequence, wait: 5 do
        sudo "/usr/sbin/service nginx stop"
        execute "/etc/init.d/puma_#{fetch(:full_app_name)} #{command}"
        sudo "/usr/sbin/service nginx start"
      end
    end
  end

  %w(start stop status).each do |command|
    desc "Commands [#{command}] for puma application"
    task "force_#{command}" do
      on roles(:app), in: :sequence, wait: 5 do
        execute "/etc/init.d/puma_#{fetch(:full_app_name)} #{command}"
      end
    end
  end

  %w(restart).each do |command|
    desc "Commands [#{command}] for puma application"
    task "force_#{command}" do
      on roles(:app), in: :sequence, wait: 5 do
        execute "/etc/init.d/puma_#{fetch(:full_app_name)} #{command}"
      end
    end
  end
end