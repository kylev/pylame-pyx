from _lame import *

__all__ = ['__version__', 'VERSION', 'VERSION_SHORT',
           'VERSION_TINY', 'VERSION_PSY', 'URL',
           'MPEG_MODE_STEREO', 'MPEG_MODE_JOINT_STEREO', 'MPEG_MODE_MONO',
           'MPEG_NOT_SET',
           'PADDING_NO', 'PADDING_ALL', 'PADDING_ADJUST',
           'VBR_MODE_OFF',' VBR_MODE_RH', 'VBR_MODE_ABR', 'VBR_MODE_MTRH',
           'VBR_MODE_DEFAULT',
           'PRESET_ABR_8', 'PRESET_ABR_320', 'PRESET_VBR_9', 'PRESET_VBR_8',
           'PRESET_VBR_7', 'PRESET_VBR_6', 'PRESET_VBR_5', 'PRESET_VBR_4',
           'PRESET_VBR_3', 'PRESET_VBR_2', 'PRESET_VBR_1', 'PRESET_VBR_0',
           'Encoder', 'version',
           'encode_file']
           

def encode_file(in_file, out_file, encoder=None):
    """Encode a file."""
    raise NotImplementedError("I'm workin' on it!")
