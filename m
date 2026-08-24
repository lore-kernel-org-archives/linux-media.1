Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B944137AE
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 12:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787573693; cv=none; b=bbOkh7beNHWy2l9wmK0deNEogxw4P6iO5g/wCit/NKpCail5SqldbcpibOyHXM2QmSZCMUpv5bbEb50ATRZTOHYfiwbYYnaMYXMjW+8uXT3vavZDcz06+WboBclvJ3sWIC07zAnxdvA219oqaQkwpa6gAGqyBgZYCXb+S2QFB3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787573693; c=relaxed/simple;
	bh=sRFNUbl2Hfl8pm+mrKrrndjDcH08VgZSpJTyWgLUoJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nyPEcr0oBqr8Mk7JH+eZju4QtDoRi48V1aRMayeBnXrjN0jk55c1INr0/tlwDOWW7zGovZskDoWq6CwPD5rJ9ai1AC2WCsnY91VNjvYsg3FUIIKMbxRbojfy7eBZZ94muM28mrWvqScqzGzVdQlo1Dqaeh4cU3F7C6QkymX/ohY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IwxqqBEo; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IwxqqBEo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787573691; x=1819109691;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sRFNUbl2Hfl8pm+mrKrrndjDcH08VgZSpJTyWgLUoJg=;
  b=IwxqqBEo4yPeacE4XTuunBuY1bP5sFm/T+4f0HWB7hQDJIr+UZdUm99/
   WvMhxoWo7MU+xB4LYy6iQJmCwO5CwGth/HDNQBk9uO/f7ZFEgQDYrdCy0
   nbqqRqAXQXQR8tSZZi2XhLcUeHHRsyQwt1WjT5KYiM0KpuBmcJWFgxPTp
   wv1eKp64zA+hSQ/PNpe2WRIE2aucejOZluVEx1LJvjM2LtfhmnjJK/MYJ
   tEG4aW3OOL8F4hOuG1U4UIAmCvDaTx60IvBkWCpfSx+7A421zJ35bA9ua
   YxUZX/UMb2hPhmT4Y0YmfI6p9hb1StS68683fVvAH3J91ta4nBTewvu8v
   A==;
X-CSE-ConnectionGUID: 33RtxgxySN+WqT692CUVNA==
X-CSE-MsgGUID: TbCLV5OiQimDxeZIvMUvGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88036518"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88036518"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:47 -0700
X-CSE-ConnectionGUID: MSI1BZ1eQK+BuQFDKqvx5Q==
X-CSE-MsgGUID: DCRMUwcZRG+8S6JaRDxL+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="270787656"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.180])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:45 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7ACAA121EF3;
	Mon, 24 Aug 2026 15:14:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wyTZj-0000000E39b-2fEv;
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
Subject: [PATCH v3 14/29] media: v4l2-subdev: Make v4l2_subdev_get_frame_desc_passthrough() static
Date: Mon, 24 Aug 2026 15:14:36 +0300
Message-ID: <20260824121451.3348583-15-sakari.ailus@linux.intel.com>
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

No driver uses (nor should use) v4l2_subdev_get_frame_desc_passthrough()
anymore, make it static.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c |  8 ++++----
 include/media/v4l2-subdev.h           | 22 ----------------------
 2 files changed, 4 insertions(+), 26 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index f5fa62038754..c9f38b0313eb 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2655,9 +2655,10 @@ int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 }
 EXPORT_SYMBOL_GPL(__v4l2_subdev_get_frame_desc_passthrough);
 
-int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
-					   unsigned int pad,
-					   struct v4l2_mbus_frame_desc *fd)
+static int
+v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
+				       unsigned int pad,
+				       struct v4l2_mbus_frame_desc *fd)
 {
 	struct v4l2_subdev_state *state;
 	int ret;
@@ -2670,7 +2671,6 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(v4l2_subdev_get_frame_desc_passthrough);
 
 int v4l2_subdev_get_frame_desc_passthrough_dvp(struct v4l2_subdev *sd,
 					       unsigned int pad,
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 80ae7649f5c7..cfe285f44f57 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1773,28 +1773,6 @@ int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 					     unsigned int pad,
 					     struct v4l2_mbus_frame_desc *fd);
 
-/**
- * v4l2_subdev_get_frame_desc_passthrough() - Helper to implement the subdev
- *	get_frame_desc operation in simple passthrough cases
- * @sd: The subdevice
- * @pad: The source pad index
- * @fd: The mbus frame desc
- *
- * This function locks the subdevice's active state, calls
- * __v4l2_subdev_get_frame_desc_passthrough(), and unlocks the state.
- *
- * This function can be assigned directly as the .get_frame_desc callback in
- * &v4l2_subdev_pad_ops for subdevices that pass streams through without
- * modification. Drivers that need to perform additional work should use
- * __v4l2_subdev_get_frame_desc_passthrough() in their custom
- * .get_frame_desc implementation instead.
- *
- * Return: 0 on success, or a negative error code otherwise.
- */
-int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
-					   unsigned int pad,
-					   struct v4l2_mbus_frame_desc *fd);
-
 /**
  * v4l2_subdev_get_frame_desc_passthrough_dvp() - Helper to implement the subdev
  *	get_frame_desc operation in simple passthrough cases for DVP
-- 
2.47.3

