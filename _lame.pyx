cdef extern from "lame/lame.h":
    char *get_lame_url()

def url():
    return get_lame_url()


class Encoder:
      pass
