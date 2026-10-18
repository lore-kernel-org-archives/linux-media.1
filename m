Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6070237DEA8
	for <linux-media@vger.kernel.org>; Sun, 18 Oct 2026 13:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792330562; cv=none; b=UkCYkNS3auIh6tJLSKWQtbl5uX09CZtOpExN8NSDL9X10x8++ATZT5CElHs+fgmM6Jcs1jE5EnKcPCeycHgcf9g+1eQSi8CJiqMuSzI9VVve0lUz1/wthjUsSrfn9tdEAY9IPUqFkqfgC8K+dZKTpVigTRsQLaVsuTluWeHKYQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792330562; c=relaxed/simple;
	bh=BcDhn6eRyq3bcbRd8KizkukZjCoufe2qaaMBWZkVGEc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Bstx1sTJJCZQ3AWgHhd4FXc1VSquk4Sa6Y0f1yyUxglfluulfS0yv5TJwGZIRWY2KbNDuQz6YsWCVr1iPreYlpgWfX53FfuwOJCrVhJHz9LEMk1kt7PuQRw5sWPMhx8I/P8fm46iyUF2HvnJbHuIc0i9Og6BTvS4Tyi4w7AvMlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OdMqMv5D; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OdMqMv5D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792330559; x=1823866559;
  h=date:from:to:cc:subject:message-id;
  bh=BcDhn6eRyq3bcbRd8KizkukZjCoufe2qaaMBWZkVGEc=;
  b=OdMqMv5DbdB7z2KauhE+/ciUN3LSfCd/iT1r99WIu2LNWg3dJhvel1uY
   nQeA1sZiLhmn+KbYpJmBPhkxYkw9CodMAsXqxitYrxZSSblGDQ3iFGD7e
   7HqhXSIJCB/4EGMwF9Cc/WDdSVhOk/1xaHJOLkTU5tN0xksttUk/sB/cw
   8DEJxEXop/hacAneF+HnD2x7/C3x9Dye+xbeGPoPyrd/4bIIV6b2M7gzu
   ZGHzI+9nvTWhSHZAOgmGjdSjEyzVustvMfvI9iqVDFbbtwFP6zY3lD9/7
   7b6f7bKBuNmtFfeQMQ0QJ37lRBJksJylGRscj5iT01uGey2GWVIb4KlA8
   Q==;
X-CSE-ConnectionGUID: aNRFo6bjTbCN4HpU+yarbA==
X-CSE-MsgGUID: VwGIAMqNQ+uCCjN0UWoLPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="1028486"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="1028486"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 06:35:59 -0700
X-CSE-ConnectionGUID: HfU0APc/RKWhTGCkPWqmTQ==
X-CSE-MsgGUID: MD0jLrKASiKjCAx/ocOCXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="2427422"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Oct 2026 06:35:57 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIR3K-00000000KS2-3klX;
	Sun, 18 Oct 2026 13:35:54 +0000
Date: Sun, 18 Oct 2026 21:35:46 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:media-ref 2/17]
 drivers/media/mc/mc-devnode.c:233:40: error: 'mdev' undeclared; did you mean
 'cdev'?
