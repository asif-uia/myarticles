namespace :deploy do
  task :setup_config do
    on roles(:app) do
      config_files = fetch(:config_files)
      unless config_files.nil?
        config_files.each do |file|
          smart_template file
        end
      end

      executable_files = fetch(:executable_config_files)
      unless executable_files.nil?
        executable_files.each do |file|
          execute :chmod, "+x #{shared_path}/config/#{file}"
        end
      end

      symlinks = fetch(:symlinks)
      unless symlinks.nil?
        symlinks.each do |symlink|
          sudo "ln -nfs #{shared_path}/config/#{symlink[:source]} #{sub_strings(symlink[:link])}"
        end
      end
    end
  end
end
