Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B580747605B
	for <linux-media@vger.kernel.org>; Fri,  7 Aug 2026 12:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786105531; cv=none; b=F4DjgwoTZoF2/9eYiXAX2NqYPMl72/BfPIHsdYOYh5uynGyVnO5SzTbiqQ9ufKe7vqCerPrR55sbs+6uFJiRU44Buzv4YTfu7R53WopRbFxtkydfYNzyz1PZfuxbmiVObpwWR5UaIA9ciuq0SVslk3pBBuUIMGZc4wwXRcWYeb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786105531; c=relaxed/simple;
	bh=Zvqs3tDV3eiOGLbxDvRlQYkVqiboOmzIoK+EvdxNP50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CJGw2FMMd0EyO0yRxc92Jw83UN4P4LgR2TC4aOWY8JgikNmVKROknS+qLJZ3b9/X9Et+FtdaJUJo19ntPqXczK9nqdYmgryoGI8C+tcDRzPVbEx9ol3gsROgQWE0WPkbk2hSleVyELnVeqVES3X7m6VWiW4uSGeEbFKSunlkLmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QlYrTze+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QlYrTze+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786105519; x=1817641519;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Zvqs3tDV3eiOGLbxDvRlQYkVqiboOmzIoK+EvdxNP50=;
  b=QlYrTze+7hSrmY8e1LRYqcXCSWSBtVcGFrM+PO7/6YqRBxrltJFNkw2D
   sKy3NAsx1FOu7ZLuTXA1G+DYCiBp3FXRynRqG+w1z8pBLcg7hIF3n3IX8
   1LJjb5rH7Gk1uuWaNwHhIvH+FzPEfi2Xghypb2vvJLRbVirVQynae3Ys5
   XGgX9Th4GSSXU3o9RekJgw4/qNDkdOA+n9lFfH6Z5G7S6Un5CPEakBLqf
   AsK7TLKf0aOO9tkeruXGQV/k2kAU7O7k/9pTKWKtDG83mRO+BcGbYyviX
   GpL1mtrcDapttorqFFsXAwmhBOLDVfw+fdMbPZ5RPxZ2Exxx/eTDi3V7L
   Q==;
X-CSE-ConnectionGUID: ZuJG45DhQQuL1Kp7yMJ2PQ==
X-CSE-MsgGUID: TvN6i7v0TOK/K3Zp3clp9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="90592014"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="90592014"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 05:24:37 -0700
X-CSE-ConnectionGUID: NF1eCM2oStS9oHMtrxucpQ==
X-CSE-MsgGUID: VSNxG0tbSjGYt+9kGd6WjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="259779680"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.179])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 05:24:31 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A1805121CD1;
	Fri, 07 Aug 2026 15:24:20 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wsJcP-00000000Bvz-3HWF;
	Fri, 07 Aug 2026 15:24:09 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: [PATCH v7 07/14] media: v4l2-subdev: Move subdev client capabilities into a new struct
Date: Fri,  7 Aug 2026 15:24:02 +0300
Message-ID: <20260807122409.45807-8-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260807122409.45807-1-sakari.ailus@linux.intel.com>
References: <20260807122409.45807-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add struct v4l2_subdev_client_info to hold sub-device client capability
bits that used to be stored in the client_caps field of struct
v4l2_subdev_fh.

The intent is to enable passing this struct to sub-device pad operation
callbacks for capability information. The main reason why this is a new
struct instead of a u64 field is that modifying the callback arguments
requires touching almost every sub-device driver and that is desirable to
avoid in the future, should more than the client capability bits need to
be known to the callbacks.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c |  8 ++++----
 include/media/v4l2-subdev.h           | 12 ++++++++++--
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index e9f81b9be9e2..f392586d5dba 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -611,7 +611,7 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
 	case VIDIOC_SUBDEV_S_FRAME_INTERVAL: {
 		struct v4l2_subdev_frame_interval *fi = arg;
 
-		if (!(subdev_fh->client_caps &
+		if (!(subdev_fh->ci.caps &
 		      V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH))
 			fi->which = V4L2_SUBDEV_FORMAT_ACTIVE;
 
@@ -650,7 +650,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 	struct v4l2_subdev_fh *subdev_fh = to_v4l2_subdev_fh(vfh);
 	bool ro_subdev = test_bit(V4L2_FL_SUBDEV_RO_DEVNODE, &vdev->flags);
 	bool streams_subdev = sd->flags & V4L2_SUBDEV_FL_STREAMS;
-	bool client_supports_streams = subdev_fh->client_caps &
+	bool client_supports_streams = subdev_fh->ci.caps &
 				       V4L2_SUBDEV_CLIENT_CAP_STREAMS;
 	int rval;
 
@@ -1117,7 +1117,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 	case VIDIOC_SUBDEV_G_CLIENT_CAP: {
 		struct v4l2_subdev_client_capability *client_cap = arg;
 
-		client_cap->capabilities = subdev_fh->client_caps;
+		client_cap->capabilities = subdev_fh->ci.caps;
 
 		return 0;
 	}
@@ -1137,7 +1137,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		client_cap->capabilities &= (V4L2_SUBDEV_CLIENT_CAP_STREAMS |
 					     V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH);
 
-		subdev_fh->client_caps = client_cap->capabilities;
+		subdev_fh->ci.caps = client_cap->capabilities;
 
 		return 0;
 	}
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index d9dca6905b33..04fa23b9a651 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -734,6 +734,14 @@ struct v4l2_subdev_state {
 	struct v4l2_subdev_stream_configs stream_configs;
 };
 
+/**
+ * struct v4l2_subdev_client_info - Sub-device client information
+ * @caps: bitmask of ``V4L2_SUBDEV_CLIENT_CAP_*``
+ */
+struct v4l2_subdev_client_info {
+	u64 caps;
+};
+
 /**
  * struct v4l2_subdev_pad_ops - v4l2-subdev pad level operations
  *
@@ -1130,14 +1138,14 @@ struct v4l2_subdev {
  * @vfh: pointer to &struct v4l2_fh
  * @state: pointer to &struct v4l2_subdev_state
  * @owner: module pointer to the owner of this file handle
- * @client_caps: bitmask of ``V4L2_SUBDEV_CLIENT_CAP_*``
+ * @ci: sub-device client info related to this file handle
  */
 struct v4l2_subdev_fh {
 	struct v4l2_fh vfh;
 	struct module *owner;
 #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
 	struct v4l2_subdev_state *state;
-	u64 client_caps;
+	struct v4l2_subdev_client_info ci;
 #endif
 };
 
-- 
2.47.3

