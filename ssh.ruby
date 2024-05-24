require 'net/ssh'

Net::SSH.start(
  ENV.fetch('SSH_IP'),
  'linuxserver.io',
  keys: 'id_ed25519',
  port: 2222
  ) do |ssh|
  output = ssh.exec!('cp sample.txt sample6.txt')
end
