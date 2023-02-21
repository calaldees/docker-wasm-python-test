Docker + WASM + Python
======================

Inspired by: https://wasmlabs.dev/articles/python-wasm32-wasi/

What a mess.
We have to download the python dependencies in linux as there is no `pip3` in wasm.
If the dependencies have any c bindings, this will fail.

I need to investigate further

More
----

* https://enarx.dev/docs/webassembly/python
* https://www.wasm.builders/aliyarahmani/run-python-program-using-wasmtime-4490
