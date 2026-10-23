Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792717654;
	b=lV8Vlq6JdGDplaueeEcNVGBiq6eTfC0Qy6UQy+g00/sEY1PNb+bqAfhCkyJ4oR9eIix8
	 bBhD4RdSqOhtYduO2xZ8lpSIv0DQRBO+IaLCZli1EtuKxx++CK6D7LuNbjYE4zTBPYOeH
	 IwLd7fRsboKW42FbCdkfTNUXUVMr4gW8/92xkaVG7rxuGKMF3gE8V5BPM7SnHiFfz0cpw
	 8/a9p3v3+Z4Hi0mGZ0s4FPGsQM6+JRPUFuseB+edkqNxAq2uL0OhYA0FLO3BkjESExIJe
	 H2a4DEQ5dtWmytmn++JucQrxfGXUWGUzsiDg/LV2MMS2HeQ4hptnGZWdDbCwPeRPDGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792717654;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=C9dSy1gixxOPJ+dX6oXxYAX8z+8FHw7J2Hfk22nKTKw=;
	b=gn+5sduIj2W+92feKGk1UemZnthEaYsjYhMJHAgX7S9Xb1gIAoR2s4OQotH02V+AZbBT
	 QD8AAUwoNbkA45eTtvkoxqT9QmYZMfqZw4ROU4RIzN1sZVHGIWqV6qwJSejTyGDPWsZ01
	 RiYBwk4ZxlqBO6acvE7DebJzkCrZ78M/Ul5/KJrJEN72ugU58aSDOr/4FyazmdRbMLzpO
	 aMbAF3lKzHdhYYg87tIEhQFxXJLgo7Ns8dPYExSTq19kDCxj0d2KpZF2MdUAx7BeGZSrS
	 axd0apjxxqSv3EwLGyJjIW0mGWSu/DKVV9BrniVqrYrpz609m7ddFFdBxPOCFNyU+gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GGU3+jXS;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD06606A31A
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 01:07:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBD06606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GGU3+jXS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792717653; x=1824253653;
  h=date:from:to:cc:subject:message-id;
  bh=iWm/zTSqhu60YbzPCUGrDnysngoQfLbvb1C+O1toHfw=;
  b=GGU3+jXS+BZF70emF7Uv1uVpXC8oGJHT4s05nf2Iw9PSoJ3CT9ctRBn4
   JeT4QNDrkoYCRCbGMtGhAs2hCTt86n09KfBfqQ5zlvQ4VkPBc1zV/fIIJ
   eilzWl+PUbLyD//pjy3lkVNaJ2D9oaHLB9ks+UAHdPWj4ciPnYgNvS1l/
   MZKW+90WaENZ2C4K15J9eZozVGIcSdmxw4h3GTzxO3n0Z2Q5G/hwuMP6r
   yB7+PQCoDMZVZ5fZYur3H+hsHjs5UYF2XcWwRe0vK7ft+A5yYY0hN6O3f
   0yzgwf+GyEGquZHdCAXmSqcan/F7UllZ3egV7dT1SCuHO3W5049FbPcVO
   Q==;
X-CSE-ConnectionGUID: fkxN/+RbRqeFKvBm3TaE+w==
X-CSE-MsgGUID: yH32eTxASxCZFQoGmaTaeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1358212"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1358212"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 18:07:33 -0700
X-CSE-ConnectionGUID: l9JSO4O8SGqbv1QofjijyA==
X-CSE-MsgGUID: 9w2nlIlmQmu0nESKkMp4tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3887356"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 22 Oct 2026 18:07:30 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xK3kl-00000000Rvy-3nWx;
	Fri, 23 Oct 2026 01:07:27 +0000
Date: Fri, 23 Oct 2026 09:07:27 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:media-ref 21/27]
 drivers/media/test-drivers/vim2m.c:1537:16: warning: format '%x' expects
 argument of type 'unsigned int', but argument 3 has type 'long unsigned int'
Message-ID: <202610230952.VqxTerY1-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list

