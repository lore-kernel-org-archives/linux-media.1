Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8B8397E61
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 14:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773151890; cv=none; b=IZ7kZcuIF7KK1axTZjjgieViMb8Nm5e+IpeyjG2VffcpouNsoFNFrIeZLONwiQui7aLhaJd6Jav76KVRjAHH3oDk6VspPzJDK4SzjhQSg671Asm0D/88Wfk5+wVjk3DPNakWeZwJu6Ay9ipGzwp9fgQRDWpBvQ2iGVk2ZrVxU0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773151890; c=relaxed/simple;
	bh=s9tZU3QFoxN79LoZUiz1h5G89iK4yzCcqgiGIE564Uc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nBFagvUPvODEz22xkvTGQ9V0jPZU47HCcRMH7/2iUvUfyiGOAgPq+fYEGlFek4Jp1WygSe2RgZYDPnh43UDJp5blKhQSP9sBq8Xz1vn5QDxVG4EJa9wZmM5MPOc7lOOuf9fp75VlD6prLRoqtB5o3/4zOqPaH8UxR0vjoA2CGQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cH9X82hN; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cH9X82hN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773151889; x=1804687889;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=s9tZU3QFoxN79LoZUiz1h5G89iK4yzCcqgiGIE564Uc=;
  b=cH9X82hNYVBLRTzCJ0c/6m7ccXz7Ef2xUkn0djosHIo/ew0kDNrn0R91
   sU2Vyx1IMCdkdnLbypA7kAx95apHwqm9FILN6uVIYUkWm7TBc8eDiFXgR
   8DsJhOe90DsMrRFXYKA44RHwZ/DuDij+G0aOrQZvz6Fo/qv8DoD2Cm66k
   GW85eLny8/hEmZxohMVm6PJBnzRNOADEKzdSmyNImIEgHctEOr4gmmhus
   kwmTYQ3z/TwyorXq9+fkbr5g0LW/R4g0DTYfiae91gtYn2I+TzhYd30St
   XOvFHRg1oiBpdcerykQDYQ8NzygtADC+viKkBtBtTt4CNAt0RUnXYn0SN
   Q==;
X-CSE-ConnectionGUID: XKU9RhfURWmGHtDxSH1NfQ==
X-CSE-MsgGUID: OV2oO63RRkKfdF2C6eqdKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74277652"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="74277652"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 07:11:28 -0700
X-CSE-ConnectionGUID: Iy3496D9RVm2cTnE+f/QFw==
X-CSE-MsgGUID: D9oZBLdyTWutQMwu3NAqkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="219255674"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.26])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 07:11:26 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 45D42120E18;
	Tue, 10 Mar 2026 16:11:57 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vzxoT-00000004ycT-0MKL;
	Tue, 10 Mar 2026 16:11:57 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: jacopo.mondi@ideasonboard.com,
	niklas.soderlund+renesas@ragnatech.se,
	antti.laakso@linux.intel.com,
	Frank Li <Frank.li@nxp.com>,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH v5 1/1] media: v4l2-fwnode: Return -EPROBE_DEFER on parsing NULL endpoints
Date: Tue, 10 Mar 2026 16:11:57 +0200
Message-ID: <20260310141157.1186325-1-sakari.ailus@linux.intel.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
since v4:

- Fix comment indentation.

 drivers/media/v4l2-core/v4l2-fwnode.c | 9 ++++++++-
 include/media/v4l2-fwnode.h           | 6 ++++--
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 03daa8c4ff7a..77f3298821b5 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -465,8 +465,15 @@ static int __v4l2_fwnode_endpoint_parse(struct fwnode_handle *fwnode,
 	enum v4l2_mbus_type mbus_type;
 	int rval;
 
+	/*
+	 * Return -EPROBE_DEFER if there's no endpoint -- in case the endpoint's
+	 * origin is a software node, it may be that the endpoint has not been
+	 * instantiated yet, but will be with probing of another driver. This is
+	 * the case with the IPU bridge; once we have no such cases left, return
+	 * another error such as -EINVAL.
+	 */
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

