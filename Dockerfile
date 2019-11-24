FROM centos:7

LABEL description="MZ-800 Emulator by Michal Hucik \
                   https://sourceforge.net/projects/mz800emu/ \ 
                   runs in Docker" \
      maintainer="pavel@suchmann.cz"

RUN yum groupinstall -y 'Development Tools'
RUN yum install -y mercurial make cmake autoconf automake libtool 
RUN yum install -y alsa-lib-devel libXScrnSaver libXScrnSaver-devel \
      libogg-devel libvorbis-devel libxkbcommon libxkbcommon-devel \
      mesa-libGLES mesa-libGLES-devel mesa-libGLU-devel systemd-devel
RUN yum install -y pulseaudio-libs-glib2 pulseaudio-libs pulseaudio \
      pulseaudio-module-x11 pulseaudio-utils \
      pulseaudio-gdm-hooks pulseaudio-libs-devel
RUN yum install -y gtk3 gtk3-devel
RUN yum install -y libsoup-devel

#instead of RUN yum install -y SDL2:
WORKDIR /usr/local/src 
RUN curl -O https://www.libsdl.org/release/SDL2-2.0.5.tar.gz 
RUN tar zxvf SDL2-2.0.5.tar.gz
WORKDIR SDL2-2.0.5
RUN ./configure && make && make install

WORKDIR /root 
RUN svn checkout https://svn.code.sf.net/p/mz800emu/code/ mz800emu
WORKDIR mz800emu/trunk
RUN make CONF=Debug-Linux

CMD ["/root/mz800emu/trunk/dist/Debug-Linux/GNU-Linux/mz800emu"] 


