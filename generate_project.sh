#/bin/sh

PROJECT_LOCATION=${1}
PROJECT_NAME=${2}

PROJECT_NAME_PLACEHOLDER=__PROJECT_NAME__

function check_path {
    if [ -z $PROJECT_LOCATION ] ; then
    echo "Please specify project location"
    exit
    fi

    if [ ! -d "$PROJECT_LOCATION" ]; then
        echo "$PROJECT_LOCATION - is not a directory"
        exit
    fi

    if [ -z $PROJECT_NAME ]; then
        echo "Please specify project name"
        exit
    fi

    PROJECT_DIR=$PROJECT_LOCATION/$PROJECT_NAME

    

    if [ -d "$PROJECT_DIR" ]; then
        echo "$PROJECT_DIR already exists"
        exit
    fi
}

check_path

echo "Create new project "$PROJECT_NAME" in "$PROJECT_LOCATION

echo "Project directory: "$PROJECT_DIR


mkdir $PROJECT_DIR

cp data/.gitignore_stub $PROJECT_DIR/.gitignore

mkdir $PROJECT_DIR/build

cp -r ./data/ext $PROJECT_DIR

cp -r ./data/src $PROJECT_DIR

cp -r ./data/test $PROJECT_DIR

cp ./data/CMakeLists.txt $PROJECT_DIR

sed -i 's/'"$PROJECT_NAME_PLACEHOLDER"'/'"$PROJECT_NAME"'/g' $PROJECT_DIR/CMakeLists.txt