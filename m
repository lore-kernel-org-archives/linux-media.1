Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A713B14D2;
	Thu, 13 Aug 2026 19:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786648210; cv=none; b=CebCxac4R0Hqfn/W484o6QAuepD4cV+2J5AfaNkaRPPwsP9xXnzJ6WFlvZ2Kv49WHxc5ZNdwCG9p36KOPN+i3QInDTAB7I0ZL03QxgC5RU7zAqLR8xBQkRuJSBx0IgKzR2vaWKkCb18LY1xY7a/d/q7HlyKdsuV37JyB+aCyfB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786648210; c=relaxed/simple;
	bh=gWxgPdOFICTOnswLeOTRw2haQDIn2SOw2YLCySUySWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HGHkBkNwDuaeiMVM1/a5J/MzaQxe+8rSpM2AkZ9V2bJzOfDbJsNVjz0Od0NsR0CmahcUERDeifTrfaBOrBcmJv2idNI3Xj0Nze0KAqtB3BlbwNj+desK5PSBZvERqsJz09GmN6LG4U/5mIvqiBQwBgLzYLicAncq4JcdNhqZ9x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bpuw3Yc1; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bpuw3Yc1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786648209; x=1818184209;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gWxgPdOFICTOnswLeOTRw2haQDIn2SOw2YLCySUySWw=;
  b=bpuw3Yc1xeDstVIx65b6vB3sBqiTDzud5e1cEzrCkpdxptkSRXebMStZ
   JUM1wUeWpAxm2UMaSBvcX5NTp92B0J/OzxWjLUzT/Qk9aTGnlSr4jfuCc
   uH7fVUVQ80dQO0B1ckNH9fotta7aE2IgoMB/slvmSkkCyrQJv46H09xuR
   5x7z/TQQROgIT31jd2i39gAmke6C1H5LvVIGiyG7GVXU32cLcsQ3qKS0m
   FcpUOsE7i9CWIg0y8y6HLEP3N4xOkaAHV+PsbESnP30bj0JvX0HE5sYez
   A7LS405KYtSdKCLyK99tEcovXYVcbZm03h8oRJNutjXbF0y7jDT1TI+D/
   w==;
X-CSE-ConnectionGUID: 1XnbXKAARr6ZPJiHrmkCrg==
X-CSE-MsgGUID: JdwY9uCbTsiQu/6/sMIw5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="90908360"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="90908360"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 12:10:09 -0700
X-CSE-ConnectionGUID: AhQgDMt/QdqBysArdk5JEw==
X-CSE-MsgGUID: omL7kmDLTLKcn7Ct55Xm1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="269212724"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Aug 2026 12:10:05 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuaoU-00000000WHu-3ocs;
	Thu, 13 Aug 2026 19:10:02 +0000
Date: Fri, 14 Aug 2026 03:09:57 +0800
From: kernel test robot <lkp@intel.com>
To: Brandon Brnich <b-brnich@ti.com>, devarsht@ti.com, mchehab@kernel.org,
	hverkuil@kernel.org, benjamin.gaignard@collabora.com,
	sebastian.fricke@collabora.com
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, b-brnich@ti.com, k-willis@ti.com
Subject: Re: [PATCH] media: imagination: e5010: Enable autosuspend for
 runtime PM
Message-ID: <202608140323.qyc8mKlp-lkp@intel.com>
References: <20260722210845.723864-1-b-brnich@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722210845.723864-1-b-brnich@ti.com>

Hi Brandon,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linuxtv-media-pending/master]
[also build test WARNING on linus/master v7.2-rc7 next-20260812]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Brandon-Brnich/media-imagination-e5010-Enable-autosuspend-for-runtime-PM/20260813-213716
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20260722210845.723864-1-b-brnich%40ti.com
patch subject: [PATCH] media: imagination: e5010: Enable autosuspend for runtime PM
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260814/202608140323.qyc8mKlp-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608140323.qyc8mKlp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608140323.qyc8mKlp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/imagination/e5010-jpeg-enc.c:987:12: warning: 'e5010_init_device' defined but not used [-Wunused-function]
     987 | static int e5010_init_device(struct e5010_dev *e5010)
         |            ^~~~~~~~~~~~~~~~~


