Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3573976BA
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 16:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792255676; cv=none; b=RemP9I77NwyGBY7297vC0y6rSOY9hh2YSVQSHfKbbhLgRrcXNTeNNR/7+TTPZBphz5Y6ya0EBFwv2dxHXGQkO6cfPSRVY0qHIgejuQl7pk/9aIypfiCN6tz2FEIbZQgDl0/3pimNy4Q1bisjDol6zKGl4UgOUiS5c7rn8xy8IRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792255676; c=relaxed/simple;
	bh=Vbvc+iDNyaDse+GH4VHtcwOiJGyLoNGmImqIC9zhnd0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UO0GfjVLzrOkoNa1IAWmZ8o11JPWh0+379NMmumRfhPdGIElj5ldVn432hbbOvFtVHJJW/suF7kURargy5hJgQFloCG9GDJ0BDRejDnE5RQ0NlPsKUqxrXjRnt2PUUTIel+y3Exp4Q0sbTZ+zCINF+1tl4vNeMOPwzh6un0hA9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kIo8ScoH; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kIo8ScoH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792255672; x=1823791672;
  h=date:from:to:cc:subject:message-id;
  bh=Vbvc+iDNyaDse+GH4VHtcwOiJGyLoNGmImqIC9zhnd0=;
  b=kIo8ScoHb8cvkyf62yDyN1GV1TwgztRHG6Ia0RPeQSF2Z2AqjIY6n6GQ
   PllJN0bqiF/kR474/n1udsqOT9eS9npnGTcHQ8vepwwtFqNcpDuLcCara
   4CUvLS++VIUUC7qWhhRPPHUFtlMWSRS0QpccUOcwb/5brcUa1bfmCTOkz
   1TAR3PDAFh+fCqJidgadNGj5dciDXblY0q3WJtH5u7MfgFBQsauMlqg+f
   KbaTaKRb8Z4gaYAvaiMVDFHCYmM59IE4eIDqAXSqgMCc3fToA+9oCNGl6
   DvZBmG7X0IpYqgTM9vIvGpyWb8ZyXmGb0NqYXyTOMtMhGz9i/5beUAFdF
   w==;
X-CSE-ConnectionGUID: /Prx0WeORqa6SGEeGXXGsA==
X-CSE-MsgGUID: eLMydheHReK8iLous/R6vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="876829"
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="876829"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2026 09:47:52 -0700
X-CSE-ConnectionGUID: Ek/zAo5DSyO0q8TIAsIjAQ==
X-CSE-MsgGUID: 8nWDzq15Sf22k7tNP7+8NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="2067513"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Oct 2026 09:47:50 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xI7ZU-00000000JX8-1bEY;
	Sat, 17 Oct 2026 16:47:48 +0000
Date: Sun, 18 Oct 2026 00:47:06 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:media-ref 1/17]
 include/linux/moduleparam.h:163:32: error: expected ')' before ',' token
