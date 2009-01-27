from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext


pylame_version = '0.0.1'
pylame_version_str = '"%s"' % (pylame_version,)
pylame_ext = Extension("_lame", ["_lame.pyx"],
                       libraries=['mp3lame'],
                       define_macros=[('PYLAME_VERSION', pylame_version_str)])

setup(
    name='lame',
    version=pylame_version,
    description='Bindings for the LAME audio encoding library',
    author='Kyle VanderBeek',
    author_email='kylev@kylev.com',
    cmdclass={'build_ext': build_ext},
    py_modules=['lame'],
    ext_modules=[pylame_ext],
)
