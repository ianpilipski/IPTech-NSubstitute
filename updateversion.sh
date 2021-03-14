#!/bin/bash

VERSION="2.0.3"

set -e

[ -e ./.tmp_nsub ] && rm -rf ./.tmp_nsub
nuget install NSubstitute -Version $VERSION -Framework netstandard2.0 -OutputDirectory ./.tmp_nsub

[ -e Assets/IPTech.NSubstitute/NSubstitute ] && rm -rf Assets/IPTech.NSubstitute/NSubstitute
[ -e Assets/IPTech.NSubstitute/CastleCore ] && rm -rf Assets/IPTech.NSubstitute/CastleCore

cp -r ./.tmp_nsub/NSubstitute.$VERSION Assets/IPTech.NSubstitute/NSubstitute
cp -r ./.tmp_nsub/Castle.Core.4.0.0 Assets/IPTech.NSubstitute/CastleCore

rm -rf Assets/IPTech.NSubstitute/NSubstitute/lib/net35
rm -rf Assets/IPTech.NSubstitute/NSubstitute/lib/net40
rm -rf Assets/IPTech.NSubstitute/NSubstitute/lib/net45
rm -rf Assets/IPTech.NSubstitute/NSubstitute/*.nupkg
rm -rf Assets/IPTech.NSubstitute/NSubstitute/.signature.p7s

rm -rf Assets/IPTech.NSubstitute/CastleCore/lib/net35
rm -rf Assets/IPTech.NSubstitute/CastleCore/lib/net40-client
rm -rf Assets/IPTech.NSubstitute/CastleCore/lib/net45
rm -rf Assets/IPTech.NSubstitute/CastleCore/*.nupkg
rm -rf Assets/IPTech.NSubstitute/CastleCore/.signature.p7s

