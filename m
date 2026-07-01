Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067EC492514
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 12:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908609; cv=none; b=YDq0+ZG5mrZAEXUFkelhQud77+8cZyTi28aRgYJVYL3EU3YzZWWQTlF5SOPzqIluRJhH6UsphYHzARZdNa9BgJBWhNr2xmnpfVrSfwYQNFmTZQKT6++wFipZJYBXe4QCrtBEQgr4CS5hiMfLLGakrIdlnoO1nUhEjgGMem7PAuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908609; c=relaxed/simple;
	bh=ZR27qtQmQMvJK/LKVS8YQgW1XuLWZsHNvUAxFq0eAJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cUnBhEIS69m0+XwRqDZwUY+Kt5TY9Py9QIoccaenQttQlR0hdCMsRUdtP9dHbcYzPZRN4lh/5N09UVXZ6H7YGsWDFjlqafXbkqjezXZsSIWUdMYxosdV+SwaYjnB6tA5lgHOiQqn+HZO2PNzlJpJ5W55M+ADOwDwJR9Pn6jMBmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T3P+kQNA; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T3P+kQNA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782908608; x=1814444608;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZR27qtQmQMvJK/LKVS8YQgW1XuLWZsHNvUAxFq0eAJ0=;
  b=T3P+kQNA0i7qRfAr1dcJqXnbwpVvEIncK9Jbzv+Snw7sz8EtXn1MuHm8
   vTFltTnAaJRGT6qrou58VayEtVa70Z6eW2PEQpprHvDgCg49XxQZe2SBZ
   Ey6KPslM/KE+kqaG7Y8RmdMpIYkAeW4zrlz3nsFOjLVh/NU9wBum0UKka
   LYoE1pgTvfAKEKv81y31VLy6aGV7Xycz3n+S/exG250yNc9xpFSR9unWS
   MajG8to9PGai4M4hhj71GP8Fp6VfZ25Lk9oaQaS+QhwXxn1wqM2OZHQTC
   BMcJVCrFjVmhQRUrThXZphJfla8O3X1K0rZWZr6QLTOQSq5Qf/LsB3QH8
   Q==;
X-CSE-ConnectionGUID: DOHrrIT/SrCj28Xe9NC2dg==
X-CSE-MsgGUID: F7sZ/rvKT6OEg5iaBQa5vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="94239241"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="94239241"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 05:23:27 -0700
X-CSE-ConnectionGUID: 0fkQPEkcTcWFcdqBHKTgfA==
X-CSE-MsgGUID: hHalNDTVRE2IVp3BnOTkDg==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.62])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 05:23:22 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 080F9121D00;
	Wed, 01 Jul 2026 15:23:05 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1weu1S-00000007FlH-3Eil;
	Wed, 01 Jul 2026 15:26:34 +0300
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
Subject: [PATCH v6 15/16] media: cvs: Drop comments on sub-device operations
Date: Wed,  1 Jul 2026 15:26:32 +0300
Message-ID: <20260701122634.1728782-15-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
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
---
 drivers/media/i2c/cvs/v4l2.c | 82 ------------------------------------
 1 file changed, 82 deletions(-)

diff --git a/drivers/media/i2c/cvs/v4l2.c b/drivers/media/i2c/cvs/v4l2.c
index 3a1ec0059ef7..32e4bf74aa1d 100644
--- a/drivers/media/i2c/cvs/v4l2.c
+++ b/drivers/media/i2c/cvs/v4l2.c
@@ -70,19 +70,6 @@ static int csi_set_link_cfg(struct icvs *ctx)
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
@@ -385,17 +328,6 @@ static const struct media_entity_operations cvs_csi_entity_ops = {
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
@@ -415,12 +347,6 @@ static int cvs_csi_notify_bound(struct v4l2_async_notifier *notifier,
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
@@ -438,14 +364,6 @@ static const struct v4l2_async_notifier_operations cvs_csi_notify_ops = {
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