Message-ID: <202610182143.lRvPL9ir-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree:   git://linuxtv.org/sailus/media_tree.git media-ref
head:   cf47170584526b52366e936406ce2430b99a03a9
commit: 803515300f06fabf69ad489f3f1f8e5ab3f4717f [2/17] media: mc: Merge struct media_device back into struct media_devnode
config: arm-randconfig-1003-20261018 (https://download.01.org/0day-ci/archive/20261018/202610182143.lRvPL9ir-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261018/202610182143.lRvPL9ir-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610182143.lRvPL9ir-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/mc/mc-devnode.c: In function 'media_devnode_register':
>> drivers/media/mc/mc-devnode.c:233:40: error: 'mdev' undeclared (first use in this function); did you mean 'cdev'?
     233 |         dev_set_drvdata(&devnode->dev, mdev);
         |                                        ^~~~
         |                                        cdev
   drivers/media/mc/mc-devnode.c:233:40: note: each undeclared identifier is reported only once for each function it appears in
--
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
   include/linux/moduleparam.h:163:32: error: expected ')' before ',' token
     163 |         param_check_##type(name, &(value));                                \
         |                                ^
   include/linux/moduleparam.h:140:9: note: in expansion of macro 'module_param_named'
     140 |         module_param_named(name, name, type, perm)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/media/mc/mc-device.c:31:1: note: in expansion of macro 'module_param'
      31 | module_param(kaboom, unsigned int, 0077);
         | ^~~~~~~~~~~~
   include/linux/moduleparam.h:164:32: error: 'param_ops_unsigned' undeclared here (not in a function); did you mean 'param_ops_uint'?
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
   drivers/media/mc/mc-device.c: In function '__media_device_register':
>> drivers/media/mc/mc-device.c:761:56: error: 'devnode' undeclared (first use in this function); did you mean 'd_inode'?
     761 |         mdev->media_dir = debugfs_create_dir(dev_name(&devnode->dev),
         |                                                        ^~~~~~~
         |                                                        d_inode
   drivers/media/mc/mc-device.c:761:56: note: each undeclared identifier is reported only once for each function it appears in


vim +233 drivers/media/mc/mc-devnode.c

cf4b9211b5680cd drivers/media/media-devnode.c Laurent Pinchart      2009-12-09  201  
803515300f06fab drivers/media/mc/mc-devnode.c Sakari Ailus          2016-06-18  202  int __must_check media_devnode_register(struct media_devnode *devnode,
85de721c46ba8ad drivers/media/media-devnode.c Sakari Ailus          2013-12-12  203  					struct module *owner)
cf4b9211b5680cd drivers/media/media-devnode.c Laurent Pinchart      2009-12-09  204  {
cf4b9211b5680cd drivers/media/media-devnode.c Laurent Pinchart      2009-12-09  205  	int minor;
cf4b9211b5680cd drivers/media/media-devnode.c Laurent Pinchart      2009-12-09  206  	int ret;
cf4b9211b5680cd drivers/media/media-devnode.c Laurent Pinchart      2009-12-09  207  
cf4b9211b5680cd drivers/media/media-devnode.c Laurent Pinchart      2009-12-09  208  	/* Part 1: Find a free minor number */
cf4b9211b5680cd drivers/media/media-devnode.c Laurent Pinchart      2009-12-09  209  	mutex_lock(&media_devnode_lock);
b5c7e7ec7d3418a drivers/media/mc/mc-devnode.c Yury Norov            2021-08-14  210  	minor = find_first_zero_bit(media_devnode_nums, MEDIA_NUM_DEVICES);
cf4b9211b5680cd drivers/media/media-devnode.c Laurent Pinchart      2009-12-09  211  	if (minor == MEDIA_NUM_DEVICES) {
cf4b9211b5680cd drivers/media/media-devnode.c Laurent Pinchart      2009-12-09  212  		mutex_unlock(&media_devnode_lock);
3c16b2b330e3339 drivers/media/media-devnode.c Sachin Kamat          2012-09-24  213  		pr_err("could not get a free minor\n");
cf4b9211b5680cd drivers/media/media-devnode.c Laurent Pinchart      2009-12-09  214  		return -ENFILE;
cf4b9211b5680cd drivers/media/media-devnode.c Laurent Pinchart      2009-12-09  215  	}
cf4b9211b5680cd drivers/media/media-devnode.c Laurent Pinchart      2009-12-09  216  
8c89ddd536bbe97 drivers/media/media-devnode.c Laurent Pinchart      2011-05-30  217  	set_bit(minor, media_devnode_nums);
cf4b9211b5680cd drivers/media/media-devnode.c Laurent Pinchart      2009-12-09  218  	mutex_unlock(&media_devnode_lock);
cf4b9211b5680cd drivers/media/media-devnode.c Laurent Pinchart      2009-12-09  219  
163f1e93e995048 drivers/media/media-devnode.c Mauro Carvalho Chehab 2016-03-23  220  	devnode->minor = minor;
cf4b9211b5680cd drivers/media/media-devnode.c Laurent Pinchart      2009-12-09  221  
803515300f06fab drivers/media/mc/mc-devnode.c Sakari Ailus          2016-06-18  222  	/* Part 2: Initialize the media and character devices */
803515300f06fab drivers/media/mc/mc-devnode.c Sakari Ailus          2016-06-18  223  	cdev_init(&devnode->cdev, &media_devnode_fops);
803515300f06fab drivers/media/mc/mc-devnode.c Sakari Ailus          2016-06-18  224  	devnode->cdev.owner = owner;
803515300f06fab drivers/media/mc/mc-devnode.c Sakari Ailus          2016-06-18  225  	kobject_set_name(&devnode->cdev.kobj, "media%d", devnode->minor);
803515300f06fab drivers/media/mc/mc-devnode.c Sakari Ailus          2016-06-18  226  
5b28dde51d0ccc5 drivers/media/media-devnode.c Shuah Khan            2016-05-04  227  	devnode->dev.bus = &media_bus_type;
5b28dde51d0ccc5 drivers/media/media-devnode.c Shuah Khan            2016-05-04  228  	devnode->dev.devt = MKDEV(MAJOR(media_dev_t), devnode->minor);
5b28dde51d0ccc5 drivers/media/media-devnode.c Shuah Khan            2016-05-04  229  	devnode->dev.release = media_devnode_release;
5b28dde51d0ccc5 drivers/media/media-devnode.c Shuah Khan            2016-05-04  230  	if (devnode->parent)
5b28dde51d0ccc5 drivers/media/media-devnode.c Shuah Khan            2016-05-04  231  		devnode->dev.parent = devnode->parent;
5b28dde51d0ccc5 drivers/media/media-devnode.c Shuah Khan            2016-05-04  232  	dev_set_name(&devnode->dev, "media%d", devnode->minor);
de9f0c2a1ce3d97 drivers/media/mc/mc-devnode.c Hans Verkuil          2025-11-28 @233  	dev_set_drvdata(&devnode->dev, mdev);
5b28dde51d0ccc5 drivers/media/media-devnode.c Shuah Khan            2016-05-04  234  	device_initialize(&devnode->dev);
5b28dde51d0ccc5 drivers/media/media-devnode.c Shuah Khan            2016-05-04  235  
803515300f06fab drivers/media/mc/mc-devnode.c Sakari Ailus          2016-06-18  236  	/* Part 3: Add the media and character devices */
4bc60736154bc9e drivers/media/mc/mc-devnode.c Hans Verkuil          2024-02-23  237  	set_bit(MEDIA_FLAG_REGISTERED, &devnode->flags);
857313e51006ff5 drivers/media/media-devnode.c Logan Gunthorpe       2017-03-17  238  	ret = cdev_device_add(&devnode->cdev, &devnode->dev);
cf4b9211b5680cd drivers/media/media-devnode.c Laurent Pinchart      2009-12-09  239  	if (ret < 0) {
857313e51006ff5 drivers/media/media-devnode.c Logan Gunthorpe       2017-03-17  240  		pr_err("%s: cdev_device_add failed\n", __func__);
5b28dde51d0ccc5 drivers/media/media-devnode.c Shuah Khan            2016-05-04  241  		goto cdev_add_error;
cf4b9211b5680cd drivers/media/media-devnode.c Laurent Pinchart      2009-12-09  242  	}
cf4b9211b5680cd drivers/media/media-devnode.c Laurent Pinchart      2009-12-09  243  
cf4b9211b5680cd drivers/media/media-devnode.c Laurent Pinchart      2009-12-09  244  	return 0;
cf4b9211b5680cd drivers/media/media-devnode.c Laurent Pinchart      2009-12-09  245  
5b28dde51d0ccc5 drivers/media/media-devnode.c Shuah Khan            2016-05-04  246  cdev_add_error:
5b28dde51d0ccc5 drivers/media/media-devnode.c Shuah Khan            2016-05-04  247  	mutex_lock(&media_devnode_lock);
163f1e93e995048 drivers/media/media-devnode.c Mauro Carvalho Chehab 2016-03-23  248  	clear_bit(devnode->minor, media_devnode_nums);
88336e174645948 drivers/media/media-devnode.c Max Kellermann        2016-03-21  249  	mutex_unlock(&media_devnode_lock);
5b28dde51d0ccc5 drivers/media/media-devnode.c Shuah Khan            2016-05-04  250  	put_device(&devnode->dev);
803515300f06fab drivers/media/mc/mc-devnode.c Sakari Ailus          2016-06-18  251  
cf4b9211b5680cd drivers/media/media-devnode.c Laurent Pinchart      2009-12-09  252  	return ret;
cf4b9211b5680cd drivers/media/media-devnode.c Laurent Pinchart      2009-12-09  253  }
cf4b9211b5680cd drivers/media/media-devnode.c Laurent Pinchart      2009-12-09  254  

:::::: The code at line 233 was first introduced by commit
:::::: de9f0c2a1ce3d97561d5cf4678b80e13943647fd media: mc: add debugfs node to keep track of requests

:::::: TO: Hans Verkuil <hverkuil+cisco@kernel.org>
:::::: CC: Hans Verkuil <hverkuil+cisco@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