tree:   git://linuxtv.org/sailus/media_tree.git media-ref
head:   bb43fe9fe0f40894bec0e5045aade6652ef6a46c
commit: 5df2cfc0b2f0f0b584050f1b56cf75c78c6e0091 [21/27] koe
config: x86_64-buildonly-randconfig-1001-20261022 (https://download.01.org/0day-ci/archive/20261023/202610230952.VqxTerY1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261023/202610230952.VqxTerY1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610230952.VqxTerY1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:31,
                    from arch/x86/include/asm/bug.h:195,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/module.h:12,
                    from drivers/media/test-drivers/vim2m.c:16:
   drivers/media/test-drivers/vim2m.c: In function 'vim2m_probe':
>> drivers/media/test-drivers/vim2m.c:1537:16: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'long unsigned int' [-Wformat=]
    1537 |         printk("OBJECT vim2m %p, size %x\n", dev, sizeof(*dev));
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~       ~~~~~~~~~~~~
         |                                                   |
         |                                                   long unsigned int
   include/linux/printk.h:483:25: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   drivers/media/test-drivers/vim2m.c:1537:9: note: in expansion of macro 'printk'
    1537 |         printk("OBJECT vim2m %p, size %x\n", dev, sizeof(*dev));
         |         ^~~~~~
   drivers/media/test-drivers/vim2m.c:1537:40: note: format string is defined here
    1537 |         printk("OBJECT vim2m %p, size %x\n", dev, sizeof(*dev));
         |                                       ~^
         |                                        |
         |                                        unsigned int
         |                                       %lx


vim +1537 drivers/media/test-drivers/vim2m.c

  1526	
  1527	static int vim2m_probe(struct platform_device *pdev)
  1528	{
  1529		struct vim2m_dev *dev;
  1530		struct video_device *vfd;
  1531		int ret;
  1532	
  1533		dev = kzalloc_obj(*dev);
  1534		if (!dev)
  1535			return -ENOMEM;
  1536	
> 1537		printk("OBJECT vim2m %p, size %x\n", dev, sizeof(*dev));
  1538	
  1539		ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
  1540		if (ret)
  1541			goto error_free;
  1542	
  1543		atomic_set(&dev->num_inst, 0);
  1544		mutex_init(&dev->dev_mutex);
  1545	
  1546		dev->multiplanar = (multiplanar == 2);
  1547	
  1548		dev->vfd = vim2m_videodev;
  1549		vfd = &dev->vfd;
  1550		vfd->lock = &dev->dev_mutex;
  1551		vfd->v4l2_dev = &dev->v4l2_dev;
  1552		vfd->device_caps |= (dev->multiplanar) ? V4L2_CAP_VIDEO_M2M_MPLANE :
  1553			V4L2_CAP_VIDEO_M2M;
  1554	
  1555		video_set_drvdata(vfd, dev);
  1556		platform_set_drvdata(pdev, dev);
  1557	
  1558		dev->m2m_dev = v4l2_m2m_init(&m2m_ops);
  1559		if (IS_ERR(dev->m2m_dev)) {
  1560			v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem device\n");
  1561			ret = PTR_ERR(dev->m2m_dev);
  1562			dev->m2m_dev = NULL;
  1563			goto error_dev;
  1564		}
  1565	
  1566		dev->mdev.dev = &pdev->dev;
  1567		strscpy(dev->mdev.model, "vim2m", sizeof(dev->mdev.model));
  1568		strscpy(dev->mdev.bus_info, "platform:vim2m",
  1569			sizeof(dev->mdev.bus_info));
  1570		media_device_init(&dev->mdev);
  1571		dev->mdev.ops = &m2m_media_ops;
  1572		dev->v4l2_dev.mdev = &dev->mdev;
  1573	
  1574		ret = video_register_device(vfd, VFL_TYPE_VIDEO, 0);
  1575		if (ret) {
  1576			v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
  1577			goto error_m2m;
  1578		}
  1579	
  1580		v4l2_info(&dev->v4l2_dev,
  1581			  "Device registered as /dev/video%d\n", vfd->num);
  1582	
  1583		ret = v4l2_m2m_register_media_controller(dev->m2m_dev, vfd,
  1584							 MEDIA_ENT_F_PROC_VIDEO_SCALER);
  1585		if (ret) {
  1586			v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem media controller\n");
  1587			goto error_v4l2;
  1588		}
  1589	
  1590		ret = media_device_register(&dev->mdev);
  1591		if (ret) {
  1592			v4l2_err(&dev->v4l2_dev, "Failed to register mem2mem media device\n");
  1593			goto error_m2m_mc;
  1594		}
  1595	
  1596		return 0;
  1597	
  1598	error_m2m_mc:
  1599		v4l2_m2m_unregister_media_controller(dev->m2m_dev);
  1600	error_v4l2:
  1601		video_unregister_device(&dev->vfd);
  1602		/* vim2m_device_release called by video_unregister_device to release various objects */
  1603		return ret;
  1604	error_m2m:
  1605		v4l2_m2m_release(dev->m2m_dev);
  1606	error_dev:
  1607		v4l2_device_unregister(&dev->v4l2_dev);
  1608	error_free:
  1609		kfree(dev);
  1610	
  1611		return ret;
  1612	}
  1613	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