vim +/e5010_init_device +987 drivers/media/platform/imagination/e5010-jpeg-enc.c

a1e2940458853d Devarsh Thakkar 2024-06-19   986  
a1e2940458853d Devarsh Thakkar 2024-06-19  @987  static int e5010_init_device(struct e5010_dev *e5010)
a1e2940458853d Devarsh Thakkar 2024-06-19   988  {
a1e2940458853d Devarsh Thakkar 2024-06-19   989  	int ret = 0;
a1e2940458853d Devarsh Thakkar 2024-06-19   990  
a1e2940458853d Devarsh Thakkar 2024-06-19   991  	/*TODO: Set MMU in bypass mode until support for the same is added in driver*/
a1e2940458853d Devarsh Thakkar 2024-06-19   992  	e5010_hw_bypass_mmu(e5010->mmu_base, 1);
a1e2940458853d Devarsh Thakkar 2024-06-19   993  
a1e2940458853d Devarsh Thakkar 2024-06-19   994  	if (e5010_hw_enable_auto_clock_gating(e5010->core_base, 1))
a1e2940458853d Devarsh Thakkar 2024-06-19   995  		v4l2_warn(&e5010->v4l2_dev, "failed to enable auto clock gating\n");
a1e2940458853d Devarsh Thakkar 2024-06-19   996  
a1e2940458853d Devarsh Thakkar 2024-06-19   997  	if (e5010_hw_enable_manual_clock_gating(e5010->core_base, 0))
a1e2940458853d Devarsh Thakkar 2024-06-19   998  		v4l2_warn(&e5010->v4l2_dev, "failed to disable manual clock gating\n");
a1e2940458853d Devarsh Thakkar 2024-06-19   999  
a1e2940458853d Devarsh Thakkar 2024-06-19  1000  	if (e5010_hw_enable_crc_check(e5010->core_base, 0))
a1e2940458853d Devarsh Thakkar 2024-06-19  1001  		v4l2_warn(&e5010->v4l2_dev, "failed to disable CRC check\n");
a1e2940458853d Devarsh Thakkar 2024-06-19  1002  
a1e2940458853d Devarsh Thakkar 2024-06-19  1003  	if (e5010_hw_enable_output_address_error_irq(e5010->core_base, 1))
a1e2940458853d Devarsh Thakkar 2024-06-19  1004  		v4l2_err(&e5010->v4l2_dev, "failed to enable Output Address Error interrupts\n");
a1e2940458853d Devarsh Thakkar 2024-06-19  1005  
a1e2940458853d Devarsh Thakkar 2024-06-19  1006  	ret = e5010_hw_set_input_source_to_memory(e5010->core_base, 1);
a1e2940458853d Devarsh Thakkar 2024-06-19  1007  	if (ret) {
a1e2940458853d Devarsh Thakkar 2024-06-19  1008  		v4l2_err(&e5010->v4l2_dev, "failed to set input source to memory\n");
a1e2940458853d Devarsh Thakkar 2024-06-19  1009  		return ret;
a1e2940458853d Devarsh Thakkar 2024-06-19  1010  	}
a1e2940458853d Devarsh Thakkar 2024-06-19  1011  
a1e2940458853d Devarsh Thakkar 2024-06-19  1012  	ret = e5010_hw_enable_picture_done_irq(e5010->core_base, 1);
a1e2940458853d Devarsh Thakkar 2024-06-19  1013  	if (ret)
a1e2940458853d Devarsh Thakkar 2024-06-19  1014  		v4l2_err(&e5010->v4l2_dev, "failed to enable Picture Done interrupts\n");
a1e2940458853d Devarsh Thakkar 2024-06-19  1015  
a1e2940458853d Devarsh Thakkar 2024-06-19  1016  	return ret;
a1e2940458853d Devarsh Thakkar 2024-06-19  1017  }
a1e2940458853d Devarsh Thakkar 2024-06-19  1018  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
