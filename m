Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2389299959
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 02:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785293918; cv=none; b=Gs1MI86vVVmnbUNQhbh04wRN5l5JvrX3VFybXakP/OWAUJxg79SA+pRMVcXlqhEnTy+aljZi0+i6kEpQzk4s9bZmfe2fvWZKaKW4TdTGnq7FhmyJsFD3BOo4fgM6MYRfIR3sD5adtd98523sYLQTXchLN4pazg8M1lDYrYcZZzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785293918; c=relaxed/simple;
	bh=xkb4GIivScV4se/WyVXd1oVPUvnfwiUEQHw2c+NyjuM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RFplJry8CdgA7VnUNW1Y3aKI3pj/kRKJwtK4sFWW7IieLl5YRhmbKK0Wi0oFPFsZe0Ks1ekNg/3MwEeqmrYhKlxXDM2hkGIcyA5kdj7IRdf9/A1/HJVD8hGAMTYhfHSBJqMefoQZg/J3X2GP7LMYHSxqefMKmVVWtfQpHyeUGCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QmeQ+PAV; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QmeQ+PAV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785293916; x=1816829916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xkb4GIivScV4se/WyVXd1oVPUvnfwiUEQHw2c+NyjuM=;
  b=QmeQ+PAV+ZvBf+pLa4BLY/6ey9AO/20HPs+ywL/2BywuWF7rA2dQWbp9
   8gXWc3PAMGKgYUceeDXoMK23v28piB+2Sgvop50qk+ho3CPMBUwVVtOMx
   CAVpN5zJpGEZQf5CFlmWSi2DyIqXHb6EkJ4G5azsGQxjcomgnarOsRkBA
   rA7ox0qy3HvkzXJ3601EMohy/MmvfxHtcm3sorgdRtq7PvZ8i0peyqZOG
   OQiWryrWPViFtbHtE4B17xMyKlKwNuT9zvO/gPP8vmt0a4nAtT7fdWvXy
   0Zk+Sj2ZVV0BuEUsu+EdxbRe1siEMIN0ViunI2XPexzGKyGzj65eN3iw6
   A==;
X-CSE-ConnectionGUID: j959C7/xRHCMTuInB35XVg==
X-CSE-MsgGUID: AGRU8tFVRGKUL/u8Vx2/eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="84871445"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="84871445"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 19:58:35 -0700
X-CSE-ConnectionGUID: 66xOd0r7SLGUTEM3ZUdx0w==
X-CSE-MsgGUID: mRPfI18TSdCCzAB9TFvoyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="256544527"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 28 Jul 2026 19:58:33 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wouV4-00000000ezb-1POb;
	Wed, 29 Jul 2026 02:58:30 +0000
Date: Wed, 29 Jul 2026 10:58:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Niklas =?utf-8?Q?S=C3=B6derlund"?= <niklas.soderlund+renesas@ragnatech.se>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: [sailus-media-tree:v4l2-isp 20/25]
 drivers/media/platform/dreamchip/rppx1/rppx1_hist.c:158:26: error: implicit
 declaration of function 'FIELD_PREP'
