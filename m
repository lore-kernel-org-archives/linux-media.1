Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E75341835F
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 12:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787573696; cv=none; b=HYouynDMISZfAbETdlANC90UMEDxkFqdzMnB/FRYx1SwypsLGsO6Z3AHYf+u1pGp4Run7Pz1K138UShf6vTpfXQfVDKiAVABel67paG1bCv6mm4xrqcCnxrzwRJ0oRtwMfG8lnt6GgvkGswbcOjIJnMv7kLktSp+jyB/zgsqmKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787573696; c=relaxed/simple;
	bh=aFSvocmiwOUJv11UvTJ7HT/0g96oyXGY8ctrR1G4wjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gwaETbskzTZKswzLYoh3YynnCM9uJAJqjr3LF83wco8/x7O1Zg11t+bSxR3or3v631fB2zzhDZ1FnxTfKJ58ktRzmTopaJH3AYxkep8+JjFsuV/wH1eCgtPNuIr/0OJnWuLZ10Jkv1dvDHcywPcyC+TGPgg0VsNQok0lVsbNGzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nCVRLNxG; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nCVRLNxG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787573694; x=1819109694;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aFSvocmiwOUJv11UvTJ7HT/0g96oyXGY8ctrR1G4wjo=;
  b=nCVRLNxGdjk8r19x+5Q11ico2PhTQrU8hykNPEg/VsmNvNN7+LzdLNld
   +pvbXoIo8WAE3aTvXi/vztbHT8npb9V7HJMB6bCh3Qad6vIxHTvlUN7GQ
   fqV/lcb8PxZaU/Vlm+k8NMCsivPbA6KcSMXdZIW4YlckyXkzcoi+0mH1c
   HV7GeS4QpjwHuWWVbHjggDl0VcS14K8eVrn9dcfYZm1nmxZbPsFiOAsZR
   4f3ZwNUrd193fyZXJ1zpapE/70hMmoyJQwcdLaRAJPJqNKqo9/UOA9X5A
   sAT1RMqfHY3TTCOAvATROTqWLDJybdLHYRzozBMazJsLlj6PcbBa8QMJG
   g==;
X-CSE-ConnectionGUID: r7MwU5lgRtqmrS0UsYPm1Q==
X-CSE-MsgGUID: hAC59w9eSf6YBgVJ/Na5gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88036555"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88036555"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:51 -0700
X-CSE-ConnectionGUID: eRvHyvVoRRC6p7TwbbyTCA==
X-CSE-MsgGUID: hqK3o0QaRs+EVgqn4hxtpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="270787660"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.180])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:49 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 80A00122009;
	Mon, 24 Aug 2026 15:14:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wyTZj-0000000E39l-2mTw;
	Mon, 24 Aug 2026 15:14:51 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: [PATCH v3 16/29] media: v4l2-subdev: Always return at least one frame descriptor
Date: Mon, 24 Aug 2026 15:14:38 +0300
Message-ID: <20260824121451.3348583-17-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make v4l2_subdev_get_frame_desc() return at least one frame descriptor
entry or an error. Empty frame descriptors aren't useful for callers so
callers can now omit this check.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 6 ++++++
 include/media/v4l2-subdev.h           | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index d34704aad88e..8c3c5b6e4ee8 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2774,6 +2774,12 @@ v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 			goto err_free;
 		}
 
+		if (!desc->num_entries) {
+			dev_dbg(sd->dev, "no frame descriptor entries\n");
+			ret = -EINVAL;
+			goto err_free;
+		}
+
 		return desc;
 	}
 
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index cfe285f44f57..516473758761 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1847,6 +1847,8 @@ int v4l2_subdev_get_frame_desc_passthrough_csi2(struct v4l2_subdev *sd,
  *    struct v4l2_mbus_frame_desc *desc __free(v4l2_subdev_free_frame_desc) =
  *            v4l2_subdev_get_frame_desc(sd, pad, desc);
  *
+ * The returned frame descriptor will contain at least one entry.
+ *
  * Return: The frame descriptor on success or a negative error code on failure.
  */
 struct v4l2_mbus_frame_desc *
-- 
2.47.3

