# SUSE’s openQA tests
#
# Copyright 2018-2019 IBM Corp.
# SPDX-License-Identifier: FSFAP
#
# Summary:  Based on consoletest_setup.pm (console test pre setup, stopping and disabling packagekit, install curl and tar to get logs and so on)
# modified for running the testcase TOOL_s390_vmcp on s390x.
# Maintainer: Elif Aslan <elas@linux.vnet.ibm.com>

use base "s390base";
use testapi;
use utils;
use warnings;
use strict;

sub run {
    my $self = shift;
    $self->copy_testsuite('TOOL_s390_vmcp');
    $self->execute_script('vmcp_main.sh');
    $self->cleanup_testsuite('TOOL_s390_vmcp');
}

sub test_flags {
    return {milestone => 1, fatal => 0};
}

1;
# vim: set sw=4 et:
