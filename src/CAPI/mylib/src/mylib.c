//
//  mylib.c
//  LuaCModule
//
//  Created by moye on 15/2/8.
//  Copyright (c) 2015年 RedChina. All rights reserved.
//

#include <stdio.h>
#include <string.h>
#include <assert.h>

#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"

// function for exports
static int l_printf(lua_State *L){
    const char *arg = luaL_checkstring(L, 1);
    printf("%s\n", arg);
    return 0;
}

static const struct luaL_Reg mylib[] = {
    {"printf", l_printf},
    {NULL, NULL}
};

int luaopen_mylib(lua_State *L){
    luaL_newlibtable(L, mylib);
    luaL_setfuncs(L, mylib, 0);
    return 1;
}


