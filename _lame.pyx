# TODO Get -D constant working
#cdef extern char* PYLAME_VERSION

cdef extern from "lame/lame.h":
    int vbr_off
    int vbr_rh
    int vbr_abr
    int vbr_mtrh
    int vbr_default

    # MPEG modes
    int STEREO
    int JOINT_STEREO
    int MONO
    int NOT_SET

    # Padding types
    int PAD_NO
    int PAD_ALL
    int PAD_ADJUST

    int ABR_8
    int ABR_320
    int V9
    int V8
    int V7
    int V6
    int V5
    int V4
    int V3
    int V2
    int V1
    int V0

    char *get_lame_version()
    char *get_lame_short_version()
    char *get_lame_very_short_version()
    char *get_psy_version()
    char *get_lame_url()

    ctypedef struct lame_version_t:
        int major
        int minor
        int alpha
        int beta
        int psy_major
        int psy_minor
        int psy_alpha
        int psy_beta
        char *features

    void get_lame_version_numerical(lame_version_t*)

    ctypedef struct lame_global_flags

    lame_global_flags *lame_init()
    int lame_set_num_channels(lame_global_flags *, int)
    int lame_get_num_channels(lame_global_flags *)
    int lame_get_frameNum(lame_global_flags *)

# Core compiled definitions
__version__ = "0.0.1"
VERSION = get_lame_version()
VERSION_SHORT = get_lame_short_version()
VERSION_TINY = get_lame_very_short_version()
VERSION_PSY = get_psy_version()
URL = get_lame_url()

MPEG_MODE_STEREO = STEREO
MPEG_MODE_JOINT_STEREO = JOINT_STEREO
MPEG_MODE_MONO = MONO
MPEG_NOT_SET = NOT_SET

PADDING_NO = PAD_NO
PADDING_ALL = PAD_ALL
PADDING_ADJUST = PAD_ADJUST

# VBR settings
VBR_MODE_OFF = vbr_off
VBR_MODE_RH = vbr_rh
VBR_MODE_ABR = vbr_abr
VBR_MODE_MTRH = vbr_mtrh
VBR_MODE_DEFAULT = vbr_default

PRESET_ABR_8 = ABR_8
PRESET_ABR_320 = ABR_320
PRESET_VBR_9 = V9
PRESET_VBR_8 = V8
PRESET_VBR_7 = V7
PRESET_VBR_6 = V6
PRESET_VBR_5 = V5
PRESET_VBR_4 = V4
PRESET_VBR_3 = V3
PRESET_VBR_2 = V2
PRESET_VBR_1 = V1
PRESET_VBR_0 = V0


def version():
    """Returns the version of LAME in a tuple: (major, minor, alpha, beta,
    psy_major, sy_minor, psy_alpha, psy_beta, compile_time_features).
    """
    cdef lame_version_t version

    get_lame_version_numerical(&version)

    return (version.major,
            version.minor,
            version.alpha,
            version.beta,
            version.psy_major,
            version.psy_minor,
            version.psy_alpha,
            version.psy_beta,
            version.features)


cdef class Encoder:
    """A LAME encoder object."""
    cdef lame_global_flags *flags

    def __cinit__(self):
        self.flags = lame_init()
        if self.flags == NULL:
            raise MemoryError("lame_init failed")

    property num_channels:
        """Number of channels."""
        def __get__(self):
            return lame_get_num_channels(self.flags)
        def __set__(self, int value):
            lame_set_num_channels(self.flags, value)

    property frame_num:
        """Number of frames encoded so far (read-only)."""
        def __get__(self):
            return lame_get_frameNum(self.flags)

