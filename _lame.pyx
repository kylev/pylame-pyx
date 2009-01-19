# TODO Get -D constant working
#cdef extern char* PYLAME_VERSION

cdef extern from "lame/lame.h":
    char *get_lame_version()
    char *get_lame_short_version()
    char *get_lame_very_short_version()
    char *get_psy_version()
    char *get_lame_url()


__version__ = "0.0.1"
VERSION = get_lame_version()
VERSION_SHORT = get_lame_short_version()
VERSION_TINY = get_lame_very_short_version()
VERSION_PSY = get_psy_version()
URL = get_lame_url()


class Encoder:
    """A LAME encoder object."""
    def foo():
        """asdf"""
        pass

