Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624F6502D5A
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 10:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790679265; cv=none; b=Op3B8OtDVUl2IATPlXPc8w6ahCxNzU8L5hwJNsRlzwqFnDWnh/jMoVm5xrw37iVo7bUv8rLRWeagD9XsYM1tBwuXSfDtO6Bk3pHC5wnTDxq24GY58Gv5TzQrHUbSGD2ghw53Atq8x6ADLGeQRZKcsEQOr1ugXKbkFpUvAk1rCFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790679265; c=relaxed/simple;
	bh=dnJH66HhwDhOeRQqF5U2yyliOX2pLxforqgAydlqe1M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FWYwDZ4uRg7C90sZvl7ktD5OxmNKy74A0pAItbG2C1Bq4qikmxiwsPJAyP/2PnVYSIzoyeLf5GgMEfp3Vho3/xoL7+jkkm4OTIlmL01BPFLZEUFW9R51O9bS8Y7/Wvm19OSVyOYoscmMWcUt08QUZ225t+ix0KDrk2gU1IsWwk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VS/ejFbl; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VS/ejFbl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790679261; x=1822215261;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dnJH66HhwDhOeRQqF5U2yyliOX2pLxforqgAydlqe1M=;
  b=VS/ejFblr8JsHamEKip95CeA6boFaYgx62ygSVOMA8lmKkHq9xn8Z6xm
   Kz7EHuGLBjpFMpNfny86B7suPzUhW/TMhBkn/mvLA8UFUwJ2Egu8kgJSw
   JyST/1W7UBZUE8NaktZM2R6Ordn+mbW5Lv1gZ7GkPeLm1h2mk2XHt+0n8
   MbcI3xUUP/9EypVhoMYjFnpWPtnxmXdUcHiEldAtfgSz9TogXTUjwX0SY
   kjkN66q8Pj5MQt4PFBQxRb3CUR755VE4eeakHbSg7BzeugeCktWNFrcqA
   dN+RspAvbBKsnTLdSvrkdbOnEoTTfROtuLkhx7i4sH/D7zulfMqODZc7J
   A==;
X-CSE-ConnectionGUID: G8PjLzfjS9CNY+LnSigvPg==
X-CSE-MsgGUID: FDAnrFlfQ/uQm+OtEo0jYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="95206071"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="95206071"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 03:54:14 -0700
X-CSE-ConnectionGUID: COyBz0NKTmulMtkul50kRQ==
X-CSE-MsgGUID: /0Pcv4ClQKuWMrb3R+wddw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="278686986"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.223])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 03:54:13 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 95FEC121BA6;
	Tue, 29 Sep 2026 13:54:16 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xBVTT-0000000AYZB-2x5W;
	Tue, 29 Sep 2026 13:54:15 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Antti Laakso <antti.laakso@linux.intel.com>,
	"Sapre, Sarang" <sarang.sapre@intel.com>,
	Manik Bajpai <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>
Subject: [PATCH 0/2] IPU6 fixes following multi-stream support
Date: Tue, 29 Sep 2026 13:54:13 +0300
Message-ID: <20260929105415.2516142-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

There's a small but important fix for the ipu6 driver's ipu7 support -- on
ipu7 streaming works only once, and apparently this is because the ISYS
needs a power reset between streaming instances. The patch addresses
detecting this, which got broken in the multi-stream support set.

The second patch adds a warning on needing a reset.

Addressing why the reset is needed is out of scope of this set.

Sakari Ailus (2):
  media: ipu6: Reset need_reset in ISYS suspend
  media: ipu6: Warn if the active list isn't empty when returning
    buffers

 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 7 +++++++
 drivers/media/pci/intel/ipu6/ipu6-isys.c       | 4 ++++
 2 files changed, 11 insertions(+)


base-commit: 58348f64125e9a3e44d3abb275ca7f4e6c9641e5
-- 
2.47.3