Message-ID: <202610180038.NjDarZVo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree:   git://linuxtv.org/sailus/media_tree.git media-ref
head:   cf47170584526b52366e936406ce2430b99a03a9
commit: d50da12ab1df5599da158568d31337d2daeee81d [1/17] media: Add "kaboom" module parameter
config: sh-randconfig-1000-20261017 (https://download.01.org/0day-ci/archive/20261018/202610180038.NjDarZVo-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261018/202610180038.NjDarZVo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610180038.NjDarZVo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/module.h:23,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/pci.h:38,
                    from drivers/media/mc/mc-device.c:19:
   drivers/media/mc/mc-device.c:31:31: error: expected ';' before 'int'
      31 | module_param(kaboom, unsigned int, 0077);
         |                               ^~~
   include/linux/moduleparam.h:163:23: note: in definition of macro 'module_param_named'
     163 |         param_check_##type(name, &(value));                                \
         |                       ^~~~
   drivers/media/mc/mc-device.c:31:1: note: in expansion of macro 'module_param'
      31 | module_param(kaboom, unsigned int, 0077);
         | ^~~~~~~~~~~~
>> include/linux/moduleparam.h:163:32: error: expected ')' before ',' token
     163 |         param_check_##type(name, &(value));                                \
         |                                ^
   include/linux/moduleparam.h:140:9: note: in expansion of macro 'module_param_named'
     140 |         module_param_named(name, name, type, perm)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/media/mc/mc-device.c:31:1: note: in expansion of macro 'module_param'
      31 | module_param(kaboom, unsigned int, 0077);
         | ^~~~~~~~~~~~
>> include/linux/moduleparam.h:164:32: error: 'param_ops_unsigned' undeclared here (not in a function); did you mean 'param_ops_uint'?
     164 |         module_param_cb(name, &param_ops_##type, &value, perm);            \
         |                                ^~~~~~~~~~
   include/linux/moduleparam.h:305:46: note: in definition of macro '__module_param_call'
     305 |         = { __param_str_##name, THIS_MODULE, ops,                       \
         |                                              ^~~
   include/linux/moduleparam.h:164:9: note: in expansion of macro 'module_param_cb'
     164 |         module_param_cb(name, &param_ops_##type, &value, perm);            \
         |         ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:140:9: note: in expansion of macro 'module_param_named'
     140 |         module_param_named(name, name, type, perm)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/media/mc/mc-device.c:31:1: note: in expansion of macro 'module_param'
      31 | module_param(kaboom, unsigned int, 0077);
         | ^~~~~~~~~~~~
   drivers/media/mc/mc-device.c:31:31: error: expected '}' before 'int'
      31 | module_param(kaboom, unsigned int, 0077);
         |                               ^~~
   include/linux/moduleparam.h:305:46: note: in definition of macro '__module_param_call'
     305 |         = { __param_str_##name, THIS_MODULE, ops,                       \
         |                                              ^~~
   include/linux/moduleparam.h:164:9: note: in expansion of macro 'module_param_cb'
     164 |         module_param_cb(name, &param_ops_##type, &value, perm);            \
         |         ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:140:9: note: in expansion of macro 'module_param_named'
     140 |         module_param_named(name, name, type, perm)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/media/mc/mc-device.c:31:1: note: in expansion of macro 'module_param'
      31 | module_param(kaboom, unsigned int, 0077);
         | ^~~~~~~~~~~~
   include/linux/moduleparam.h:305:11: note: to match this '{'
     305 |         = { __param_str_##name, THIS_MODULE, ops,                       \
         |           ^
   include/linux/moduleparam.h:189:9: note: in expansion of macro '__module_param_call'
     189 |         __module_param_call(MODULE_PARAM_PREFIX, name, ops, arg, perm, -1, 0)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:164:9: note: in expansion of macro 'module_param_cb'
     164 |         module_param_cb(name, &param_ops_##type, &value, perm);            \
         |         ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:140:9: note: in expansion of macro 'module_param_named'
     140 |         module_param_named(name, name, type, perm)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/media/mc/mc-device.c:31:1: note: in expansion of macro 'module_param'
      31 | module_param(kaboom, unsigned int, 0077);
         | ^~~~~~~~~~~~
--
   In file included from include/linux/module.h:23,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/pci.h:38,
                    from mc-device.c:19:
   mc-device.c:31:31: error: expected ';' before 'int'
      31 | module_param(kaboom, unsigned int, 0077);
         |                               ^~~
   include/linux/moduleparam.h:163:23: note: in definition of macro 'module_param_named'
     163 |         param_check_##type(name, &(value));                                \
         |                       ^~~~
   mc-device.c:31:1: note: in expansion of macro 'module_param'
      31 | module_param(kaboom, unsigned int, 0077);
         | ^~~~~~~~~~~~
>> include/linux/moduleparam.h:163:32: error: expected ')' before ',' token
     163 |         param_check_##type(name, &(value));                                \
         |                                ^
   include/linux/moduleparam.h:140:9: note: in expansion of macro 'module_param_named'
     140 |         module_param_named(name, name, type, perm)
         |         ^~~~~~~~~~~~~~~~~~
   mc-device.c:31:1: note: in expansion of macro 'module_param'
      31 | module_param(kaboom, unsigned int, 0077);
         | ^~~~~~~~~~~~
>> include/linux/moduleparam.h:164:32: error: 'param_ops_unsigned' undeclared here (not in a function); did you mean 'param_ops_uint'?
     164 |         module_param_cb(name, &param_ops_##type, &value, perm);            \
         |                                ^~~~~~~~~~
   include/linux/moduleparam.h:305:46: note: in definition of macro '__module_param_call'
     305 |         = { __param_str_##name, THIS_MODULE, ops,                       \
         |                                              ^~~
   include/linux/moduleparam.h:164:9: note: in expansion of macro 'module_param_cb'
     164 |         module_param_cb(name, &param_ops_##type, &value, perm);            \
         |         ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:140:9: note: in expansion of macro 'module_param_named'
     140 |         module_param_named(name, name, type, perm)
         |         ^~~~~~~~~~~~~~~~~~
   mc-device.c:31:1: note: in expansion of macro 'module_param'
      31 | module_param(kaboom, unsigned int, 0077);
         | ^~~~~~~~~~~~
   mc-device.c:31:31: error: expected '}' before 'int'
      31 | module_param(kaboom, unsigned int, 0077);
         |                               ^~~
   include/linux/moduleparam.h:305:46: note: in definition of macro '__module_param_call'
     305 |         = { __param_str_##name, THIS_MODULE, ops,                       \
         |                                              ^~~
   include/linux/moduleparam.h:164:9: note: in expansion of macro 'module_param_cb'
     164 |         module_param_cb(name, &param_ops_##type, &value, perm);            \
         |         ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:140:9: note: in expansion of macro 'module_param_named'
     140 |         module_param_named(name, name, type, perm)
         |         ^~~~~~~~~~~~~~~~~~
   mc-device.c:31:1: note: in expansion of macro 'module_param'
      31 | module_param(kaboom, unsigned int, 0077);
         | ^~~~~~~~~~~~
   include/linux/moduleparam.h:305:11: note: to match this '{'
     305 |         = { __param_str_##name, THIS_MODULE, ops,                       \
         |           ^
   include/linux/moduleparam.h:189:9: note: in expansion of macro '__module_param_call'
     189 |         __module_param_call(MODULE_PARAM_PREFIX, name, ops, arg, perm, -1, 0)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:164:9: note: in expansion of macro 'module_param_cb'
     164 |         module_param_cb(name, &param_ops_##type, &value, perm);            \
         |         ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:140:9: note: in expansion of macro 'module_param_named'
     140 |         module_param_named(name, name, type, perm)
         |         ^~~~~~~~~~~~~~~~~~
   mc-device.c:31:1: note: in expansion of macro 'module_param'
      31 | module_param(kaboom, unsigned int, 0077);
         | ^~~~~~~~~~~~


vim +163 include/linux/moduleparam.h

^1da177e4c3f41 Linus Torvalds  2005-04-16  113  
546970bc6afc7f Rusty Russell   2010-08-11  114  /**
546970bc6afc7f Rusty Russell   2010-08-11  115   * module_param - typesafe helper for a module/cmdline parameter
e2854a1054ab17 Zhenzhong Duan  2019-11-04  116   * @name: the variable to alter, and exposed parameter name.
546970bc6afc7f Rusty Russell   2010-08-11  117   * @type: the type of the parameter
546970bc6afc7f Rusty Russell   2010-08-11  118   * @perm: visibility in sysfs.
546970bc6afc7f Rusty Russell   2010-08-11  119   *
e2854a1054ab17 Zhenzhong Duan  2019-11-04  120   * @name becomes the module parameter, or (prefixed by KBUILD_MODNAME and a
546970bc6afc7f Rusty Russell   2010-08-11  121   * ".") the kernel commandline parameter.  Note that - is changed to _, so
546970bc6afc7f Rusty Russell   2010-08-11  122   * the user can use "foo-bar=1" even for variable "foo_bar".
546970bc6afc7f Rusty Russell   2010-08-11  123   *
c6a8b84da4c28b Randy Dunlap    2020-07-17  124   * @perm is 0 if the variable is not to appear in sysfs, or 0444
546970bc6afc7f Rusty Russell   2010-08-11  125   * for world-readable, 0644 for root-writable, etc.  Note that if it
b51d23e4e9fea6 Dan Streetman   2015-06-17  126   * is writable, you may need to use kernel_param_lock() around
546970bc6afc7f Rusty Russell   2010-08-11  127   * accesses (esp. charp, which can be kfreed when it changes).
546970bc6afc7f Rusty Russell   2010-08-11  128   *
546970bc6afc7f Rusty Russell   2010-08-11  129   * The @type is simply pasted to refer to a param_ops_##type and a
546970bc6afc7f Rusty Russell   2010-08-11  130   * param_check_##type: for convenience many standard types are provided but
546970bc6afc7f Rusty Russell   2010-08-11  131   * you can create your own by defining those variables.
546970bc6afc7f Rusty Russell   2010-08-11  132   *
546970bc6afc7f Rusty Russell   2010-08-11  133   * Standard types are:
7d8365771ffb0e Paul Menzel     2020-07-03  134   *	byte, hexint, short, ushort, int, uint, long, ulong
546970bc6afc7f Rusty Russell   2010-08-11  135   *	charp: a character pointer
546970bc6afc7f Rusty Russell   2010-08-11  136   *	bool: a bool, values 0/1, y/n, Y/N.
546970bc6afc7f Rusty Russell   2010-08-11  137   *	invbool: the above, only sense-reversed (N = true).
546970bc6afc7f Rusty Russell   2010-08-11  138   */
546970bc6afc7f Rusty Russell   2010-08-11  139  #define module_param(name, type, perm)				\
546970bc6afc7f Rusty Russell   2010-08-11  140  	module_param_named(name, name, type, perm)
546970bc6afc7f Rusty Russell   2010-08-11  141  
3baee201b06cfa Jani Nikula     2014-08-27  142  /**
3baee201b06cfa Jani Nikula     2014-08-27  143   * module_param_unsafe - same as module_param but taints kernel
b6d0531ec7e2ae Fabien Dessenne 2019-12-02  144   * @name: the variable to alter, and exposed parameter name.
b6d0531ec7e2ae Fabien Dessenne 2019-12-02  145   * @type: the type of the parameter
b6d0531ec7e2ae Fabien Dessenne 2019-12-02  146   * @perm: visibility in sysfs.
3baee201b06cfa Jani Nikula     2014-08-27  147   */
3baee201b06cfa Jani Nikula     2014-08-27  148  #define module_param_unsafe(name, type, perm)			\
3baee201b06cfa Jani Nikula     2014-08-27  149  	module_param_named_unsafe(name, name, type, perm)
3baee201b06cfa Jani Nikula     2014-08-27  150  
546970bc6afc7f Rusty Russell   2010-08-11  151  /**
546970bc6afc7f Rusty Russell   2010-08-11  152   * module_param_named - typesafe helper for a renamed module/cmdline parameter
546970bc6afc7f Rusty Russell   2010-08-11  153   * @name: a valid C identifier which is the parameter name.
546970bc6afc7f Rusty Russell   2010-08-11  154   * @value: the actual lvalue to alter.
546970bc6afc7f Rusty Russell   2010-08-11  155   * @type: the type of the parameter
546970bc6afc7f Rusty Russell   2010-08-11  156   * @perm: visibility in sysfs.
546970bc6afc7f Rusty Russell   2010-08-11  157   *
546970bc6afc7f Rusty Russell   2010-08-11  158   * Usually it's a good idea to have variable names and user-exposed names the
546970bc6afc7f Rusty Russell   2010-08-11  159   * same, but that's harder if the variable must be non-static or is inside a
546970bc6afc7f Rusty Russell   2010-08-11  160   * structure.  This allows exposure under a different name.
546970bc6afc7f Rusty Russell   2010-08-11  161   */
546970bc6afc7f Rusty Russell   2010-08-11  162  #define module_param_named(name, value, type, perm)			   \
546970bc6afc7f Rusty Russell   2010-08-11 @163  	param_check_##type(name, &(value));				   \
546970bc6afc7f Rusty Russell   2010-08-11 @164  	module_param_cb(name, &param_ops_##type, &value, perm);		   \
546970bc6afc7f Rusty Russell   2010-08-11  165  	__MODULE_PARM_TYPE(name, #type)
546970bc6afc7f Rusty Russell   2010-08-11  166  

:::::: The code at line 163 was first introduced by commit
:::::: 546970bc6afc7fb37447fbac09b82c7884662c21 param: add kerneldoc to moduleparam.h

:::::: TO: Rusty Russell <rusty@rustcorp.com.au>
:::::: CC: Rusty Russell <rusty@rustcorp.com.au>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
