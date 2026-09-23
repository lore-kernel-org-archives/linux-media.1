Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F9F353A6D
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 06:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144697; cv=none; b=AIh5UJSQXVXLUU7+Hu3geqBg9sRpS/2+PEGnbJy3wjN0MYaRHYTIGg900dbw6+ZkLRlFlZ8xEB8i+98MGcsAJoV9No9DzefCtVaRa3LbSu3QspY8yB2UI3S/Sj6sVf+tQ51ZlPUk/CB8rfg0QxCMULbkkYUiBn0otzvMmhdJUOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144697; c=relaxed/simple;
	bh=uP2Ac3mjfWdVsPQcZXu9mp263ZBkvOvOLy4V8zmTvJQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bdlHccO+9Msv3t2MH3U0RX6a53/pz/Em+IC+VTxP4GdYaRa8PukhPLHr199VH/gyMKUY+VeVcoAEXhiMhwHu0kwiDRnJkoGUiYTjtGUPWBuNZYFyOSoiT34Q+aWDUmXVjRy9YMcmisFjKa/zeIHzU+bgKAg346OS6+ro+6Uovxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aiRI+flU; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aiRI+flU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790144695; x=1821680695;
  h=date:from:to:cc:subject:message-id;
  bh=uP2Ac3mjfWdVsPQcZXu9mp263ZBkvOvOLy4V8zmTvJQ=;
  b=aiRI+flUxMqV4Su4tPOZIm3cgHPrldlhkYpAaah6/Nw1JhMfjIHTFdoA
   nKJxERmWSSbaTH3BfaI7MtPfXZoj4Ow5ey8be9WDjCSLcdTfhpl9LchWX
   Km8t0dgHL1iX90qiHq4PkUQgwt3i/fD8I1d1goikC4ZINwXrbLmC/Fabo
   pBzAlkb97uB8EGtZKL+6xnf7n8nfjt6eJ2cky8oM5eN7fEZNcIYdXx9iK
   Cc89KQ8CoAM0qCFn20KiHrkcAPhQ5beIbiTiLg+4I7C6V3KiYB0Ozn5lG
   eJL8+YUG0eSeoPvq2oXlC0MVVFx4f9nqs9bkupf+xSNXolYbqwIcPlun0
   g==;
X-CSE-ConnectionGUID: 32MvgVfxSO+2GT0emWZ9Rw==
X-CSE-MsgGUID: C0ij4jwCQOe7QRcl8Ya8LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="93309287"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="93309287"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 23:24:54 -0700
X-CSE-ConnectionGUID: pjAG4w0yQD2u5kFHLZlxdw==
X-CSE-MsgGUID: s8uD15w0TESBu6kB1V4boQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="301384401"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 22 Sep 2026 23:24:53 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9GPT-000000000YB-0AwF;
	Wed, 23 Sep 2026 06:24:51 +0000
Date: Wed, 23 Sep 2026 08:24:46 +0200
From: kernel test robot <lkp@intel.com>
To: Sean Young <sean@mess.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next 1/20]
 drivers/media/rc/rc-main.c:1984:38: error: 'struct rc_dev' has no member
 named 'lirc_dev'
