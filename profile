set_maven_environment() {
    export M2_HOME=$TOOLS/maven/current
    export PATH=$M2_HOME/bin/:$PATH
}

# Keep third-party development tools in this directory
TOOLS=$HOME/Tools
if [ ! -d "$TOOLS" ]; then
    mkdir $TOOLS && export $TOOLS
fi

set_maven_environment
