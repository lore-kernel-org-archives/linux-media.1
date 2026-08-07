Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5918347124B
	for <linux-media@vger.kernel.org>; Fri,  7 Aug 2026 12:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786105564; cv=none; b=QcTQk81Yo+ih4vQpkrnqnqqiNSeZn5818RH/w8yi8/gfZ36/vIHDl82KeMPGVmjxA71vpfeptrmyvfXEpEAezA6qqm1qNBtwBGhK0zKHkFcYU2+4Mn71SqakSKabouzMBypP/SM3rcl7qYZwLt0c/Ycen0ELkmJ7XGtDI1A3kTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786105564; c=relaxed/simple;
	bh=ueWCU3eDJiVaVAgvKLbqy56e6vGFBfnLjhweC5ozo6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=saK3CI3zz3fVa2/sXph7t7eCCYim6acTlCCR0DZ3URtmv/9pOVI9kd2/aGCc5W7PiKBRrV0NVrP5spNgGrW0i78/HT9s/tik6l8peaoVAwmmR5cS7jKTZGejptaYN4gDAn0dAvmtmdx9BfN8i1gUcr+uM0b/NsWjc7VC5H+VwCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EpbE9FXc; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EpbE9FXc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786105543; x=1817641543;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ueWCU3eDJiVaVAgvKLbqy56e6vGFBfnLjhweC5ozo6c=;
  b=EpbE9FXcLYfimjDssRwY87dSuW2Pq2V3zLQ9umrcpHIkNeyVTSzA+VnJ
   5qMUoePxJEkQv9KgshRAaPA2O8H30eJEx39DChtgudmWKonTQxU7/paTC
   riimr2TFNKphjZxkgm08seF4q7lSQB+vfcp06Da14SaPuBOqP65AO24NE
   e1sO+tQmDZLu9SUuGu1cYD/o0c8QM6xByWGyq+i1ea7DA3IjtQW7I5z+S
   MGjTcWyKKSHI66rTfFoCR2m3CuiTrFMbaK93LbSda5SoP+KE9kw3/8VV+
   TQ5P8WXbzAMV/a/i2dEtzFVEHM7bFPEgNsdr8Wb13Ue13sQzTcrvHRDfE
   w==;
X-CSE-ConnectionGUID: qkJlDQ7XSma1Oajd+4uHQQ==
X-CSE-MsgGUID: BOgM9DPFT9yCKuioGdDhPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="90592051"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="90592051"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 05:24:37 -0700
X-CSE-ConnectionGUID: PUjTBZDbTFO8dNn2bAOwgA==
X-CSE-MsgGUID: kOQzCh5tTWqEjMJEpeutmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="259779689"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.179])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 05:24:31 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B7D55121CEF;
	Fri, 07 Aug 2026 15:24:20 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wsJcP-00000000BwP-3fpl;
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
Subject: [PATCH v7 13/14] media: cvs: Drop comments on sub-device operations
Date: Fri,  7 Aug 2026 15:24:08 +0300
Message-ID: <20260807122409.45807-14-sakari.ailus@linux.intel.com>
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

The sub-device operations are well documented in the V4L2 sub-device
framework already. Drop them from the CVS driver.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/cvs/v4l2.c | 82 ------------------------------------
 1 file changed, 82 deletions(-)

diff --git a/drivers/media/i2c/cvs/v4l2.c b/drivers/media/i2c/cvs/v4l2.c
index 9fadca7a3bee..33c5393ee8d2 100644
--- a/drivers/media/i2c/cvs/v4l2.c
+++ b/drivers/media/i2c/cvs/v4l2.c
@@ -71,19 +71,6 @@ static int csi_set_link_cfg(struct icvs *ctx, u64 link_freq)
  * Streaming
  */
 
-/**
- * cvs_csi_enable_streams - Start streaming through the bridge
- * @sd: Sub-device pointer
- * @state: Active state
- * @pad: Pad identifier (must be ICVS_CSI_PAD_SOURCE)
- * @streams_mask: Streams to enable (bit 0 supported)
- *
- * Runtime-resumes the bridge (triggering cvs_runtime_resume() to claim CSI-2
- * link ownership), fetches the link frequency, programs the MIPI configuration,
- * and forwards the enable request downstream.
- *
- * Return: 0 on success or negative errno.
- */
 static int cvs_csi_enable_streams(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *state,
 				  u32 pad, u64 streams_mask)
