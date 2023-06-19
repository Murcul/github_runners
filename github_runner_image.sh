# Install docker
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update apt package and isntall docker
sudo apt update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Add murcul user to docker group (necessary to run command without using `sudo`)
sudo usermod -aG docker gitstart

# Install git
sudo apt-get install git-all

# Install apt tools
sudo apt-get install -y acl=2.3.1-1 \
aria2=1.36.0-1 \
autoconf=2.71-2 \
automake=1:1.16.5-1.3 \
binutils=2.38-4ubuntu2.2 \
bison=2:3.8.2+dfsg-1build1 \
brotli=1.0.9-2build6 \
coreutils=8.32-4.1ubuntu1 \
dbus=1.12.20-2ubuntu4.1 \
dnsutils=1:9.18.12-0ubuntu0.22.04.1 \
dpkg=1.21.1ubuntu2.2 \
dpkg-dev=1.21.1ubuntu2.2 \
fakeroot=1.28-1ubuntu1 \
file=1:5.41-3 \
flex=2.6.4-8build2 \
fonts-noto-color-emoji=2.038-0ubuntu1 \
ftp=20210827-4build1 \
gnupg2=2.2.27-3ubuntu2.1 \
haveged=1.9.14-1ubuntu1 \
imagemagick=8:6.9.11.60+dfsg-1.3ubuntu0.22.04.3 \
iproute2=5.15.0-1ubuntu2 \
iputils-ping=3:20211215-1 \
lib32z1=1:1.2.11.dfsg-2ubuntu9.2 \
libc++-dev=1:14.0-55~exp2 \
libc++abi-dev=1:14.0-55~exp2 \
libc6-dev=2.35-0ubuntu3.1 \
libcurl4=7.81.0-1ubuntu1.10 \
libgbm-dev=22.2.5-0ubuntu0.1~22.04.1 \
libgconf-2-4=3.2.6-7ubuntu2 \
libgsl-dev=2.7.1+dfsg-3 \
libgtk-3-0=3.24.33-1ubuntu2 \
libmagic-dev=1:5.41-3 \
libmagickcore-dev=8:6.9.11.60+dfsg-1.3ubuntu0.22.04.3 \
libmagickwand-dev=8:6.9.11.60+dfsg-1.3ubuntu0.22.04.3 \
libsecret-1-dev=0.20.5-2 \
libsqlite3-dev=3.37.2-2ubuntu0.1 \
libssl-dev=3.0.2-0ubuntu1.10 \
libtool=2.4.6-15build2 \
libunwind8=1.3.2-2build2 \
libxkbfile-dev=1:1.1.0-1build3 \
libxss1=1:1.2.3-1build2 \
libyaml-dev=0.2.2-1build2 \
locales=2.35-0ubuntu3.1 \
lz4=1.9.3-2build2 \
m4=1.4.18-5ubuntu2 \
mediainfo=22.03-1 \
mercurial=6.1.1-1ubuntu1 \
net-tools=1.60+git20181103.0eebece-1ubuntu5 \
netcat=1.218-4ubuntu1 \
openssh-client=1:8.9p1-3ubuntu0.1 \
p7zip-full=16.02+dfsg-8 \
p7zip-rar=16.02-3build1 \
parallel=20210822+ds-2 \
pass=1.7.4-5 \
patchelf=0.14.3-1 \
pkg-config=0.29.2-1ubuntu3 \
pollinate=4.33-3ubuntu2 \
python-is-python3=3.9.2-2 \
rpm=4.17.0+dfsg1-4build1 \
rsync=3.2.7-0ubuntu0.22.04.2 \
shellcheck=0.8.0-2 \
sphinxsearch=2.2.11-8 \
sqlite3=3.37.2-2ubuntu0.1 \
ssh=1:8.9p1-3ubuntu0.1 \
sshpass=1.09-1 \
subversion=1.14.1-3ubuntu0.22.04.1 \
sudo=1.9.9-1ubuntu2.4 \
swig=4.0.2-1ubuntu1 \
telnet=0.17-44build1 \
texinfo=6.8-4build1 \
time=1.9-0.1build2 \
tk=8.6.11+1build2 \
tzdata=2023c-0ubuntu0.22.04.2 \
upx-ucl=3.96-3 \
xorriso=1.5.4-2 \
xvfb=2:21.1.4-2ubuntu1.7~22.04.1 \
xz-utils=5.2.5-2ubuntu1 \
zip=3.0-12build2 \
zsync=0.6.2-3ubuntu1

# Add nvm and npm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install 18.16.0

# Add postgresQL client
sudo apt install postgresql-client-common postgresql-client-14

# Deno imports are cached in $DENO_DIR=/home/runner/ in our workflow, giving wx access
sudo setfacl -Rdm u:gitstart:rwx /home/

sudo reboot