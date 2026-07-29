Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1303B9943;
	Wed, 29 Jul 2026 20:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785357830; cv=none; b=W1/AsPmTfUAxjpWcZFhi4S4nkfpUZ/WVC3yQ7g4fD4WaokfwHBndNPsRtWPdtw9jKSUkJ8S+ID4utBk7h3J338j6Kv1TC6K5emL6CTOs+VQKD9J1u6v6C0fU9gxdMxZ/nJ2Q2W2/A7T/tCwxgWKNJp8GN94c30ILlL059XSXw/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785357830; c=relaxed/simple;
	bh=MtdTNUvUGP6jEAXw3FQhLk5OsyAt9kSKLUL86iTob2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kCm/9BRFzsAOLFXJRtL8cSXE9QXDPG/6i5yrUcTKpQYQuxvuamLpPpCKDu/KnFv+y3AAuZZYhqeSdbSfJSXdxlkm2GEcO1N0q2jYU43I27MaYuFJptkdwWy7RWV/XIdB42dnFRlHSmP9ZR5yuw02A/ND0eydDsJXr7kGTxZw2LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QsiMsRz2; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QsiMsRz2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785357827; x=1816893827;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MtdTNUvUGP6jEAXw3FQhLk5OsyAt9kSKLUL86iTob2s=;
  b=QsiMsRz22IcTCpBbUb4GNokX8xbyFt1XQcrWxwWrZy+HgO6ThEloyEm9
   aBReKGZnBEsmTJ8sfMCdsO6i/VjUqJTprNtKoFiEVIYCIch/2LMZ+3zcq
   jETnfx8jk2y6PRE+v7HJSENXU8FDt8p2W0hSkSxjfjyG3ZykpVVJ2mtZt
   YqRTIQAE8bnccBAQTjZBoCKPZmbE/t8ftgqgrAZEAlb8D5CXHd6qA55oZ
   fjkBcKbv2Bm2UnyZQtyNLHrnYPH6MwvTeMBKe9DzI4zIj5OyPa+aOZgON
   WnVWqITGpX9yk43WaK/AUesnYE2U3RMkOrJmHRpRMS5kYC+cKmhTo9cAR
   Q==;
X-CSE-ConnectionGUID: JVSf+fPiT/uIXRaDKYhEAg==
X-CSE-MsgGUID: WEycxxXgSvqP2jvoJGmcQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="111519442"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="111519442"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 13:43:46 -0700
X-CSE-ConnectionGUID: Lv45qJ3lT+2g35cyGMmxkg==
X-CSE-MsgGUID: vwwEWHH0R/C/A5upvcA0Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="262062897"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 29 Jul 2026 13:43:43 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpB7o-00000000ffq-1Kdb;
	Wed, 29 Jul 2026 20:43:36 +0000
Date: Thu, 30 Jul 2026 04:37:40 +0800
From: kernel test robot <lkp@intel.com>
To: Tharit Tangkijwanichakul <tharitt97@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	me@brighamcampbell.com, jkoolstra@xs4all.nl, Frank.li@oss.nxp.com,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: Re: [PATCH v3] media: hantro: release runtime resources when
 device_run fails
Message-ID: <202607300319.RuKrwvI7-lkp@intel.com>
References: <20260726024243.730-1-tharitt97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260726024243.730-1-tharitt97@gmail.com>

Hi Tharit,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on pza/reset/next v7.2-rc5 next-20260729]
[cannot apply to pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tharit-Tangkijwanichakul/media-hantro-release-runtime-resources-when-device_run-fails/20260726-104549
base:   linus/master
patch link:    https://lore.kernel.org/r/20260726024243.730-1-tharitt97%40gmail.com
patch subject: [PATCH v3] media: hantro: release runtime resources when device_run fails
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260730/202607300319.RuKrwvI7-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607300319.RuKrwvI7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607300319.RuKrwvI7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/verisilicon/hantro_drv.c:1309:12: warning: 'hantro_runtime_suspend' defined but not used [-Wunused-function]
    1309 | static int hantro_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/verisilicon/hantro_drv.c:1287:12: warning: 'hantro_runtime_resume' defined but not used [-Wunused-function]
    1287 | static int hantro_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~


vim +/hantro_runtime_suspend +1309 drivers/media/platform/verisilicon/hantro_drv.c

  1286	
> 1287	static int hantro_runtime_resume(struct device *dev)
  1288	{
  1289		struct hantro_dev *vpu = dev_get_drvdata(dev);
  1290		int ret;
  1291	
  1292		ret = clk_bulk_enable(vpu->variant->num_clocks, vpu->clocks);
  1293		if (ret)
  1294			return ret;
  1295	
  1296		if (vpu->variant->runtime_resume) {
  1297			ret = vpu->variant->runtime_resume(vpu);
  1298			if (ret)
  1299				goto err_disable_clocks;
  1300		}
  1301	
  1302		return 0;
  1303	
  1304	err_disable_clocks:
  1305		clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
  1306		return ret;
  1307	}
  1308	
> 1309	static int hantro_runtime_suspend(struct device *dev)
  1310	{
  1311		struct hantro_dev *vpu = dev_get_drvdata(dev);
  1312	
  1313		clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
  1314		return 0;
  1315	}
  1316	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