@@ -129,19 +116,6 @@ static int cvs_csi_enable_streams(struct v4l2_subdev *sd,
 	return ret;
 }
 
-/**
- * cvs_csi_disable_streams - Stop streaming through the bridge
- * @sd: Sub-device pointer
- * @state: Active state
- * @pad: Pad identifier (must be ICVS_CSI_PAD_SOURCE)
- * @streams_mask: Streams to disable (bit 0 supported)
- *
- * Disables the remote sensor stream then drops the PM reference acquired
- * during enable. After the autosuspend delay, cvs_runtime_suspend() will
- * return CSI-2 link ownership to CVS firmware.
- *
- * Return: 0 on success or negative errno.
- */
 static int cvs_csi_disable_streams(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_state *state,
 				   u32 pad, u64 streams_mask)
@@ -167,15 +141,6 @@ static int cvs_csi_disable_streams(struct v4l2_subdev *sd,
 /*
  * Pad operations / formats
  */
-/**
- * cvs_csi_init_state - Initialize pad formats in subdev state
- * @sd: Sub-device
- * @state: State container
- *
- * Sets all pad formats to a minimal 1x1 default.
- *
- * Return: 0.
- */
 static int cvs_csi_init_state(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *state)
 {
@@ -186,17 +151,6 @@ static int cvs_csi_init_state(struct v4l2_subdev *sd,
 	return 0;
 }
 
-/**
- * cvs_csi_set_fmt - Negotiate pad format
- * @sd: Sub-device
- * @state: State
- * @format: Desired / returned format
- *
- * Mirrors sink format onto source pad. Accepts many media bus codes, falling
- * back to Y8 if unsupported. Normalizes field setting.
- *
- * Return: 0.
- */
 static int cvs_csi_set_fmt(struct v4l2_subdev *sd,
 			   struct v4l2_subdev_state *state,
 			   struct v4l2_subdev_format *format)
@@ -319,17 +273,6 @@ static int cvs_csi_set_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
-/**
- * cvs_csi_get_mbus_config - Provide current CSI-2 bus configuration
- * @sd: Sub-device
- * @pad: Pad index
- * @cfg: Returned bus config
- *
- * Fills lane ordering and number of lanes; retrieves link frequency from
- * remote entity.
- *
- * Return: 0 on success or negative errno.
- */
 static int cvs_csi_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
 				   struct v4l2_mbus_config *cfg)
 {
@@ -384,17 +327,6 @@ static const struct media_entity_operations cvs_csi_entity_ops = {
 /*
  * Async notifier
  */
-/**
- * cvs_csi_notify_bound - Remote sensor bound callback
- * @notifier: Async notifier
- * @sd: Remote subdev
- * @asc: Async match connection
- *
- * Locates the source pad of the remote sensor and creates a media link to
- * the CVS bridge sink pad enabling it by default.
- *
- * Return: 0 on success or negative errno.
- */
 static int cvs_csi_notify_bound(struct v4l2_async_notifier *notifier,
 				struct v4l2_subdev *sd,
 				struct v4l2_async_connection *asc)
@@ -414,12 +346,6 @@ static int cvs_csi_notify_bound(struct v4l2_async_notifier *notifier,
 				     MEDIA_LNK_FL_IMMUTABLE);
 }
 
-/**
- * cvs_csi_notify_unbind - Remote sensor unbind callback
- * @notifier: Notifier
- * @sd: Remote subdev
- * @asc: Connection
- */
 static void cvs_csi_notify_unbind(struct v4l2_async_notifier *notifier,
 				  struct v4l2_subdev *sd,
 				  struct v4l2_async_connection *asc)
@@ -437,14 +363,6 @@ static const struct v4l2_async_notifier_operations cvs_csi_notify_ops = {
 /*
  * Controls
  */
-/**
- * cvs_csi_init_controls - Initialize V4L2 controls
- * @ctx: CVS context
- *
- * Currently sets up a read-only privacy control placeholder.
- *
- * Return: 0 on success or negative errno.
- */
 static int cvs_csi_init_controls(struct icvs *ctx)
 {
 	struct v4l2_ctrl *privacy_ctrl;
-- 
2.47.3