Message-ID: <202607291018.jk0mic6Q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   git://linuxtv.org/sailus/media_tree.git v4l2-isp
head:   7abfe3e3b2e2ecba8132ae60033d4ea1238c1f1e
commit: fbc6568564c45d128e03e578c53b7e12f03214f0 [20/25] media: rppx1: hist: Add support histogram measurement
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260729/202607291018.jk0mic6Q-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260729/202607291018.jk0mic6Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607291018.jk0mic6Q-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/dreamchip/rppx1/rppx1_hist.c: In function 'rppx1_hist_fill_params':
>> drivers/media/platform/dreamchip/rppx1/rppx1_hist.c:158:26: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     158 |         u32 sample_reg = FIELD_PREP(HIST_SAMPLE_RANGE_SAMPLE_SHIFT_MASK,
         |                          ^~~~~~~~~~


vim +/FIELD_PREP +158 drivers/media/platform/dreamchip/rppx1/rppx1_hist.c

    76	
    77	#define RPPX1_HIST_WEIGHT(v0, v1, v2, v3) \
    78		(((v0) & 0x1f) | (((v1) & 0x1f) << 8)  | \
    79		(((v2) & 0x1f) << 16) | \
    80		(((v3) & 0x1f) << 24))
    81	
    82	static int rppx1_hist_fill_params(struct rpp_module *mod,
    83					  const union rppx1_params_block *block,
    84					  rppx1_reg_write write, void *priv)
    85	{
    86		const struct rppx1_hist_params *cfg = &block->hist;
    87		u32 h_offs, v_offs, h_size, v_size;
    88	
    89		/* If the modules is disabled, simply bypass it. */
    90		if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
    91			write(priv, mod->base + HIST_MODE_REG,
    92			      HIST_MODE_HIST_MODE_DISABLE);
    93			return 0;
    94		}
    95	
    96		/* Select sample point */
    97		write(priv, mod->base + HIST_CHANNEL_SEL_REG,
    98		      cfg->channel_sel & HIST_CHANNEL_SEL_CHANNEL_SELECT_MASK);
    99	
   100		/*
   101		 * Configure the input subsampling.
   102		 *
   103		 * In Bayer mode the vertical and horizontal subsampling counters are
   104		 * only incremented for color channels selected by hist_mode.
   105		 */
   106		write(priv, mod->base + HIST_SUBSAMPLING_REG,
   107		      HIST_SUBSAMPLING_V_STEPSIZE(cfg->v_stepsize) |
   108		      HIST_SUBSAMPLING_H_STEP_INC(cfg->h_step_inc));
   109	
   110		/*
   111		 * Adjust and set measurement window to hardware limitations,
   112		 * - Offsets must be even.
   113		 * - Width and height must be even and divisible in 5 windows.
   114		 */
   115		h_offs = cfg->wnd.h_offs & 0x1ffe;
   116		v_offs = cfg->wnd.v_offs & 0x1ffe;
   117		h_size = cfg->wnd.h_size - cfg->wnd.h_size % 10;
   118		v_size = cfg->wnd.v_size - cfg->wnd.v_size % 10;
   119	
   120		write(priv, mod->base + HIST_H_OFFS_REG, h_offs);
   121		write(priv, mod->base + HIST_V_OFFS_REG, v_offs);
   122		write(priv, mod->base + HIST_H_SIZE_REG, h_size / 5);
   123		write(priv, mod->base + HIST_V_SIZE_REG, v_size / 5);
   124	
   125		/*
   126		 * Set last measurement line for ready interrupt. Ignore the value
   127		 * from the parameters as it is only useful for fast-channel switching.
   128		 */
   129		write(priv, mod->base + HIST_LAST_MEAS_LINE_REG, v_offs + v_size + 1);
   130	
   131		/* Set measurement window weights. */
   132		write(priv, mod->base + HIST_WEIGHT_00TO30_REG,
   133		      RPPX1_HIST_WEIGHT(cfg->weights[0], cfg->weights[1],
   134					cfg->weights[2], cfg->weights[3]));
   135		write(priv, mod->base + HIST_WEIGHT_40TO21_REG,
   136		      RPPX1_HIST_WEIGHT(cfg->weights[4], cfg->weights[5],
   137					cfg->weights[6], cfg->weights[7]));
   138		write(priv, mod->base + HIST_WEIGHT_31TO12_REG,
   139		      RPPX1_HIST_WEIGHT(cfg->weights[8], cfg->weights[9],
   140					cfg->weights[10], cfg->weights[11]));
   141		write(priv, mod->base + HIST_WEIGHT_22TO03_REG,
   142		      RPPX1_HIST_WEIGHT(cfg->weights[12], cfg->weights[13],
   143					cfg->weights[14], cfg->weights[15]));
   144		write(priv, mod->base + HIST_WEIGHT_13TO43_REG,
   145		      RPPX1_HIST_WEIGHT(cfg->weights[16], cfg->weights[17],
   146					cfg->weights[18], cfg->weights[19]));
   147		write(priv, mod->base + HIST_WEIGHT_04TO34_REG,
   148		      RPPX1_HIST_WEIGHT(cfg->weights[20], cfg->weights[21],
   149					cfg->weights[22], cfg->weights[23]));
   150		write(priv, mod->base + HIST_WEIGHT_44_REG,
   151		      RPPX1_HIST_WEIGHT(cfg->weights[24], 0, 0, 0));
   152	
   153		write(priv, mod->base + HIST_MODE_REG, cfg->mode);
   154		write(priv, mod->base + HIST_COEFF_R_REG, cfg->coeff[0]);
   155		write(priv, mod->base + HIST_COEFF_G_REG, cfg->coeff[1]);
   156		write(priv, mod->base + HIST_COEFF_B_REG, cfg->coeff[2]);
   157	
 > 158		u32 sample_reg = FIELD_PREP(HIST_SAMPLE_RANGE_SAMPLE_SHIFT_MASK,
   159					    cfg->sample_shift) |
   160				 FIELD_PREP(HIST_SAMPLE_RANGE_SAMPLE_OFFSET_MASK,
   161					    cfg->sample_offs);
   162		write(priv, mod->base + HIST_SAMPLE_RANGE_REG, sample_reg);
   163	
   164		write(priv, mod->base + HIST_FORCED_UPDATE_REG, 1);
   165	
   166		return 0;
   167	}
   168	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