Message-ID: <202609230856.O7Ofceje-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree:   https://git.linuxtv.org/media-ci/media-pending.git next
head:   05d9c515cf13056875abbf73adb4a19dd7ba32eb
commit: 37efd09ba2c62e46e3a3a793025c186f8cd1a417 [1/20] media: rc: Ensure registered is cleared in error path
config: arm-randconfig-r2201-20260923 (https://download.01.org/0day-ci/archive/20260923/202609230856.O7Ofceje-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609230856.O7Ofceje-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609230856.O7Ofceje-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/rc/rc-main.c: In function 'rc_register_device':
>> drivers/media/rc/rc-main.c:1984:38: error: 'struct rc_dev' has no member named 'lirc_dev'
    1984 |         if (device_is_registered(&dev->lirc_dev))
         |                                      ^~


vim +1984 drivers/media/rc/rc-main.c

  1901	
  1902	int rc_register_device(struct rc_dev *dev)
  1903	{
  1904		const char *path;
  1905		int attr = 0;
  1906		int minor;
  1907		int rc;
  1908	
  1909		if (!dev)
  1910			return -EINVAL;
  1911	
  1912		minor = ida_alloc_max(&rc_ida, RC_DEV_MAX - 1, GFP_KERNEL);
  1913		if (minor < 0)
  1914			return minor;
  1915	
  1916		dev->minor = minor;
  1917		dev_set_name(&dev->dev, "rc%u", dev->minor);
  1918		dev_set_drvdata(&dev->dev, dev);
  1919	
  1920		dev->dev.groups = dev->sysfs_groups;
  1921		if (dev->driver_type == RC_DRIVER_SCANCODE && !dev->change_protocol)
  1922			dev->sysfs_groups[attr++] = &rc_dev_ro_protocol_attr_grp;
  1923		else if (dev->driver_type != RC_DRIVER_IR_RAW_TX)
  1924			dev->sysfs_groups[attr++] = &rc_dev_rw_protocol_attr_grp;
  1925		if (dev->s_filter)
  1926			dev->sysfs_groups[attr++] = &rc_dev_filter_attr_grp;
  1927		if (dev->s_wakeup_filter)
  1928			dev->sysfs_groups[attr++] = &rc_dev_wakeup_filter_attr_grp;
  1929		dev->sysfs_groups[attr++] = NULL;
  1930	
  1931		if (dev->driver_type != RC_DRIVER_IR_RAW_TX) {
  1932			rc = rc_prepare_rx_device(dev);
  1933			if (rc)
  1934				goto out_raw;
  1935		}
  1936	
  1937		scoped_guard(mutex, &dev->lock)
  1938			dev->registered = true;
  1939	
  1940		rc = device_add(&dev->dev);
  1941		if (rc)
  1942			goto out_rx_free;
  1943	
  1944		path = kobject_get_path(&dev->dev.kobj, GFP_KERNEL);
  1945		dev_info(&dev->dev, "%s as %s\n",
  1946			 dev->device_name ?: "Unspecified device", path ?: "N/A");
  1947		kfree(path);
  1948	
  1949		/*
  1950		 * once the input device is registered in rc_setup_rx_device,
  1951		 * userspace can open the input device and rc_open() will be called
  1952		 * as a result. This results in driver code being allowed to submit
  1953		 * keycodes with rc_keydown, so lirc must be registered first.
  1954		 */
  1955		if (dev->allowed_protocols != RC_PROTO_BIT_CEC) {
  1956			rc = lirc_register(dev);
  1957			if (rc < 0)
  1958				goto out_lirc;
  1959		}
  1960	
  1961		if (dev->driver_type != RC_DRIVER_IR_RAW_TX) {
  1962			rc = rc_setup_rx_device(dev);
  1963			if (rc)
  1964				goto out_lirc;
  1965		}
  1966	
  1967		if (dev->driver_type == RC_DRIVER_IR_RAW) {
  1968			rc = ir_raw_event_register(dev);
  1969			if (rc < 0)
  1970				goto out_rx;
  1971		}
  1972	
  1973		dev_dbg(&dev->dev, "Registered rc%u (driver: %s)\n", dev->minor,
  1974			dev->driver_name ? dev->driver_name : "unknown");
  1975	
  1976		return 0;
  1977	
  1978	out_rx:
  1979		rc_free_rx_device(dev);
  1980	out_lirc:
  1981		scoped_guard(mutex, &dev->lock)
  1982			dev->registered = false;
  1983	
> 1984		if (device_is_registered(&dev->lirc_dev))
  1985			lirc_unregister(dev);
  1986		device_del(&dev->dev);
  1987		/* registered already cleared above */
  1988		goto out_free_table;
  1989	out_rx_free:
  1990		scoped_guard(mutex, &dev->lock)
  1991			dev->registered = false;
  1992	out_free_table:
  1993		ir_free_table(&dev->rc_map);
  1994	out_raw:
  1995		ida_free(&rc_ida, minor);
  1996		return rc;
  1997	}
  1998	EXPORT_SYMBOL_GPL(rc_register_device);
  1999	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
