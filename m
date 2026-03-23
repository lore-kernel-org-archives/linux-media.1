Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE5F3BC69E
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 15:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.13.27.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774280449; cv=none; b=Au+B+1UL+P1iQBaK5/isSIUX7sw1CNEw6Weh8toDmj5xyl+Aa+y15nRLDbiJeIYm3RVz5BvAv/bsTIYZcouJg6STMhsepZdksus3t8RFHBpfvi7PueIMrQcMlUn1BrjVPOtkgHVQI6uRhKcw8O2gYjOvyWM/g7LvJjT6Wx1oEI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774280449; c=relaxed/simple;
	bh=jpVXurKoSOkSjTpeZXMkzBOkIy5RBv7iV1rZlIyYyE8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mXDVEEZUusBGtX6BS+JnU+Ktrk1pVTNEr1ZHDBzP8mpcK6YclSCkaAsK3QKb6KkcBP3gwCMtCfA5yQPzGy8cG0sXpAFjkQB/dV4Vu9RiyKP3Dq3oVjZIRxeLaJkV/UPq0yXk134oIWFNGegOgh0B3N5uihb5UZKHlzT8uKx+sjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=mkvM3aWb; arc=none smtp.client-ip=49.13.27.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kcore.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b="mkvM3aWb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=VwA2t0rZ0VXagRzbDgknzd9x+x1n4+XqfjXeSxWz6AA=; b=mkvM3aWbEXmV5PK4eiKzv12xqA
	q8QDifbDjNPnGMrBOnM47LpTuCdYgF7p36PEsushlmXZHlvgtJmKQxJxdfIgAJM8mpsNwoUNALhCe
	LRS7lojlyl4I0PfmmrW0vIl+jkqbEEecw/ZJjUV+gVDxsBnvxnoRUrJ1XKfLgwjeWefI=;
Received: from mnencia by spark.kcore.it with local (Exim 4.96)
	(envelope-from <mnencia@kcore.it>)
	id 1w4hOP-005tTD-10;
	Mon, 23 Mar 2026 16:40:37 +0100
From: Marco Nenciarini <mnencia@kcore.it>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@intel.com,
	tian.shu.qiu@intel.com,
	Marco Nenciarini <mnencia@kcore.it>
Subject: [PATCH] media: intel/ipu6: Fix DWC PHY HSFREQRANGE band selection for overlapping ranges
Date: Mon, 23 Mar 2026 16:40:37 +0100
Message-Id: <20260323154037.1404865-1-mnencia@kcore.it>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The get_hsfreq_by_mbps() function searches the freqranges[] table
backward (from highest to lowest index). Because adjacent frequency
bands overlap, a data rate that falls in the overlap region always
lands on the higher-indexed band.

For data rates up to 1500 Mbps (index 42) every band uses
osc_freq_target 335. Starting at index 43 (1461-1640 Mbps) the
osc_freq_target drops to 208. A sensor running at 1498 Mbps sits in
the overlap between index 42 (1414-1588, osc 335) and index 43
(1461-1640, osc 208). The backward search picks index 43, programming
the lower osc_freq_target of 208 instead of the optimal 335.

This causes DDL lock instability and CSI-2 CRC errors on affected
configurations, such as the OmniVision OV08X40 sensor on Intel Arrow
Lake platforms (Dell Pro Max 16).

Add a check after get_hsfreq_by_mbps() that shifts to the previous
band when it also covers the requested data rate and provides a higher
osc_freq_target, ensuring stable DDL lock at boundary data rates.

Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Marco Nenciarini <mnencia@kcore.it>
---
 .../media/pci/intel/ipu6/ipu6-isys-dwc-phy.c  | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c b/drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c
index db28748..450e7a2 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c
@@ -317,6 +317,27 @@ static int ipu6_isys_dwc_phy_config(struct ipu6_isys *isys,
 		return -EINVAL;
 	}
 
+	/*
+	 * The overlapping frequency ranges combined with the backward
+	 * search in get_hsfreq_by_mbps() can select a band where the
+	 * data rate sits at the lower edge and osc_freq_target drops
+	 * (335 -> 208 at index 43). When the previous band also covers
+	 * this rate and has a higher osc_freq_target, prefer it for
+	 * better DDL lock stability. This fixes CRC errors seen at
+	 * 1498 Mbps (e.g. OV08X40 on Arrow Lake).
+	 */
+	if (index > 0 &&
+	    mbps >= freqranges[index - 1].min &&
+	    mbps <= freqranges[index - 1].max &&
+	    freqranges[index - 1].osc_freq_target >
+	    freqranges[index].osc_freq_target) {
+		dev_dbg(dev, "Dphy %u: shift band %u->%u for %u mbps (osc %u->%u)",
+			phy_id, index, index - 1, mbps,
+			freqranges[index].osc_freq_target,
+			freqranges[index - 1].osc_freq_target);
+		index--;
+	}
+
 	dwc_dphy_write_mask(isys, phy_id, IPU6_DWC_DPHY_HSFREQRANGE,
 			    freqranges[index].hsfreq, 0, 7);
 
-- 
2.47.3

