#========================================================================
# Build Script for *ALL* packages
#======================================================================== 
#
# Author      : Jens-Christian Lache
#		Michael DeGuzis
# Date        : 20150114
# Version     : 0.0.0.0.0.0.1
# ========================================================================

# Define release
TARGET_Release=utopic

# define emulators / packages
ppsspp=no
dolphin_emu=no
antimicro=yes

echo "building all packages"

cd ~/RetroRig/supplemental

if [[ -n "$1" ]]; then

  echo ""
  echo "build target is $1"
  echo ""
  target=$1

else
  echo ""
  echo "build target is source"
  echo ""
  target=source
fi

# =====================================================
# ppsspp
# =====================================================

if [ "$ppsspp" == "yes" ]; then
  
  #restore default
  git checkout "./ppsspp/changelog"
  
  #replace target operating system
  sed -i "s|trusty|$TARGET_Release|g" "./ppsspp/changelog"
  
  #run build script
  ./build-ppsspp-ppa.sh      $target $2
  returnValue=$?
  
  #restore default
  git checkout "./ppsspp/changelog"
	
  if [ $returnValue -eq 0 ]; then  
      echo "successfully build"
      ppsspp_build=success
  else  
      echo "build failed, aborting"
      ppsspp_build=failed
  fi

fi


# =====================================================
# dolphin-emu
# =====================================================

if [ "$dolphin_emu" == "yes" ]; then
  
  #restore default
  git checkout "./dolphin-emu/changelog"
  
  #replace target operating system
  sed -i "s|trusty|$TARGET_Release|g" "./dolphin-emu/changelog"
  
  #run build script
  ./build-dolphin-emu-ppa.sh      $target $2
  returnValue=$?
  
  #restore default
  git checkout "./dolphin-emu/changelog"
	
  if [ $returnValue -eq 0 ]; then  
      echo "successfully build"
      dolphin_emu_build=success
  else  
      echo "build failed, aborting"
      dolphin_emu_build=failed
  fi

fi
 
# =====================================================
# antimicro
# =====================================================

if [ "$antimicro" == "yes" ]; then
  
  #restore default
  git checkout "./antimicro/changelog"
  
  #replace target operating system
  sed -i "s|trusty|$TARGET_Release|g" "./antimicro/changelog"
  
  #run build script
  ./build-antimicro-ppa.sh      $target $2
  returnValue=$?
  
  #restore default
  git checkout "./antimicro/changelog"
	
  if [ $returnValue -eq 0 ]; then  
      echo "successfully build"
      antimicro_build=success
  else  
      echo "build failed, aborting"
      antimicro_build=failed
  fi

fi

find /home/yo/packaging/ -name "*.deb"
find /home/yo/packaging/ -name "*changes"

