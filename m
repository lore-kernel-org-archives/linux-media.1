Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96A53D47D4
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 04:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778819527; cv=none; b=ra9+qGHL07Z0ewDkK8i9qmY3PywFuaHf3MIXgNxNaQ2V+FmfQdbeQcBRWvAWHXR0fl1UHUYkkntcFekPyllRdS3XEGtUwDlQJOEy67tyWGO2swWttsc0Hqo6g6e2zbjzAvYQ1n9jviU7ydjgWpPIgjqDixc/k5AJK5lnhhtC40c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778819527; c=relaxed/simple;
	bh=LCPjfrrgJPnIGIPFtwQ3/X0CtDTiapd2IJ8/ZW1jOUo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UFreIZfqDiSAvGNRpRFVtXEzPQXwwaolfAXyVMT/yogZsNy+3jTfyVK3GpDGNBSfdCJ2RWSLKv+vpVbW041INZ1OnI3JvoQ5ih+VkehoDkNtjYh6YpXcL/s+RMQuNWiUB2vD4/4/AgX8UUW9iXCwqkNUgFa68zY8+JTYZqGJK6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IUO1/FLl; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IUO1/FLl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778819526; x=1810355526;
  h=date:from:to:cc:subject:message-id;
  bh=LCPjfrrgJPnIGIPFtwQ3/X0CtDTiapd2IJ8/ZW1jOUo=;
  b=IUO1/FLlsXZJsvq+H1RkLdrcEIGgKxF27LiakzWFED9/HVpop/hOIYPg
   fuGRGo++BEAkR/mrXeKiNdycoG09YNmyDP6j/1SrXTfJF4wqZbIkuYfDC
   Tm61b+r6UHYY65ET2lBiKwH439JOD1Q7WVwBaUJw9FCMAQSK76SVaRuG6
   R+Tz0Tqo210qORmlOAAKd9ba1R/QCRD+95NYMstEF5wXRTehaGHGNNTU0
   Yg6jCP2nDiTdKFp9q2KFXwYivukgu41ZE/ypRsZ0oHVt8l+xjonGS2pBn
   gzp6/zCe7g/YUi4gRKUnV8RohJ0gVvieOGJT5BX1XcaXxDN4K/FcDIF1V
   Q==;
X-CSE-ConnectionGUID: ummm0p1/Sl6BLbmEd9yBuA==
X-CSE-MsgGUID: ST2pgAtuS1+NUfkla1APuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="82339659"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="82339659"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 21:32:05 -0700
X-CSE-ConnectionGUID: ujiYfNKcQc6ZUiHOdL8uRw==
X-CSE-MsgGUID: eHPM7qBGTFqJxMjgxGAPnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="238470926"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 14 May 2026 21:32:03 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNkDR-000000000pZ-0EIT;
	Fri, 15 May 2026 04:32:01 +0000
Date: Fri, 15 May 2026 12:21:17 +0800
From: kernel test robot <lkp@intel.com>
To: Miguel Vadillo <miguel.vadillo@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [sailus-media-tree:cvs 1/2]
 include/media/ipu6-pci-table.h:18:35: warning: 'ipu6_pci_tbl' defined but not
 used
Message-ID: <202605151250.o6FD59VY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree:   git://linuxtv.org/sailus/media_tree.git cvs
head:   b4dc6955e91d5c1a1c5e43cabb923227c3ed1225
commit: c0c42034f4977a46e491c54e5efc8f90dd748ed7 [1/2] media: i2c: cvs: Add driver of Intel Computer Vision Sensing Controller(CVS)
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260515/202605151250.o6FD59VY-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605151250.o6FD59VY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605151250.o6FD59VY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/i2c/cvs/core.c:25:
>> include/media/ipu6-pci-table.h:18:35: warning: 'ipu6_pci_tbl' defined but not used [-Wunused-const-variable=]
      18 | static const struct pci_device_id ipu6_pci_tbl[] = {
         |                                   ^~~~~~~~~~~~


vim +/ipu6_pci_tbl +18 include/media/ipu6-pci-table.h

e42ae51b7628f58 Sakari Ailus 2024-02-13  17  
e42ae51b7628f58 Sakari Ailus 2024-02-13 @18  static const struct pci_device_id ipu6_pci_tbl[] = {
e42ae51b7628f58 Sakari Ailus 2024-02-13  19  	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6) },
e42ae51b7628f58 Sakari Ailus 2024-02-13  20  	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6SE) },
e42ae51b7628f58 Sakari Ailus 2024-02-13  21  	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6EP_ADLP) },
e42ae51b7628f58 Sakari Ailus 2024-02-13  22  	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6EP_ADLN) },
e42ae51b7628f58 Sakari Ailus 2024-02-13  23  	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6EP_RPLP) },
e42ae51b7628f58 Sakari Ailus 2024-02-13  24  	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6EP_MTL) },
e42ae51b7628f58 Sakari Ailus 2024-02-13  25  	{ }
e42ae51b7628f58 Sakari Ailus 2024-02-13  26  };
e42ae51b7628f58 Sakari Ailus 2024-02-13  27  

:::::: The code at line 18 was first introduced by commit
:::::: e42ae51b7628f589477588ae5837e4e5875a2d92 media: ipu6: Add PCI device table header

:::::: TO: Sakari Ailus <sakari.ailus@linux.intel.com>
:::::: CC: Hans Verkuil <hverkuil-cisco@xs4all.nl>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
