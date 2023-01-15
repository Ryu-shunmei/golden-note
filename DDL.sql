  File "/Users/ryu_shunmei/Desktop/backend/app/./main.py", line 5, in <module>
    from api.endpoints.supplementaries import router as supplementaries_router
  File "/Users/ryu_shunmei/Desktop/backend/app/./api/endpoints/supplementaries.py", line 11, in <module>
    from engine.calc_health_asset import HealthAsset
  File "/Users/ryu_shunmei/Desktop/backend/app/./engine/calc_health_asset.py", line 36, in <module>
    nest_asyncio.apply()
  File "/Users/ryu_shunmei/Desktop/backend/pyenv/lib/python3.9/site-packages/nest_asyncio.py", line 19, in apply
    _patch_loop(loop)
  File "/Users/ryu_shunmei/Desktop/backend/pyenv/lib/python3.9/site-packages/nest_asyncio.py", line 175, in _patch_loop
    raise ValueError('Can\'t patch loop of type %s' % type(loop))
ValueError: Can't patch loop of type <class 'uvloop.Loop'>
