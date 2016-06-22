# GLOBALS SETUP
#
# Keep third-party development tools in this directory
export TOOLS=$HOME/Tools

export JAVA_HOME=$TOOLS/java/current
export PATH=$JAVA_HOME/bin/:$PATH

export M2_HOME=$TOOLS/maven/current
export PATH=$M2_HOME/bin/:$PATH

export ANT_HOME=$TOOLS/ant/current
export PATH=$ANT_HOME/bin/:$PATH

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH
