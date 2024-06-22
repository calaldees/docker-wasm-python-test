Docker + WASM + Python
======================

Inspired by: https://wasmlabs.dev/articles/python-wasm32-wasi/

What a mess.
We have to download the python dependencies in linux as there is no `pip3` in wasm.
If the dependencies have any c bindings, this will fail.

I need to investigate further

More
----

* [pyodide.org](https://pyodide.org/)
    * (astounding, just one cdn js file and python is interopable in the browser)
    * [micropip](https://micropip.pyodide.org/en/stable/project/api.html)
        * python wheelhouse for wasm python with `pyodide`
            * popular c bindings `regex` and `numpy` are supported. There is a fallback to attempting install from pip
    * [emscripten.org](https://emscripten.org/)
        * > Emscripten is a complete compiler toolchain to WebAssembly, using LLVM, with a special focus on speed, size, and the Web platform.
        * convert c and c++ and opengl to wasm binary and webgl
* https://enarx.dev/docs/webassembly/python
* https://www.wasm.builders/aliyarahmani/run-python-program-using-wasmtime-4490
