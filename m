Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0C63F1AAD
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 10:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790679260; cv=none; b=gJfkfWxKlfqGQ5Ng/vStix5bN01aIs9JJGQiQm/AGzACYXVCBSzHwbeJ4R7+MzjtyF7Hnzc+fSHzdvUK5geLSwLK/OV8qTEe8+WG7YXDetBNWtZMa3poKMja+c4zPQL51xaV+mcWoAe4Cl5Qq5AhWhn1JYZyPNKDmxOirAU4gGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790679260; c=relaxed/simple;
	bh=qNJ/St5rT4U9Knnp2KbnCm1mddRBkER8idvV4hfJNgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ciIOmeRBOwAbvkYUYrVuMUR1JEoG7SXVVJykNVhdHnwKaQpssXDbHLOnNLvVCFCleTmcNbciFmpc1xKnDN3aXHZlhAQTwTlmFnUF/vIevYBhqREBp/VppomK01EH1k6AYS1d9oaBBsp6rF2Ki6VdH0AUYXk3I/hdgCXDZPOYHcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YwkLyoF6; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YwkLyoF6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790679257; x=1822215257;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qNJ/St5rT4U9Knnp2KbnCm1mddRBkER8idvV4hfJNgU=;
  b=YwkLyoF6pPKvZro9TUkWQGMeRmDG50Kl6SigkPNLiXc+wtIP913oYtK9
   Zf5+F/IMbXjjJBRU3tdb3NXpWK9lqU+dv9xqd0rHzYV+IH0wfXf2qLebW
   o+SJSO+lYJOof/hy700A4ilCexqKh6ThE8mtLGx+oIBl/vgp6iS6x+BXM
   5VAugJlxCcXoPezRNixmy5rs3Yb2MFGjeDuCB2cuiDiLY0WPcXty15xve
   1t870GiphmjkWDMPEsYVwIEHXdFeuH1lmEjkioUmmJQgAT4W5rMQm/aGD
   IaYw6KkWw4+GgWiyFAk+ucFMWQLgAST3Ka5QJLFh+p8q66KIhgvt/K71U
   g==;
X-CSE-ConnectionGUID: E/YaN9ZYQHGgH6z/uA3NfA==
X-CSE-MsgGUID: B9a2PKoSQhKcQSQwpRczWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="95206070"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="95206070"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 03:54:14 -0700
X-CSE-ConnectionGUID: 96x/hfSDQNqPd4SjF7+W0w==
X-CSE-MsgGUID: RiQPYwccSmOcWrW6ESw80Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="278686985"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.223])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 03:54:13 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 95BBB121840;
	Tue, 29 Sep 2026 13:54:16 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xBVTT-0000000AYZE-32Og;
	Tue, 29 Sep 2026 13:54:15 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Antti Laakso <antti.laakso@linux.intel.com>,
	"Sapre, Sarang" <sarang.sapre@intel.com>,
	Manik Bajpai <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>
Subject: [PATCH 1/2] media: ipu6: Reset need_reset in ISYS suspend
Date: Tue, 29 Sep 2026 13:54:14 +0300
Message-ID: <20260929105415.2516142-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929105415.2516142-1-sakari.ailus@linux.intel.com>
References: <20260929105415.2516142-1-sakari.ailus@linux.intel.com>
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

