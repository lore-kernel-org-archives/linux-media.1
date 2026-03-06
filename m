Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E0536C0D6
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 16:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772813986; cv=none; b=IAROaGN5CxYLCvmiegffGkk45awZXr+cxj+KzXc7+HvgMZRoYxYqA2WhN/PLTp4UnnGPlrHrxv7APTdcDviBIDXx8DqFZy29cIe9GavK8aabsc5BMnni/V8kVau1BPHo7F5pszYOi28yknu2F+k6xT/aNMImS7SBl0aWFNAbwrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772813986; c=relaxed/simple;
	bh=LPbLpw0jzql4npjqFo4wP9Hbknz5cpQ5jCrG9y3u8TE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=glQoJA7pl49mDuaxg2K+ggXqDVdmxsVgPhTKizGvZauoB4fVrhcTgzqt+7Ok4WkfF9HpNBiSJeZg27UFiD51pki1fXLqXtz8V4g5X4Kwq0BMUYMi2dDsw4GcZDvTgaDC+LLI1qqqIa4dD8M3J7tj3fr/6XpN+XssOsaGfrGwo1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C70QQQoc; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C70QQQoc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772813984; x=1804349984;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LPbLpw0jzql4npjqFo4wP9Hbknz5cpQ5jCrG9y3u8TE=;
  b=C70QQQocl9W/GX60tQXdfxd6jKYLmeNsXz8xLEKoZussr9yn2M4SEQ6R
   gM4AWORtgEXZGGoy2V3Krw3Eizk5+cao74nYVj4R4cdy+CJ3dZSZCKLRC
   KnZC56XD4E2i4QWOJGIXJ3IrhMKbejXv0md3NdRo+NzgER+KmiTK4IfuY
   7OV0UQFQ+1Sm5WFuZsunEM2Pw8+dx5fFvm0J2A5lhuWABzfqZsfcdC/jz
   jOuXbyuOPyhBQkcmQ8p+Y4Jk/fkmjvkErUV+Nhs/NnnQnFfxb6+NTZciV
   eiWC4GTQRctzP2r3FeYG32TG+UtYg/pByXbQ7OnyHxxVHRMNPnD7RBWQ7
   A==;
X-CSE-ConnectionGUID: NsY9WGIQRRKALGqFiehf7A==
X-CSE-MsgGUID: el126lpOSwidUsIjD6Maww==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="74000267"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="74000267"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 08:19:44 -0800
X-CSE-ConnectionGUID: u0UExkZvRYe2TeEgQyzflw==
X-CSE-MsgGUID: tZDmJG1ZScmTSRBFBj/59A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="219044885"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.245.27])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 08:19:42 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 13BD211F828;
	Fri, 06 Mar 2026 18:20:10 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vyXuL-00000002p6L-3D6O;
	Fri, 06 Mar 2026 18:20:09 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: jacopo.mondi@ideasonboard.com,
	niklas.soderlund+renesas@ragnatech.se,
	antti.laakso@linux.intel.com,
	Frank Li <Frank.li@nxp.com>
Subject: [PATCH v3 1/1] media: v4l2-fwnode: Return -EPROBE_DEFER on parsing NULL endpoints
Date: Fri,  6 Mar 2026 18:20:09 +0200
Message-ID: <20260306162009.673081-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In general drivers get their firmware graph endpoints from system
firmware, but on some systems this information is conveyed to drivers via
software nodes. The software nodes may be instantiated only after the
drivers are first probed, requiring drivers to explicitly issue
-EPROBE_DEFER when endpoints aren't found.

Instead of doing this in all (or at least most) drivers, make v4l2-fwnode
endpoint parsing functions v4l2_fwnode_endpoint_parse() and
v4l2_fwnode_endpoint_alloc_parse() return -EPROBE_DEFER when an endpoint
is NULL.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
since v2:

- Fix documentation

 drivers/media/v4l2-core/v4l2-fwnode.c | 2 +-
 include/media/v4l2-fwnode.h           | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 03daa8c4ff7a..36b0495351cb 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -466,7 +466,7 @@ static int __v4l2_fwnode_endpoint_parse(struct fwnode_handle *fwnode,
 	int rval;
 
 	if (!fwnode)
-		return -EINVAL;
+		return -EPROBE_DEFER;
 
 	pr_debug("===== begin parsing endpoint %pfw\n", fwnode);
 
diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
index cd82e70ccbaa..d7abbd76a421 100644
--- a/include/media/v4l2-fwnode.h
+++ b/include/media/v4l2-fwnode.h
@@ -218,8 +218,9 @@ enum v4l2_fwnode_bus_type {
  *
  * Return: %0 on success or a negative error code on failure:
  *	   %-ENOMEM on memory allocation failure
- *	   %-EINVAL on parsing failure, including @fwnode == NULL
+ *	   %-EINVAL on parsing failure
  *	   %-ENXIO on mismatching bus types
+ *	   %-EPROBE_DEFER on NULL @fwnode
  */
 int v4l2_fwnode_endpoint_parse(struct fwnode_handle *fwnode,
 			       struct v4l2_fwnode_endpoint *vep);
@@ -276,8 +277,9 @@ void v4l2_fwnode_endpoint_free(struct v4l2_fwnode_endpoint *vep);
  *
  * Return: %0 on success or a negative error code on failure:
  *	   %-ENOMEM on memory allocation failure
- *	   %-EINVAL on parsing failure, including @fwnode == NULL
+ *	   %-EINVAL on parsing failure
  *	   %-ENXIO on mismatching bus types
+ *	   %-EPROBE_DEFER on NULL @fwnode
  */
 int v4l2_fwnode_endpoint_alloc_parse(struct fwnode_handle *fwnode,
 				     struct v4l2_fwnode_endpoint *vep);
-- 
2.47.3

