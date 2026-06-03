Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E37D397E66
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 02:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780452532; cv=none; b=sgCbzTSqh55jWulXayUmOyN7GxDzYwWJ5LsCajzeVbzqMpY7Xw9F5Eju3NwsB4iDMxWsLd6Cn8ePRbgdLLtDG0K7gJaQUDTqUqOL88yubEO15NeGJHU7fyPYoidlBM/VXMKuFDp972AmpP1p4Ud+Ii3XUtrf1Blt9qI5fJpC2i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780452532; c=relaxed/simple;
	bh=JS+C/a5geZU/HlaU/hRc8rUAHIUmAMU+BdJLsxYohdg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pJWoftSf4qJalqO7tD+D635Nkq87on2DcL+ffXGmyaBmBxjqKiU9uci2Y7AGbC68BhhGM9OVpdS5LoJkDXBZ+t7Yydh2DBIt+PWv95v8AdNoS/Fx4/18Xncc7+3m2Ga4JijIKsQfTbUHyXOQXqP8aNkGPz11L0wgRhjosjQGJ68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JuYtrMVs; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JuYtrMVs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780452529; x=1811988529;
  h=date:from:to:cc:subject:message-id;
  bh=JS+C/a5geZU/HlaU/hRc8rUAHIUmAMU+BdJLsxYohdg=;
  b=JuYtrMVs6f1LcJhd4PekakBENO1a+wRNtJDxvbYAJMBPBveX3pcRhkwA
   nxyTDVQHZzd0+p8HHyu2aOCt20o0wIKL0yLtvthVhurpQL4trMtjE9fGK
   O32SBiAr6T2OAeqQyzDovVUIGwXrz4uR3mIcPzH4MfHXUZJacQq+DnCQj
   bUnEXFUlf4Z7bVN6Rc1bp6sk5PRTqf0RMtuTKWfUCxXHxFy/+lPz615SN
   S1WqIvkEezIB9LsO1n5LDkcYdZpofnPHjSB/PjTxvZPozrL1K5PPQVWnF
   HyWJf/ANylbpAnQ1slrzK/yo/yfWhuSFrdZaYnw3F/Jq4sAVkZyPl6Il1
   g==;
X-CSE-ConnectionGUID: wugPUhu6Toao3Nkq7np29A==
X-CSE-MsgGUID: fH6uJfMjTzik1c67XLWFOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="98815829"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="98815829"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 19:08:49 -0700
X-CSE-ConnectionGUID: P1UjHB5+Ri+JfsnUemW2oA==
X-CSE-MsgGUID: 3WJkPTRgQuWUT0iW4gHQ7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="239624740"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 Jun 2026 19:08:47 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUb2C-00000000CoQ-13P5;
	Wed, 03 Jun 2026 02:08:44 +0000
Date: Wed, 03 Jun 2026 10:07:52 +0800
From: kernel test robot <lkp@intel.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
 "Bryan O'Donoghue" <bod@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: [linuxtv-media-pending:next 19/36] undefined reference to
 `__umoddi3'
Message-ID: <202606030954.hheGuePz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree:   https://git.linuxtv.org/media-ci/media-pending.git next
head:   65c06d2edded3b1e1633bf75f0f7a26b609ed5ac
commit: 5c66647a5c3e005f9b6a96fe4aa7ec82d2701b4f [19/36] media: iris: add FPS calculation and VPP FW overhead in frequency formula
config: microblaze-allyesconfig (https://download.01.org/0day-ci/archive/20260603/202606030954.hheGuePz-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260603/202606030954.hheGuePz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606030954.hheGuePz-lkp@intel.com/

Note: the linuxtv-media-pending/next HEAD 65c06d2edded3b1e1633bf75f0f7a26b609ed5ac builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   microblaze-linux-ld: drivers/media/platform/qcom/iris/iris_vpu_common.o: in function `iris_vpu3x_vpu4x_calculate_frequency':
>> (.text+0x1890): undefined reference to `__umoddi3'
   microblaze-linux-ld: (.text+0x1950): undefined reference to `__udivdi3'
   microblaze-linux-ld: (.text+0x1970): undefined reference to `__udivdi3'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
