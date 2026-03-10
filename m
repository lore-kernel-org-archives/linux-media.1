Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E81B3B95E9
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 08:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773129610; cv=none; b=fQw5/bTkOxnHQN8w+J+apdpDFJFWRWFxtxk2SIMbGJq6OlMo7APjyevb7I3ytuQDpm456PCvOu2Ce2kE3C1/2xVmfiVbxitQyqYOfEhTKOZ/27dKP2YdoyQB4EpAY/MdU8iwwP4wV/tmIbTLBKQ0CmZ8Jw99ETS0QBc+1cUxon8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773129610; c=relaxed/simple;
	bh=0rQv0BMS3LlfHyrs8brf/iJnHYHuJyx4Vb/Fjy5XIcU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rjQeyrTgSzTisGYGB8+ZiTpQaWKjhVX+6acbaG6Tye1XEKNRBf/r7ViqhWo2MOHjsYa4Klx2SdsWpC9QZXRLRqdbkUto4c4I0Gdb63ru/cfXb6+fu9km+abmFVLn+CQkrA//fGH3wg2WbJL59NHoFT9usgK/HUrEk6c61m0C0xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D4PcM0II; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D4PcM0II"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773129610; x=1804665610;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0rQv0BMS3LlfHyrs8brf/iJnHYHuJyx4Vb/Fjy5XIcU=;
  b=D4PcM0IIdLtCP+DrvTjqcD5hznQC9iJbGcyIwBk12+FSOQD7clZFxdtj
   TPI3u5HjLxOX9GZV4KwwyOMP+PyWFxrWGmh4IhiWXT8y10GEvhnNhCq3B
   pQaxg/n5MVvLgOogSteINQZd6WHxcy57uT9RpqAHttr52b7Z0qPpmMl2l
   3PEjlx3uSc1RoHxIxmIXnw1i1+mYP16L82rPi5SYhQkdYl35OnQ8kZobv
   WTugrB3utI1idLzvnhE9XgL2Kd2+rFRTfn1seHuNrDMF2FALNk5CcvUdH
   7L1EwOiIQf+PLvVgxwPz/OEXXKVSbs62W1eHZs7F9axsWNJqAx+Zbb9GB
   w==;
X-CSE-ConnectionGUID: 1dD1bx6xRAquI4341/fgkA==
X-CSE-MsgGUID: +180G+bdSRmTiuKDPUDhdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74283319"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="74283319"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 01:00:09 -0700
X-CSE-ConnectionGUID: gmO92EZORvixN7y1/+A0dg==
X-CSE-MsgGUID: bVFtT8YfS0+LtO2ax+HxVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="216431085"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.26])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 01:00:07 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 23B341206B6;
	Tue, 10 Mar 2026 10:00:39 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vzs18-00000004xfv-41JM;
	Tue, 10 Mar 2026 10:00:38 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: jacopo.mondi@ideasonboard.com,
	niklas.soderlund+renesas@ragnatech.se,
	antti.laakso@linux.intel.com,
	Frank Li <Frank.li@nxp.com>,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH v4 1/1] media: v4l2-fwnode: Return -EPROBE_DEFER on parsing NULL endpoints
Date: Tue, 10 Mar 2026 10:00:38 +0200
Message-ID: <20260310080038.1182695-1-sakari.ailus@linux.intel.com>
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
since v3:

- Add a commit on why -EPROBE_DEFER is being returned in
  __v4l2_fwnode_endpoint_parse().

 drivers/media/v4l2-core/v4l2-fwnode.c | 9 ++++++++-
 include/media/v4l2-fwnode.h           | 6 ++++--
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 03daa8c4ff7a..042c6ecb9e1a 100644
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
+	*/
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

