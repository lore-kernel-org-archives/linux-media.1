Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8357D44998F
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 11:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386134; cv=none; b=TMUbWZAZw0083F/Euj2dK7zqgln1uQ0mbhwzMdOJcFsCUsFzxNWpsv8EUkmPDJUk8I4U7pvQPNQbG6z536QZmY0Ir1j499J5iePupWHbKjjBEslZjK9xadvviRhTMIidKrrOvthnHFH142XtmIjf2fHxvJnXmYSFldcjiHNs6zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386134; c=relaxed/simple;
	bh=nM0x+/p4MerQCNnFXufY8ca46/HitlqunY0NyMIAPYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qWcw7eT17hxe4qb7Hbqw8B1vfC89DJFBKuSpZ3LA3eWliYm27FfIOKBI9yt2CrF9aIBNJg82uZKbjapeQOkORvEIPtpyRQ23yA2DoQRY7MoogiUnKIi1IvqhZEWmFN8HAMUFdl4PsaVMWh1dq/tBuPdTAdmkfqQvwv6UkS7l6II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nvfYs6Jc; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nvfYs6Jc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789386132; x=1820922132;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nM0x+/p4MerQCNnFXufY8ca46/HitlqunY0NyMIAPYE=;
  b=nvfYs6JcZ4XnZO+eaqGE7znwS5/m2U6G9GCHOsCmZzHx05dTvSMJzpz4
   InEbQJicyb5TcvjFXSX39nyi0XhNa61ZS+dbb/I5iGwQGnrdUEUxj2/+R
   743mhKAkyXVMkKwALn6K5XtY0pji1SYENojwSl+Af8lJ73sUQIqCcHfBx
   K+6YaXNiMgHPZv8f+p2rWgsAsVksTtjxeQ3+6u8+oVw4kGD8L4LHSSsnR
   6vaZLSZ2t8XUY/w2JeYDjP6WEqr03aYOf33QryfjNSuPrU0OiwMQbkuOF
   RV7Drlfcx2QqUmGRPfHnTvJIhOFDJL2VZ3G3EzFxGSoHpN16/iJ7JbSjd
   w==;
X-CSE-ConnectionGUID: ajlWlHfMTPajkDg44Zqgng==
X-CSE-MsgGUID: haQ0FlSYT62XN1Q7dJHO7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="100397109"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="100397109"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:42:07 -0700
X-CSE-ConnectionGUID: nHO891I7ScCjCAdo3qEY8A==
X-CSE-MsgGUID: bLgrQRfQRbmJ5/JlTvaZiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="274538824"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.61])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:42:01 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id CAFF7121BC0;
	Mon, 14 Sep 2026 14:41:56 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x654D-00000002PYB-1C3p;
	Mon, 14 Sep 2026 14:41:45 +0300
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
	Rishikesh Donadkar <r-donadkar@ti.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>,
	Antti Laakso <antti.laakso@linux.intel.com>
Subject: [PATCH v8 12/13] media: cvs: Drop comments on sub-device operations
Date: Mon, 14 Sep 2026 14:41:43 +0300
Message-ID: <20260914114145.574791-13-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260914114145.574791-1-sakari.ailus@linux.intel.com>
References: <20260914114145.574791-1-sakari.ailus@linux.intel.com>
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
index 863112cde266..e2104ed2b932 100644
--- a/drivers/media/i2c/cvs/v4l2.c
+++ b/drivers/media/i2c/cvs/v4l2.c
@@ -72,19 +72,6 @@ static int csi_set_link_cfg(struct icvs *ctx, u64 link_freq)
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
@@ -130,19 +117,6 @@ static int cvs_csi_enable_streams(struct v4l2_subdev *sd,
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
@@ -168,15 +142,6 @@ static int cvs_csi_disable_streams(struct v4l2_subdev *sd,
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
@@ -187,17 +152,6 @@ static int cvs_csi_init_state(struct v4l2_subdev *sd,
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
@@ -320,17 +274,6 @@ static int cvs_csi_set_fmt(struct v4l2_subdev *sd,
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
@@ -419,12 +351,6 @@ static int cvs_csi_notify_bound(struct v4l2_async_notifier *notifier,
 	return v4l2_device_register_subdev_nodes(sd->v4l2_dev);
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
@@ -442,14 +368,6 @@ static const struct v4l2_async_notifier_operations cvs_csi_notify_ops = {
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

