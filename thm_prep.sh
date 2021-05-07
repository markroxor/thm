#!/bin/zsh
ip=$1
sed -i "/export ip/d" ~/.zshrc
echo "export ip=\"$ip\"" >> ~/.zshrc
scp -o StrictHostKeyChecking=no ~/.ssh/id_rsa.pub root@$ip:/root/.ssh/authorized_keys
ssh -o StrictHostKeyChecking=no root@$ip vncserver -kill :1
sleep 5
ssh -o StrictHostKeyChecking=no root@$ip vncserver -geometry 1260x1400
ssh -o StrictHostKeyChecking=no root@$ip sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ssh -o StrictHostKeyChecking=no root@$ip sudo chsh -s /bin/zsh root
scp -o StrictHostKeyChecking=no ~/dotfiles/config/.zshrc root@$ip:
scp -o StrictHostKeyChecking=no ~/dotfiles/config/mark.zsh-theme root@$ip:.oh-my-zsh/themes/
# ssh -o StrictHostKeyChecking=no root@$ip sudo add-apt-repository -y ppa:kelleyk/emacs
# ssh -o StrictHostKeyChecking=no root@$ip sudo apt install -y emacs26
# ssh -o StrictHostKeyChecking=no root@$ip git clone --depth 1 https://github.com/hlissner/doom-emacs /root/.emacs.d
# ssh -o StrictHostKeyChecking=no root@$ip /root/.emacs.d/bin/doom install
vncviewer $ip:5901 -x11cursor
