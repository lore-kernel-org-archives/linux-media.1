Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABF633263E;
	Tue, 19 May 2026 18:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779214308; cv=none; b=VLGYs1lHU3B+Vx8a0ECEAfGBVLCsZzSq5nUwY2T1HlwnmWIlewc53G73MbJaahwh4zvTwCq7AubS9jnszXML9vh0EiGkKxH+CzxoD5pAxUgMBiFqdST+zVYPqC5BrAe66/WVuFDgtAMzn3w+Ul6LFG/1FtcVvr+hcdtigBoSvg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779214308; c=relaxed/simple;
	bh=jpOj3VYuGBvOov2Qvryovn/ZZ7UxJGuvoEYFpLfiIKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gTPVnwdCne2ggvNi8LdyFrxDq2c5jzaNiLORH9upOtrA12qo+cREPlL/UBsnhM6O6kNYiBY94gQkgFar5SxSbU35aelS1w5QUydmPGuhUPQpvfpY2bHf6cTMjACsfwtuTNqiXxTG7Ndy0057EMjjnm8tFQjy7lOwCrBmnh81yjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZnUrhGqQ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZnUrhGqQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779214303; x=1810750303;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jpOj3VYuGBvOov2Qvryovn/ZZ7UxJGuvoEYFpLfiIKo=;
  b=ZnUrhGqQ0mld4YAwkiRioul9J32E8i7Fry7qnJyfqwQ+9gy7wCLmJnqY
   L3EBqrWsFPv2cWeHGAOdIoLAMlxE/kErsclZRl9/CKXVvrqPZkfbyS8DS
   JXSHycYQitYVDZTwkPTVPKJCKXiES+P7+aXRWSVzYmy6sWxWjpvLmlGca
   RHJLaKHBNVHEE2IkNxL9tTimKslLekJx+lxsH7GwowCQWIfs7i1rmn2jY
   1ltB1WC5UBmWTZj5ETTKOx5pKzF/5B5QeJZuWRou5hOrq0zFggCmcO8MM
   JERqmxxQ2C9Vs69GpDQX8zq7ndpyl6CgBTLleAzHkcECTKI936zdn0apd
   A==;
X-CSE-ConnectionGUID: fATWvinOT2KTE0UhkYschQ==
X-CSE-MsgGUID: W8DPG3gMSaGC9BY9sy882Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="83984088"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="83984088"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 11:11:38 -0700
X-CSE-ConnectionGUID: 9rmPTksPSKqN6fRTf1zO1Q==
X-CSE-MsgGUID: x82uGznVRuiaDWPK9WAsnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="239904676"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 19 May 2026 11:11:37 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPOtw-000000001e5-1qsT;
	Tue, 19 May 2026 18:11:00 +0000
Date: Wed, 20 May 2026 02:08:20 +0800
From: kernel test robot <lkp@intel.com>
To: shravan kumar <shravan.chippa@microchip.com>,
	sakari.ailus@linux.intel.com, mchehab@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, conor.dooley@microchip.com,
	valentina.fernandezalanis@microchip.com,
	praveen.kumar@microchip.com, shravan.chippa@microchip.com
Subject: Re: [PATCH] media: i2c: imx334: add new link frequency configuration
Message-ID: <202605200257.113Ddqne-lkp@intel.com>
References: <20260519104129.2001018-1-shravan.chippa@microchip.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519104129.2001018-1-shravan.chippa@microchip.com>

Hi shravan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on sailus-media-tree/master]
[also build test WARNING on linuxtv-media-pending/master media-tree/master linus/master v7.1-rc4 next-20260518]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/shravan-kumar/media-i2c-imx334-add-new-link-frequency-configuration/20260519-191302
base:   git://linuxtv.org/sailus/media_tree.git master
patch link:    https://lore.kernel.org/r/20260519104129.2001018-1-shravan.chippa%40microchip.com
patch subject: [PATCH] media: i2c: imx334: add new link frequency configuration
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260520/202605200257.113Ddqne-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605200257.113Ddqne-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605200257.113Ddqne-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/media/i2c/imx334.c:216 struct member 'new_supported_modes' not described in 'imx334'
>> Warning: drivers/media/i2c/imx334.c:216 struct member 'new_modes_size' not described in 'imx334'
>> Warning: drivers/media/i2c/imx334.c:216 struct member 'new_supported_modes' not described in 'imx334'
>> Warning: drivers/media/i2c/imx334.c:216 struct member 'new_modes_size' not described in 'imx334'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
