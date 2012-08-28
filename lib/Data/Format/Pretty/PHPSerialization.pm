package Data::Format::Pretty::PHPSerialization;

use 5.010;
use strict;
use warnings;

use PHP::Serialization qw(serialize);

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw(format_pretty);

# VERSION

sub content_type { "application/vnd.php.serialized" }

sub format_pretty {
    my ($data, $opts) = @_;
    $opts //= {};
    serialize($data);
}

1;
# ABSTRACT: Pretty-print data structure as PHP serialization format
__END__

=head1 SYNOPSIS

 use Data::Format::Pretty::PHPSerialization qw(format_pretty);
 print format_pretty($data);

Some example output:

=over 4

=item * format_pretty({a=>1, b=>2})

 a:2:{s:1:"a";i:1;s:1:"b";i:2;}

=back


=head1 DESCRIPTION

This module uses L<PHP::Serialization> to encode data as PHP serialization
format, which I frankly wouldn't call as a "pretty" format, but added for
completeness sake (used by e.g. L<Perinci::Access::HTTP::Server>).


=head1 FUNCTIONS

=head2 format_pretty($data, \%opts)

Return formatted data structure as PHP serialization format. Currently there are
no known options.


=head1 SEE ALSO

L<Data::Format::Pretty>

=cut

