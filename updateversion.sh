#!/bin/bash

VERSION="2.0.3"

set -e

[ -e ./.tmp_nsub ] && rm -rf ./.tmp_nsub
nuget install NSubstitute -Version $VERSION -Framework netstandard2.0 -OutputDirectory ./.tmp_nsub

[ -e Packages/IPTech.NSubstitute/Editor/NSubstitute ] && rm -rf Packages/IPTech.NSubstitute/Editor/NSubstitute
[ -e Packages/IPTech.NSubstitute/Editor/CastleCore ] && rm -rf Packages/IPTech.NSubstitute/Editor/CastleCore

cp -r ./.tmp_nsub/NSubstitute.$VERSION Packages/IPTech.NSubstitute/Editor/NSubstitute
cp -r ./.tmp_nsub/Castle.Core.4.0.0 Packages/IPTech.NSubstitute/Editor/CastleCore

rm -rf Packages/IPTech.NSubstitute/Editor/NSubstitute/lib/net35
rm -rf Packages/IPTech.NSubstitute/Editor/NSubstitute/lib/net40
rm -rf Packages/IPTech.NSubstitute/Editor/NSubstitute/lib/net45
rm -rf Packages/IPTech.NSubstitute/Editor/NSubstitute/*.nupkg
rm -rf Packages/IPTech.NSubstitute/Editor/NSubstitute/.signature.p7s

rm -rf Packages/IPTech.NSubstitute/Editor/CastleCore/lib/net35
rm -rf Packages/IPTech.NSubstitute/Editor/CastleCore/lib/net40-client
rm -rf Packages/IPTech.NSubstitute/Editor/CastleCore/lib/net45
rm -rf Packages/IPTech.NSubstitute/Editor/CastleCore/*.nupkg
rm -rf Packages/IPTech.NSubstitute/Editor/CastleCore/.signature.p7s

