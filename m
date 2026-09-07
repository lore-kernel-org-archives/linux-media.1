Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB552D3EEB
	for <linux-media@vger.kernel.org>; Mon,  7 Sep 2026 20:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788813106; cv=none; b=GMRufV4epDI4tDBtTd1ArbFTJJLaFMHzyFu0dLEPnviHtH08pSHQlFWwFcnWn7gb9On3ca8MoYLQyM3eeQlhLT5JSw6R/OlgOmDYY8nIJ0HDxR0Bfjq8PgoUZdiFXDtbNqR66mniNOL9PueBJCj5EXCabUiozL7GPBb2tsKFd5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788813106; c=relaxed/simple;
	bh=k+95z1oqZTiVoEV0NfQ17CtfPrutuvOFHTJaNRbQNH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jeG3/y9NtST0NOfqZQYIbrGSD2Ou2YLonvbvi3BMaj9hefTsCvpsxAJC4e3LCO6gH5aTRiaHPrwUX+/a4DVFQQ5h5BMQ5gAmCWSsO/UKRcmKomjdtINJPRcCMTVQCUfEcZ5TybAtkQ4Jq6ZUNOaTG1ceTzckLF+qKyvP5pwf0qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MhN7Zd7M; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MhN7Zd7M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788813103; x=1820349103;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k+95z1oqZTiVoEV0NfQ17CtfPrutuvOFHTJaNRbQNH0=;
  b=MhN7Zd7MoWGpLP5a7ymv5HqmyYVjYWijkNCUpdKrYH1PM6nU/evQ2I0C
   N5VHsf20IOoji9G1KCmrdEjejlAsBxDTyyu/fYSGknfF1usOWdROkD/DF
   ecFJqcyzjzJF5gKmEULdf/2cc20YS210FTLra0NrEBIyHqCAmrZhBpPCx
   zzuzjVuW7NXu3L1u3di2MfiQKl8ozw7cwpchIy5S9IYz3+Mc9DIPZhFBN
   WcLya67+s5QpXW/KezhQR8vbPsOrqLyJ5KSdqStSqEUHW5EE4i2xdkD9C
   abXJ1HH1dZYKAKYYq/GYaQMbsRbrH1WDbkVsZS9Q/l/lbO/9cSqaOiMSq
   Q==;
X-CSE-ConnectionGUID: exoufU21QhOgI2xe7HgeIw==
X-CSE-MsgGUID: 6QJvwtiUTDOk/+b+MQoz3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="93034693"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="93034693"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 13:31:42 -0700
X-CSE-ConnectionGUID: hFFJulrXSdSOpEiZkQ+wAQ==
X-CSE-MsgGUID: hVZPR43pSq+qN3dhVsrmVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="267536422"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.80])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 13:31:40 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C7BDF121C60;
	Mon, 07 Sep 2026 23:31:42 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x3g0E-0000000Be9R-1Eu7;
	Mon, 07 Sep 2026 23:31:42 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: antti.laakso@intel.com,
	Lixu Zhang <lixu.zhang@intel.com>,
	Miguel Vadillo <miguel.vadillo@intel.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	"Sapre, Sarang" <sarang.sapre@intel.com>
Subject: [PATCH 3/3] media: ivsc: Use ipu_bridge_get_ipu6()
Date: Mon,  7 Sep 2026 23:31:42 +0300
Message-ID: <20260907203142.2775925-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907203142.2775925-1-sakari.ailus@linux.intel.com>
References: <20260907203142.2775925-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of going through the PCI device ID table, use
ipu_bridge_get_ipu6() to obtain a pointer to the IPU PCI device.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ivsc/mei_csi.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
index c2917e156345..d4256415a829 100644
--- a/drivers/media/pci/intel/ivsc/mei_csi.c
+++ b/drivers/media/pci/intel/ivsc/mei_csi.c
@@ -27,7 +27,6 @@
 #include <linux/workqueue.h>
 
 #include <media/ipu-bridge.h>
-#include <media/ipu6-pci-table.h>
 #include <media/v4l2-async.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-fwnode.h>
@@ -644,13 +643,9 @@ static int mei_csi_probe(struct mei_cl_device *cldev,
 	struct device *dev = &cldev->dev;
 	struct pci_dev *ipu;
 	struct mei_csi *csi;
-	unsigned int i;
 	int ret;
 
-	for (i = 0, ipu = NULL; !ipu && ipu6_pci_tbl[i].vendor; i++)
-		ipu = pci_get_device(ipu6_pci_tbl[i].vendor,
-				     ipu6_pci_tbl[i].device, NULL);
-
+	ipu = ipu_bridge_get_ipu6();
 	if (!ipu)
 		return -ENODEV;
 
-- 
2.47.3

