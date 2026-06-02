Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4863B9617
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 17:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780421275; cv=none; b=iq9GCKU0axjbx0YjrwlXMYIeL+/qyE45yBoX1LlpN58l3+cpyw4yEV2zI8gmahkIf9yloyMY4n7asUnGQbGArfPZ6dRhIhLeZVf0vkD9ELDXaMSBIWftBd/Jk+2/vHr9O7/Nxz78cxr0/K5lstc2K6LAcyQqFWebSQJyuRsKRB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780421275; c=relaxed/simple;
	bh=CU0FpcNon3McemiE3Pz5bZaptj2WcohXdN36NuMz1AE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uVI4wbZjGlHSyvkJu+vF/TY6T5hjskUACkD0UXCcl4pvRis/nsYvXLj8MS+pIWWGEncwrh35YLQEuob/nUR9gNT8ooNIIEI4fNuVcf+EUMGQGCai7UdoKImcaocUZCH74cQJZQ9lcpVFaYrpzPniwOQz6/Sg3gs2T35vOi+hXm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LM9dBpsw; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LM9dBpsw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780421273; x=1811957273;
  h=date:from:to:cc:subject:message-id;
  bh=CU0FpcNon3McemiE3Pz5bZaptj2WcohXdN36NuMz1AE=;
  b=LM9dBpswa+28sK3HSV1Y4ljDxEQ3Oo91X9UTH+AQFeRu5ecokxCwGb21
   DLgEYclUW9bqoy4pQulHy9/tdq4I6qbT+ol3kxpHn7Jq4lmnLHSbbDh7N
   1/y6NDZqoy/tLfYfUb3kpWRTsyGG0EKPfYryhUV1HQD/LOraiHXR46EKn
   9yp5qu8UF0EZg/LPuVft30HVB/s46DosguevR67NYHEeP00SkSWNQCe1J
   QIg/r7nDgUdQ56ow+6LM4q56X/2aYQQE+sCOIBfYPOCnJey1J33KT4BIE
   kfqME+Lsq08M3KQIwtyZ7a/zY11kMuduNZxRTbkJ/n3wk/m7O2Z2Exruo
   w==;
X-CSE-ConnectionGUID: g2LN8QM2RzujPHlvhuaspw==
X-CSE-MsgGUID: gKwjo1XKT264O0HpOKOGIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81076082"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="81076082"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 10:27:52 -0700
X-CSE-ConnectionGUID: H22nHQe6Tr6lTkRWm81CZA==
X-CSE-MsgGUID: DZlJp6kSSzyU8dn0BDIbxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="241481364"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Jun 2026 10:27:51 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUSu4-00000000CME-1frC;
	Tue, 02 Jun 2026 17:27:48 +0000
Date: Wed, 03 Jun 2026 01:27:38 +0800
From: kernel test robot <lkp@intel.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
 "Bryan O'Donoghue" <bod@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: [linuxtv-media-pending:next 19/29] ERROR: modpost:
 "__umoddi3" [drivers/media/platform/qcom/iris/qcom-iris.ko] undefined!
Message-ID: <202606030132.qnBXVDkM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree:   https://git.linuxtv.org/media-ci/media-pending.git next
head:   6a75e3d4f6428b90f398354212e3a2e0172851d6
commit: 5c66647a5c3e005f9b6a96fe4aa7ec82d2701b4f [19/29] media: iris: add FPS calculation and VPP FW overhead in frequency formula
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20260603/202606030132.qnBXVDkM-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260603/202606030132.qnBXVDkM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606030132.qnBXVDkM-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0x14 (section: .data) -> ice_adv_lnk_speed_100 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0x30 (section: .data) -> ice_adv_lnk_speed_1000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0x4c (section: .data) -> ice_adv_lnk_speed_2500 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0x68 (section: .data) -> ice_adv_lnk_speed_5000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0x84 (section: .data) -> ice_adv_lnk_speed_10000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0xa0 (section: .data) -> ice_adv_lnk_speed_25000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0xbc (section: .data) -> ice_adv_lnk_speed_40000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0xd8 (section: .data) -> ice_adv_lnk_speed_50000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0xf4 (section: .data) -> ice_adv_lnk_speed_100000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0x110 (section: .data) -> ice_adv_lnk_speed_200000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_ext_maps+0x14 (section: .data) -> qed_mfw_ext_1g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_ext_maps+0x30 (section: .data) -> qed_mfw_ext_10g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_ext_maps+0x4c (section: .data) -> qed_mfw_ext_25g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_ext_maps+0x68 (section: .data) -> qed_mfw_ext_40g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_ext_maps+0x84 (section: .data) -> qed_mfw_ext_50g_base_r (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_ext_maps+0xa0 (section: .data) -> qed_mfw_ext_50g_base_r2 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_ext_maps+0xbc (section: .data) -> qed_mfw_ext_100g_base_r2 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_ext_maps+0xd8 (section: .data) -> qed_mfw_ext_100g_base_r4 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_legacy_maps+0x14 (section: .data) -> qed_mfw_legacy_1g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_legacy_maps+0x30 (section: .data) -> qed_mfw_legacy_10g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_legacy_maps+0x4c (section: .data) -> qed_mfw_legacy_20g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_legacy_maps+0x68 (section: .data) -> qed_mfw_legacy_25g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_legacy_maps+0x84 (section: .data) -> qed_mfw_legacy_40g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_legacy_maps+0xa0 (section: .data) -> qed_mfw_legacy_50g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_legacy_maps+0xbc (section: .data) -> qed_mfw_legacy_bb_100g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede: section mismatch in reference: qede_forced_speed_maps+0x14 (section: .data) -> qede_forced_speed_1000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede: section mismatch in reference: qede_forced_speed_maps+0x30 (section: .data) -> qede_forced_speed_10000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede: section mismatch in reference: qede_forced_speed_maps+0x4c (section: .data) -> qede_forced_speed_20000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede: section mismatch in reference: qede_forced_speed_maps+0x68 (section: .data) -> qede_forced_speed_25000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede: section mismatch in reference: qede_forced_speed_maps+0x84 (section: .data) -> qede_forced_speed_40000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede: section mismatch in reference: qede_forced_speed_maps+0xa0 (section: .data) -> qede_forced_speed_50000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede: section mismatch in reference: qede_forced_speed_maps+0xbc (section: .data) -> qede_forced_speed_100000 (section: .init.rodata)
>> ERROR: modpost: "__umoddi3" [drivers/media/platform/qcom/iris/qcom-iris.ko] undefined!
>> ERROR: modpost: "__udivdi3" [drivers/media/platform/qcom/iris/qcom-iris.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
