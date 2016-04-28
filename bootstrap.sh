BASE_DIR=`pwd`
EXPORTED_PROFILE=$BASE_DIR/src/profile.sh

# Import exported file context to this setup script
. "$EXPORTED_PROFILE"

scaffold_directories() {
    if [ ! -d "$TOOLS" ]; then
        mkdir $TOOLS
    fi
    dirs=("java" "maven" "eclipse")
    for dir in ${dirs[@]}; do
        mkdir $TOOLS/$dir
        ln -s -f /dev/null $TOOLS/$dir/current
    done
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

link_environment_variables() {
    local existing_line=`cat $HOME/.bashrc | grep $EXPORTED_PROFILE`
    if [ -z "$existing_line" ]; then
        echo ". \"$EXPORTED_PROFILE\"" >> $HOME/.bashrc
    else
        echo "Reference already exists on .bashrc"
    fi
}

link_environment_variables
scaffold_directories
set_java_plugin
