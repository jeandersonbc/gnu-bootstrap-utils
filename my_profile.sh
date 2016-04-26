set_maven_environment() {
    export M2_HOME=$TOOLS/maven/current
    export PATH=$M2_HOME/bin/:$PATH
}

set_java_plugin() {
    local lib_name=libnpjp2.so
    local target=$HOME/.mozilla/plugins

    if [ ! -d "$target" ]; then
        mkdir -p $target
    fi
    if [ ! -f "$target/$lib_name" ]; then
        ln -s $JAVA_HOME/jre/lib/amd64/$lib_name $target/$lib_name
    fi
}

set_java_environment() {
    export JAVA_HOME=$TOOLS/java/current
    set_java_plugin
    export PATH=$JAVA_HOME/bin/:$PATH
}

# Keep third-party development tools in this directory
TOOLS=$HOME/Tools
if [ ! -d "$TOOLS" ]; then
    mkdir $TOOLS && export $TOOLS
fi

set_java_environment
set_maven_environment
