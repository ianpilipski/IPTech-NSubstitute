#!/bin/bash

mkdir .tmp_nsub
nuget install NSubstitute -Version 2.0.3 -Framework netstandard2.0 -OutputDirectory $(pwd)/.tmp_nsub