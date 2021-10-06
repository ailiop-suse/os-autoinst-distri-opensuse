# SUSE’s openQA tests
#
# Copyright 2018-2019 IBM Corp.
# SPDX-License-Identifier: FSFAP
#
# Summary:  Based on consoletest_setup.pm (console test pre setup, stopping and disabling packagekit, install curl and tar to get logs and so on)
# modified for running the testcase MEMORY_chmem on s390x.
# Maintainer: Elif Aslan <elas@linux.vnet.ibm.com>

use base "s390base";
use testapi;
use utils;
use warnings;
use strict;

sub run {
    my $self = shift;
    $self->copy_testsuite('MEMORY_chmem');
    $self->execute_script('chmem.test.sh',         '1', 1200);
    $self->execute_script('checksum.chmemtest.sh', '1', 300);
}

sub test_flags {
    return {milestone => 1, fatal => 0};
}

1;
# vim: set sw=4 et:
