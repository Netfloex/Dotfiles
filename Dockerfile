FROM archlinux/archlinux
RUN pacman -Sy --noconfirm git python3 zsh fakeroot sudo binutils

ENV HOME /home/nobody

WORKDIR $HOME

COPY --chown=nobody:nobody . $HOME

RUN chown nobody:nobody $HOME


RUN echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER nobody:wheel

# Install only packages specified for docker
RUN sed -n '/^#D/,$p' package-list.sh > temp && mv temp package-list.sh

# Disable powerlevel10k
RUN sed -i "s/powerlevel10k\/powerlevel10k/af-magic/" files/.zshrc 

RUN scripts/yay
RUN scripts/packages
RUN ./install

# Create an empty histdb dir
RUN mkdir ~/.histdb && ~/.oh-my-zsh/custom/plugins/zsh-histdb/histdb-migrate ~/.histdb/zsh-history.db || true

CMD [ "/bin/zsh" ]