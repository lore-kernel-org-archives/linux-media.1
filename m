Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7D33B992A;
	Mon,  3 Aug 2026 09:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785747987; cv=none; b=oobWv48nB1/JdyKWBpf0UA7vNv8nYmXEVswsP+ZG7xaQysP+ItX5Lwaz/SQ5ds3KbDzpk2dVZWlDAhLmh9rcLLPKiPrzGJwF7tUA+lm5K+XLeEKrv/kWkkJpPI9Eed/VxkL1tNC1eMXmDFH8n0OF423F2Fc4zpfFB4+oMci+9P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785747987; c=relaxed/simple;
	bh=5r34M1HHBdLNcPvzBryAdGoZIZUgWkfLIrG031AonBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CFRT/QFnC0oevjkrBDEd1VnYcnTSe7Lk1z5sa7ft994e6iiipe/vu7C/t9McMZUtWQY+jSXLqhBVLWB2curFuHAw/vy5W/x4JmrWes6wnYp8YN2B2PH/41GpZDVkm6/zkWqEKN6z1WlnLP6K+21n4RPj4bIT4TAIh3sWbzSaN10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=anJoxh47; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="anJoxh47"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785747984; x=1817283984;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5r34M1HHBdLNcPvzBryAdGoZIZUgWkfLIrG031AonBo=;
  b=anJoxh47vGCUd2RroYGejbrkw2jCqf2noF06oWIvyRQ6+kSTldwQmwgX
   jCw1AZhNq00YJTPM2M1R8ig9EsA41++GPdbOhXjG6V+aD/NK/4VynaUtI
   iombpDb9h+vAWID0gSMeZv/n+KyezOJZAO5Ik6QSfVk2LO0njvpauU1p3
   1iO6S1xYJ88ZqT9C6TGXGgVpG5vNDsqDv1++1ifX8CtxvEjipIMhRam/H
   FyTWWTx4Hqbq7FR74jrpPCMblpTbfdCgL0m//Ck3r2+19Ld7Y+BHLZCzr
   BGXXEjAUyHtka8N14zYiE/pbR2ac66cufbloczJXkYvO42JYS059itOzz
   Q==;
X-CSE-ConnectionGUID: r7BapTGqRvKXzwgdUujmoQ==
X-CSE-MsgGUID: +NjmsLY8QcevpMolakIRkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="89957988"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="89957988"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 02:06:24 -0700
X-CSE-ConnectionGUID: HcefI9CnSy2NxCgotPKkRg==
X-CSE-MsgGUID: WdfcalN0TOm7U5TS4Q+O/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="266281795"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Aug 2026 02:06:20 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqocj-000000006Zh-2RBr;
	Mon, 03 Aug 2026 09:06:17 +0000
Date: Mon, 3 Aug 2026 17:05:33 +0800
From: kernel test robot <lkp@intel.com>
To: Guangshuo Li <lgs201920130244@gmail.com>,
	Bin Liu <bin.liu@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Fan Wu <fanwu01@zju.edu.cn>, Hans Verkuil <hverkuil@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Guangshuo Li <lgs201920130244@gmail.com>
Subject: Re: [PATCH] media: mtk-jpeg: drain hardware completion before
 freeing context
Message-ID: <202608031631.Ha5cORQG-lkp@intel.com>
References: <20260708120833.755998-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708120833.755998-1-lgs201920130244@gmail.com>

Hi Guangshuo,

kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-pending/master]
[also build test ERROR on media-tree/master linus/master v7.2-rc5 next-20260731]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guangshuo-Li/media-mtk-jpeg-drain-hardware-completion-before-freeing-context/20260803-143440
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20260708120833.755998-1-lgs201920130244%40gmail.com
patch subject: [PATCH] media: mtk-jpeg: drain hardware completion before freeing context
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260803/202608031631.Ha5cORQG-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260803/202608031631.Ha5cORQG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608031631.Ha5cORQG-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c: In function 'mtk_jpeg_release':
>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:1207:17: error: implicit declaration of function 'mtk_jpeg_release_hw'; did you mean 'mtk_jpeg_release'? [-Wimplicit-function-declaration]
    1207 |                 mtk_jpeg_release_hw(jpeg, ctx);
         |                 ^~~~~~~~~~~~~~~~~~~
         |                 mtk_jpeg_release


vim +1207 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c

  1199	
  1200	static int mtk_jpeg_release(struct file *file)
  1201	{
  1202		struct mtk_jpeg_dev *jpeg = video_drvdata(file);
  1203		struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
  1204	
  1205		if (jpeg->variant->jpeg_worker) {
  1206			cancel_work_sync(&ctx->jpeg_work);
> 1207			mtk_jpeg_release_hw(jpeg, ctx);
  1208		}
  1209	
  1210		mutex_lock(&jpeg->lock);
  1211		v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
  1212		v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
  1213		v4l2_fh_del(&ctx->fh, file);
  1214		v4l2_fh_exit(&ctx->fh);
  1215		kfree(ctx);
  1216		mutex_unlock(&jpeg->lock);
  1217		return 0;
  1218	}
  1219	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
