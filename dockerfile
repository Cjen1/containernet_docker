FROM containernet/containernet:latest

COPY init.vim /root/.config/nvim/init.vim
RUN mkdir /root/.install/ && curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /root/.install/install_dein.sh
RUN chmod -R 777 /root/.install

RUN /root/.install/install_dein.sh ~/.cache/dein
RUN echo 'alias vim=nvim' >> ~/.bashrc
RUN mkdir -p ~/.config/neovim
RUN add-apt-repository ppa:neovim-ppa/stable -y 
RUN apt update
RUN apt install -y neovim

COPY install*.sh /root/.install/
RUN chmod -R 777 /root/.install
RUN /root/.install/install.sh
RUN /root/.install/install_zk.sh
RUN /root/.install/install_etcd.sh
RUN /root/.install/install_ocaml_paxos.sh
RUN /root/.install/install_ivs.sh

