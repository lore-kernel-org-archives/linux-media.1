Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794224822;
	b=MaRgD3htE8oIAeZIpTVETyHhTkIJbOogVSm1RiG+qMSdPITShyYd4itl1n24piXa/Lzq
	 ivqqZwnD6gDiypOOtn//+CoRb6f7BLoyCsH1fm7awxF3Ur7IXh3R5w00sZzT5KtjLc5w7
	 2swdYOE4JNDMbW66z6qI5k0ptAT3DYFOxWL+IxeC63eHltmLszkRpuHZ87TvfxS3moXXs
	 9AllU3k+daBhe44HK5SklB8Ixzl+KIzLoBttABIZuHsSEe/4/AKZk/C/hEOiCo43ZbV5t
	 4888Yc5saIWM6lj8O3fQIzsLzHAgfVtven8mEpCfk+XOC1mWK8yeBwE27Ja2cWx8v7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794224822;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=y63kdnd7evsFLFYwXbJ7wftE0OUmJITgzNwtHyiWHkM=;
	b=h42nwJaos1iVn+Gsf/hPQ97UUcXlZw/+nj1tYGmfEzxrxiBlqFnxLeR1+Jw/+qe1ZQSu
	 cIOT/zNvDMKqaM/hhSlTmUFt1IOJYBg4Rn4vtqKZLvZ3rzLTT+wyV4vJF6L1PCzTlrfRT
	 g6rLlBFTP0ftbQldhx/4O8zngJTvqAPjN6vCwxBiuVfw1qZZHvLLNoKOb7Cs56jsabu8k
	 z+DvIVaR/gbrVXU71kpCITuf4PJgqbofSG+kd1IP/+M/NuH43ezgY5nznKSjTvr7tcnPF
	 tUwQyvbADyCs6PRHidzrR5Ct5Apgdu0In8U/L3Tfx3qr5u25GVwclOwEYetL0+6Vj4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K584xvzH;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CA4606A322
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 11:47:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9CA4606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K584xvzH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794224822; x=1825760822;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=heIQ/4MpJOo2wkUvzYqJz3S9WX6VmGV2lXaoxnb2aJA=;
  b=K584xvzHokQLFo1vSbc0LZlJuHC+ogssHrfhpj2N/+ivez/HjQUzTC74
   qyttKckc3yHre2rE1FR8+G8PLdkm6IvvobRtgoOD0Yr//Xc6ftnGcNmFR
   Dt7fuKKLc7Ak7c1XvMgKZ3/BwveuyyflX5Cvp/78Vhs+myhASrQubE0wZ
   hj8X0WYqGm4VwSZUEzWk1ihOyMCswIa2C+0tHDXZA16H8P4Qldg+LpCd5
   YnKkeFuSjCh8xDOhZAZtNG+7XPTTxdci4V8cZZbLgFf44Y3FgrfbUQQS9
   uqxzdD+FAE8jVLIuWQPu2OcEQP62B5xhmCvd9mdB5VPhdnlqEAymXZv8/
   g==;
X-CSE-ConnectionGUID: EuVodZR7TwSwvbvIphUnqg==
X-CSE-MsgGUID: 730J/UQmSca5ESku4gWJzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2933635"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2933635"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 03:47:01 -0800
X-CSE-ConnectionGUID: PCnAgCmwQkaTKfheyeNMcQ==
X-CSE-MsgGUID: yeQ01YcwTby2f8GN/c0+nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="9622698"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.119])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 03:47:01 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A515F121B96;
	Mon, 09 Nov 2026 13:46:57 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xQNpx-000000000af-1WYC;
	Mon, 09 Nov 2026 13:46:57 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: antti.laakso@linux.intel.com,
	hans@jjverkuil.nl
Subject: [PATCH 1/1] MAINTAINERS: ipu6: Change Antti's R: line to M:
Date: Mon,  9 Nov 2026 13:46:57 +0200
Message-ID: <20261109114657.2262-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make Antti a maintainer of the IPU6 driver.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..e13bca12b6ff 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13541,7 +13541,7 @@ F:	drivers/staging/media/ipu3/
 
 INTEL IPU6 INPUT SYSTEM DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
-R:	Antti Laakso <antti.laakso@linux.intel.com>
+M:	Antti Laakso <antti.laakso@linux.intel.com>
 R:	"Sapre, Sarang" <sarang.sapre@intel.com>
 R:	Divyamani Tripathi <divyamani.tripathi@intel.com>
 R:	Manik Bajpai <manik.bajpai@intel.com>

-- 
2.47.3

