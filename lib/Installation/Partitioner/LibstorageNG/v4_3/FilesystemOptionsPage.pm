# SUSE's openQA tests
#
# Copyright 2021 SUSE LLC
# SPDX-License-Identifier: FSFAP

# Summary: This class introduces methods to handle Filesystem Options page
#          in Guided Partitioning.
#
# Maintainer: QE YaST <qa-sle-yast@suse.de>

package Installation::Partitioner::LibstorageNG::v4_3::FilesystemOptionsPage;
use parent 'Installation::Navigation::NavigationBase';
use strict;
use warnings;

sub new {
    my ($class, $args) = @_;
    my $self = bless {
        app => $args->{app}
    }, $class;
    return $self->init($args);
}

sub init {
    my $self = shift;
    $self->SUPER::init();
    $self->{lbl_settings_root_part} = $self->{app}->label({label => 'Settings for the Root Partition'});
    $self->{cb_root_fs_type}        = $self->{app}->combobox({id => '"vol_0_fs_type"'});
    return $self;
}

sub select_root_filesystem {
    my ($self, $fs) = @_;
    my %filesystems = (
        ext2  => 'Ext2',
        ext3  => 'Ext3',
        ext4  => 'Ext4',
        btrfs => 'Btrfs',
        xfs   => 'XFS');
    my $root_fs = $filesystems{$fs};
    return $self->{cb_root_fs_type}->select($root_fs) if $root_fs;
    die "Wrong test data provided when selecting root file system: $fs \n" .
      'Avalaible options: ' . join(' ', sort keys %filesystems);
}

sub is_shown {
    my ($self) = @_;
    return $self->{lbl_settings_root_part}->exist();
}

1;
