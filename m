Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EEF37E5DB
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 09:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761031; cv=none; b=ofMd4aNAyAyVUJIKY5WANxDOtkvsI2wQxhj4O5iJiuRgcDY4fW7XwPrjBS7SFnmDM5QkXZVCFNLtxrmXSk2Ss2rI1UWp8Ty8GVC2Bd4pEiutMl4zHltt7W0xbK5ks63gAUg3yMYhf2oFX0yM6wlUK3vHMTPQVqT3NaUw5DJvkYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761031; c=relaxed/simple;
	bh=qNJ/St5rT4U9Knnp2KbnCm1mddRBkER8idvV4hfJNgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N+Z3dggCVrSU8rG8TO9OZ58SKbKRcOhfBq8rxjtta8/aXKG3p5yZP1PSxPA+OaKMWxgeBn4lxMHjiVvj8X85uK+13GV8sCkkIi6TsE1v6YiYeiQPvL3k7m73uy4nUuW+BA5aIO3eFb2K6M6NAKroAXBGTmGl8Acu6Tbl1fj+7GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RUilkpOU; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RUilkpOU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790761030; x=1822297030;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qNJ/St5rT4U9Knnp2KbnCm1mddRBkER8idvV4hfJNgU=;
  b=RUilkpOUg4VJx2germoHGbtinI35TGP/DH52KPd1WWwqH3cIKIdwwVxt
   FE5PDc8e52EGIqbChg1rX9lr+4HGaNW7j+JdYkszKVj3ihKx29UM5+Egf
   n7yyizT0IhHUzDZ/fdRmU1poqYwoQprZqlbpjJhrxdC6rVOTR3L3kHLhu
   2GI9e34BeqxgomO4XisRvvdL3EPB6F60OXbtwcl8v/T0UfBrRHG9EYi/J
   91SP5jXyOmlQw2ZBff1OGWI3zkLDwBiGiPZGGgVfRLWLaI06iUgunlq4y
   BbMb0t0qtOh/KhE2B1uaAn6datdWDRnWLQuiypZ2UBUaryH2UNrva7z4u
   Q==;
X-CSE-ConnectionGUID: ktDjjtBqQU2ps/pyKgFzww==
X-CSE-MsgGUID: bIC0gZSCRCCy+RWsc+Svdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90394169"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="90394169"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 02:37:07 -0700
X-CSE-ConnectionGUID: KEFyHK1ZQ6S2k3EA/AY9zA==
X-CSE-MsgGUID: AsXXeVA+TlCtW4GUU3kz3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="279442921"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.109])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 02:37:05 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 08DC811F8A5;
	Wed, 30 Sep 2026 12:37:10 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xBqkP-0000000B13f-0eDP;
	Wed, 30 Sep 2026 12:37:09 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Antti Laakso <antti.laakso@linux.intel.com>,
	"Sapre, Sarang" <sarang.sapre@intel.com>,
	Manik Bajpai <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>
Subject: [PATCH v2 1/2] media: ipu6: Reset need_reset in ISYS suspend
Date: Wed, 30 Sep 2026 12:37:08 +0300
Message-ID: <20260930093709.2625661-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260930093709.2625661-1-sakari.ailus@linux.intel.com>
References: <20260930093709.2625661-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The need_reset field in struct ipu6_isys tells whether the device needs a
power-on reset. Resetting the field was removed unintentionally in commit
70e3fac3ec78 ("media: ipu6: Move firmware init/cleanup to RPM callbacks").

Add it back.

Fixes: 70e3fac3ec78 ("media: ipu6: Move firmware init/cleanup to RPM callbacks")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 60f5f9ea2910..74bb48c1f814 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -826,6 +826,10 @@ static int isys_runtime_pm_suspend(struct device *dev)
 		ret = -EIO;
 	}
 
+	mutex_lock(&isys->mutex);
+	isys->need_reset = false;
+	mutex_unlock(&isys->mutex);
+
 	isys->phy_termcal_val = 0;
 	cpu_latency_qos_update_request(&isys->pm_qos, PM_QOS_DEFAULT_VALUE);
 
-- 
2.47.3

