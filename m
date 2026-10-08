Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273F5470EB9
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 08:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791449732; cv=none; b=cFoB5ndIJ3NlcLc9EnnsnNF5S/Q0OD5ijHLmopNdmOC8i5wFWRVL77B4wpJkdVIFTr4/rrpDsRFYhCQgyz++BW/nNfXQUUp5R1ONIZAky2wv0/aoXq5oo/xdfufRIrRR48xaMd15X72fMJHG+pkjk/cxffFh1Dw/3rLM2DB8fXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791449732; c=relaxed/simple;
	bh=ESqsuzC7a73uUZb5bYtgDrpASwvUtsqEoK9o2ZaH1J0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UlCeezTyFFfZJX2KcVm2+3X4qij4f8L8Zuvv2m6vUnq0PUxfFEW0HAeevlKuevVJpoUVIOWO2Cd6EwmCLHMYuM3zyrkWTw0SpfIz4fCktzpieAN2qhQ1WHUh+1dyXArayyjipuNgQGjY/he060XEpqxpz4Nvuf0DTHFPxBupFCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EQl7gyHe; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EQl7gyHe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791449730; x=1822985730;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ESqsuzC7a73uUZb5bYtgDrpASwvUtsqEoK9o2ZaH1J0=;
  b=EQl7gyHeUeWAid+fNB0y0/TR92WFNkHdfenUd2WxZ8gTwjaovJE1DEGP
   CAKzJTWF1LLc8rUKMwZoJWJIPdrP9T43/RdVynoUwhxqH8VRyEFF9FISA
   O17uB+5JJxAv/xf+DcuY7vxqaaT/kukGSiJJjGAyMr+0DLaGsJzVN/A4J
   Y8SvCNnk/+ek0dUhGUReN/ZUTJOQYwFc9AoIRQhuTtUvrvShWNe7TbRjH
   /WVW7JWULm3n1SXpH7Juwa9lqJO8DwUYKmMwUDSnR04xXPoT0XW9WmwsD
   6AnN/0duVfLgwNnP/9lzQxWi54GF7wmC70hFACsR6N7x43UTuXiGrtcjj
   g==;
X-CSE-ConnectionGUID: /nJd4L2fTWG2SsuqZx7mPg==
X-CSE-MsgGUID: FHj9ukjQS/ObUqdiBeFSDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="233674"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="233674"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 01:55:27 -0700
X-CSE-ConnectionGUID: rhrZz2+PTQWwH4zJSUDyLw==
X-CSE-MsgGUID: 9b++bmvxR7ekelwBHL2bzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="86321"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.95])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 01:55:24 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4BFC6121BB4;
	Thu, 08 Oct 2026 11:55:25 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xEjrr-00000003Ldp-33CV;
	Thu, 08 Oct 2026 11:52:47 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: "Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	"Bajpai, Manik" <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>,
	"Sapre, Sarang" <sarang.sapre@intel.com>,
	"Yao, Hao" <hao.yao@intel.com>
Subject: [PATCH 0/5] IPU reset workaround changes 
Date: Thu,  8 Oct 2026 11:52:42 +0300
Message-ID: <20261008085247.798156-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

Maybe I should have labelled these as RFC instead... this set reworks based on
what the ISYS is reset and how that affects UAPI.

It seems there are some issues on IPU7; at times (around once in a few hundred
cases) streaming with yavta results capturing a single frame only and an ISYS
power reset is needed to recover from that. No reboot (or driver reload) is
needed with these patches though.

Similarly with these, an ISYS reset is avoided in regular streaming cases for 
IPU7. 

Comments are welcome (as always).

Sakari Ailus (5):
  media: ipu6: Don't mark need_reset based on returned buffers
  media: ipu6: Tell about not being able to obtain frame descriptor
  media: ipu6: Prevent starting streaming if ISYS needs reset
  media: ipu6: Remove need_reset check from video device open
  media: ipu6: Return errors from stream stop and close

 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  6 +-
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    | 16 ++--
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 74 +++++++++++--------
 .../media/pci/intel/ipu6/ipu6-isys-video.h    |  4 +-
 4 files changed, 53 insertions(+), 47 deletions(-)


-- 
2.47.3

