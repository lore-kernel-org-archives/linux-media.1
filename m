Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795063171;
	b=zD0UAT8rhkn+vPZ9kToRnm8ZnrvgPcb0UsxcwE6qdildaoH3u4lwWxSgax+cLQ7m+q4q
	 5w+3ptMzeyF1tC/JS+1kIKZ0SALTsbujVlBXi/Qo2oTPFjCSJOFeZQW6venScSp0by9hT
	 W/84v0d4i/6U/VOnPz9Gt/Xd2lFIoLSQsq++RtRCwus46EMyky7TE1I3+JykS2Do2BQ5P
	 2kq3TTIWQaNSjmzge0XFuxvAVtibyFXlGWMoT4oILLqh9dOOVZXr/j9ucqFJvaAQdk+dF
	 l+HKaK7hCW8vQpCweDVlg6zRzyPu5rOOUWWT3EdrT07TO2PFQ86AbVmLrg/cxRIWBSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795063171;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=HGoYUoEJLo2pINrnesL8crVvN61TGPT9mU4EfzF0THk=;
	b=r8Z5e0/mQETkJJnPNiAjg08WsOoCb9Hd/s+blvigOBsEnV8yM0IVqm3l7+NzoWLxN9uG
	 83Y+oXJoQruleyhXcscaix8czZeDRMYBOMNxX7/C2YYt7nYnA5Np+IrElUW08Y7vKRZK1
	 n5G58xNfo1wvQNgcPreBRj5+nyUIjfY9Bt/T+EifPl7fhnfhhJKCukOsYimbISsLjJvSb
	 nNneHDpiRy7ovy3kzEltb9A+j4BzLTDtDVS1hA5CoR9ljh80RtMJH7FbS5D65Z08fMupt
	 8MAK9yBdtkygRXwMW9TI18UofUZtjPUoa4GPTmpNY+mQfyLkf8W57T3YzeRJrDgiBuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YUHt80YU;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E197606A325;
	Thu, 19 Nov 2026 04:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E197606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YUHt80YU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795063171; x=1826599171;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VBCEgYy/crUpata0T6Lh38Ywa1dQP48mANWtNkE9c5A=;
  b=YUHt80YUWRyTPdFptMKz7Ga8RFpYaTP5x/wP5mu2YPbui7H1V7L63gtb
   K2jIOvm+uimgGQzr54XReyGT1z7egqwKbzG7dmj1AFC3P01Boe5SQGutR
   cf02v7OuZzT44Ee2QXFAJW48T/6KMj1/+K7wY1izAxfk9C4OYjeUaV0hM
   P7lgypLaj3nUHxM6AGAGiVwgqTuwloJUqggQ3enXAKr6poqs7ImkBKLV6
   cqXsxLocQdGQzKfBi41KoKlmA+UgmB5F+2zfMJWwFmUreBNVj09Y37RfQ
   lnudbqlOlsU4ozz4IXfWE9C94QrFY3RiO3vKzXsv0XAkHBhUZWxH+YVo6
   w==;
X-CSE-ConnectionGUID: BlSlmOn1SdunM5A5eDeTtA==
X-CSE-MsgGUID: x7HlgWVFTh+N9Ov/Mm/wHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3794303"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3794303"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 20:39:30 -0800
X-CSE-ConnectionGUID: vYsccUheT8694vW4J44aRg==
X-CSE-MsgGUID: 46E1PlnTQwmWvXMi7zO6cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10324470"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Nov 2026 20:39:28 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTtvg-00000001F1a-3Cyw;
	Thu, 19 Nov 2026 04:39:24 +0000
Date: Thu, 19 Nov 2026 12:39:16 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Simek <monstr@monstr.eu>, linux-kernel@vger.kernel.org,
	michal.simek@amd.com, git@amd.com
Cc: oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] media: xilinx: vip: Make use of the
 devm_clk_get_enabled()
Message-ID: <202611191243.pxt5RLKL-lkp@intel.com>
References: <abfe9f93f9f93d256b0d60d081e6111d7169c08f.1794994290.git.michal.simek@amd.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abfe9f93f9f93d256b0d60d081e6111d7169c08f.1794994290.git.michal.simek@amd.com>

Hi Michal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v7.4-rc3]
[also build test WARNING on linus/master next-20261116]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Michal-Simek/media-xilinx-vip-Make-use-of-the-devm_clk_get_enabled/20261118-103132
base:   v7.4-rc3
patch link:    https://lore.kernel.org/r/abfe9f93f9f93d256b0d60d081e6111d7169c08f.1794994290.git.michal.simek%40amd.com
patch subject: [PATCH] media: xilinx: vip: Make use of the devm_clk_get_enabled()
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20261119/202611191243.pxt5RLKL-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/202611191243.pxt5RLKL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611191243.pxt5RLKL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/xilinx/xilinx-vip.c: In function 'xvip_init_resources':
   drivers/media/platform/xilinx/xilinx-vip.c:215:21: error: implicit declaration of function 'devm_clk_get_enable'; did you mean 'devm_clk_get_enabled'? [-Werror=implicit-function-declaration]
     215 |         xvip->clk = devm_clk_get_enable(xvip->dev, NULL);
         |                     ^~~~~~~~~~~~~~~~~~~
         |                     devm_clk_get_enabled
>> drivers/media/platform/xilinx/xilinx-vip.c:215:19: warning: assignment to 'struct clk *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     215 |         xvip->clk = devm_clk_get_enable(xvip->dev, NULL);
         |                   ^
   cc1: some warnings being treated as errors


vim +215 drivers/media/platform/xilinx/xilinx-vip.c

   206	
   207	int xvip_init_resources(struct xvip_device *xvip)
   208	{
   209		struct platform_device *pdev = to_platform_device(xvip->dev);
   210	
   211		xvip->iomem = devm_platform_ioremap_resource(pdev, 0);
   212		if (IS_ERR(xvip->iomem))
   213			return PTR_ERR(xvip->iomem);
   214	
 > 215		xvip->clk = devm_clk_get_enable(xvip->dev, NULL);
   216		if (IS_ERR(xvip->clk))
   217			return PTR_ERR(xvip->clk);
   218	
   219		return 0;
   220	}
   221	EXPORT_SYMBOL_GPL(xvip_init_resources);
   222	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
