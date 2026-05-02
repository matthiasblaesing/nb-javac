set -x
set -e

# Test check error texts ensure locale is correct
export LANG=C

if ! [ -f $JAVA_HOME17/bin/javac ]; then
  echo Specify JAVA_HOME17 environment variable!
  exit 1
fi

if ! [ -f $JAVA_HOME17/jmods/java.base.jmod ]; then
  echo Specify JAVA_HOME17 environment variable!
  exit 1
fi

if ! [ -f $JAVA_HOME25/bin/javac ]; then
  echo Specify JAVA_HOME25 environment variable!
  exit 2
fi

if ! [ -f $JAVA_HOME25/jmods/java.base.jmod ]; then
  echo Specify JAVA_HOME25 environment variable!
  exit 2
fi

export JAVA_HOME=$JAVA_HOME25
ant -d $ANT_ARGS_EXTRA -f make/langtools/netbeans/nb-javac clean jar test


export JAVA_HOME=$JAVA_HOME17
ant $ANT_ARGS_EXTRA -f make/langtools/netbeans/nb-javac test
