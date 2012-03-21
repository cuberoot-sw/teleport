version_gem = gem_version("passenger")
version_installed = `passenger-config --version`.strip

if !version_gem
  warn "Passenger is not installed. Please add it to your Gemfile."
elsif version_installed == version_gem.to_s
  banner "Passenger #{version_installed} is already installed"
else
  banner "Installing Nginx via Passenger (installed: #{version_installed}, gem version: #{version_gem})"
  run "passenger-install-nginx-module", %w(--auto --auto-download --prefix=/opt/nginx)  # install without prompting
  run "update-rc.d nginx defaults"                                                      # activate autostart
  run "service nginx restart"                                                           # restart nginx
end
