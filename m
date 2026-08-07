Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E42F4734FA
	for <linux-media@vger.kernel.org>; Fri,  7 Aug 2026 12:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786105558; cv=none; b=DBk1H6ucoDNHZfhUZcnLrVW0Nb0l83NsYCUKqkZX0c5KCz2uZ+bBOGHpIIzet6VfLCAfFbbZIrLYY4xJ8fCxgybpjzP6qbyhgIRmbR+aq13TlQoMDkffnN+WmuH/AX2DzgXAg0jihcUTzv7yCdIcHZ0RyzAS9j5eRMcr7D508is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786105558; c=relaxed/simple;
	bh=sKjyWQWRP3SE7mCM5EAXmyMs5H6AVUKPk/U6t2Kcrds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iW5+2e0RdX6AFnllTdeFE2oCsdMQFCTynvijLUGtNmQZ/eP9fTZHS4xAubB16mJtK52uOkJD00cG5312LiwisAnwuA0L7q76cMXzKLVlv9TMj5yGmu5YYCeQO0xBxnzKfuQYdWpVKuOhoGQkCmTc7pxcg+ZK5SN+7+LqxzmJXkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LlIIOmx+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LlIIOmx+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786105528; x=1817641528;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sKjyWQWRP3SE7mCM5EAXmyMs5H6AVUKPk/U6t2Kcrds=;
  b=LlIIOmx+l5nYYDImuC0KSKkv54F6wQjbQirbioF56h3OJQK5CghtlPWH
   wTiOT+XogVuaum3yNuaqbgY4kJWmW9UKUMxQlOh+s6EjM9nzSpLDT3Nz7
   leCWPToNsOaJVnkEKgIkTydq6i46yv0Or7/O8GGconU62jCxUH3wn8sKM
   QUgt3Ps5fkadaCQkq2rSXtsCyXVUsj7hCd2LYs/oeM/j4500MiHl58yDu
   HfGqIQ8YnUAYMyhm8ENZ+VW4QbDaRvmbqEMgKOW0ErizcuPWxiAcDgC8J
   EC4SY5RgHSUDiJUN1SpuMFNUjIVwjwhOnEIs+SfE91d/cxtkFPrEbwybw
   Q==;
X-CSE-ConnectionGUID: sOWISe2XQaa6nfUj8AYsbA==
X-CSE-MsgGUID: 2nc1GrfKQ32p/UOGR6dvew==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="90592025"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="90592025"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 05:24:37 -0700
X-CSE-ConnectionGUID: BUkFYmZqTLOCND6EE/dsmw==
X-CSE-MsgGUID: lv01ugOvQpS5J0H2TlNfQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="259779682"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.179])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 05:24:31 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A2211121CDB;
	Fri, 07 Aug 2026 15:24:20 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wsJcP-00000000Bw3-3LIj;
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
Subject: [PATCH v7 08/14] media: v4l2-subdev: Move op check to sub-device op wrappers
Date: Fri,  7 Aug 2026 15:24:03 +0300
Message-ID: <20260807122409.45807-9-sakari.ailus@linux.intel.com>
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

In anticipation of performing work for sub-device operation when the
driver doesn't implement one, move the check of operation existence to the
wrapper itself.

No functional change intended.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 92 ++++++++++++++++-----------
 include/media/v4l2-subdev.h           |  6 +-
 2 files changed, 59 insertions(+), 39 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index f392586d5dba..f53bac995822 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -244,20 +244,32 @@ static inline int check_format(struct v4l2_subdev *sd,
 	       check_state(sd, state, format->which, format->pad, format->stream);
 }
 
+#define do_subdev_call(sd, check, o, f, args...)	\
+	(!(sd)->ops->o->f ? -ENOIOCTLCMD : (check) ? :	\
+	 (sd)->ops->o->f(sd, ##args))
+
 static int call_get_fmt(struct v4l2_subdev *sd,
 			struct v4l2_subdev_state *state,
 			struct v4l2_subdev_format *format)
 {
-	return check_format(sd, state, format) ? :
-	       sd->ops->pad->get_fmt(sd, state, format);
+	return do_subdev_call(sd, check_format(sd, state, format), pad, get_fmt,
+			      state, format);
 }
 
 static int call_set_fmt(struct v4l2_subdev *sd,
 			struct v4l2_subdev_state *state,
 			struct v4l2_subdev_format *format)
 {
-	return check_format(sd, state, format) ? :
-	       sd->ops->pad->set_fmt(sd, state, format);
+	return do_subdev_call(sd, check_format(sd, state, format), pad, set_fmt,
+			      state, format);
+}
+
+static int check_which_pad_state(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state, u32 which,
+				 u32 pad, u32 stream)
+{
+	return check_which(which) ? : check_pad(sd, pad) ? :
+		check_state(sd, state, which, pad, stream);
 }
 
 static int call_enum_mbus_code(struct v4l2_subdev *sd,
@@ -267,9 +279,9 @@ static int call_enum_mbus_code(struct v4l2_subdev *sd,
 	if (!code)
 		return -EINVAL;
 
-	return check_which(code->which) ? : check_pad(sd, code->pad) ? :
-	       check_state(sd, state, code->which, code->pad, code->stream) ? :
-	       sd->ops->pad->enum_mbus_code(sd, state, code);
+	return do_subdev_call(sd, check_which_pad_state(sd, state, code->which,
+							code->pad, code->stream),
+			      pad, enum_mbus_code, state, code);
 }
 
 static int call_enum_frame_size(struct v4l2_subdev *sd,
@@ -279,9 +291,9 @@ static int call_enum_frame_size(struct v4l2_subdev *sd,
 	if (!fse)
 		return -EINVAL;
 
-	return check_which(fse->which) ? : check_pad(sd, fse->pad) ? :
-	       check_state(sd, state, fse->which, fse->pad, fse->stream) ? :
-	       sd->ops->pad->enum_frame_size(sd, state, fse);
+	return do_subdev_call(sd, check_which_pad_state(sd, state, fse->which,
+							fse->pad, fse->stream),
+			      pad, enum_frame_size, state, fse);
 }
 
 static int call_enum_frame_interval(struct v4l2_subdev *sd,
@@ -291,9 +303,9 @@ static int call_enum_frame_interval(struct v4l2_subdev *sd,
 	if (!fie)
 		return -EINVAL;
 
-	return check_which(fie->which) ? : check_pad(sd, fie->pad) ? :
-	       check_state(sd, state, fie->which, fie->pad, fie->stream) ? :
-	       sd->ops->pad->enum_frame_interval(sd, state, fie);
+	return do_subdev_call(sd, check_which_pad_state(sd, state, fie->which,
+							fie->pad, fie->stream),
+			      pad, enum_frame_interval, state, fie);
 }
 
 static inline int check_selection(struct v4l2_subdev *sd,
@@ -311,16 +323,16 @@ static int call_get_selection(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *state,
 			      struct v4l2_subdev_selection *sel)
 {
-	return check_selection(sd, state, sel) ? :
-	       sd->ops->pad->get_selection(sd, state, sel);
+	return do_subdev_call(sd, check_selection(sd, state, sel),
+			      pad, get_selection, state, sel);
 }
 
 static int call_set_selection(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *state,
 			      struct v4l2_subdev_selection *sel)
 {
-	return check_selection(sd, state, sel) ? :
-	       sd->ops->pad->set_selection(sd, state, sel);
+	return do_subdev_call(sd, check_selection(sd, state, sel),
+			      pad, set_selection, state, sel);
 }
 
 static inline int check_frame_interval(struct v4l2_subdev *sd,
@@ -338,16 +350,16 @@ static int call_get_frame_interval(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_state *state,
 				   struct v4l2_subdev_frame_interval *fi)
 {
-	return check_frame_interval(sd, state, fi) ? :
-	       sd->ops->pad->get_frame_interval(sd, state, fi);
+	return do_subdev_call(sd, check_frame_interval(sd, state, fi),
+			      pad, get_frame_interval, state, fi);
 }
 
 static int call_set_frame_interval(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_state *state,
 				   struct v4l2_subdev_frame_interval *fi)
 {
-	return check_frame_interval(sd, state, fi) ? :
-	       sd->ops->pad->set_frame_interval(sd, state, fi);
+	return do_subdev_call(sd, check_frame_interval(sd, state, fi),
+			      pad, set_frame_interval, state, fi);
 }
 
 static int call_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
@@ -361,6 +373,9 @@ static int call_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 		return -EOPNOTSUPP;
 #endif
 
+	if (!sd->ops->pad->get_frame_desc)
+		return -ENOIOCTLCMD;
+
 	memset(fd, 0, sizeof(*fd));
 
 	ret = sd->ops->pad->get_frame_desc(sd, pad, fd);
@@ -405,12 +420,12 @@ static inline int check_edid(struct v4l2_subdev *sd,
 
 static int call_get_edid(struct v4l2_subdev *sd, struct v4l2_subdev_edid *edid)
 {
-	return check_edid(sd, edid) ? : sd->ops->pad->get_edid(sd, edid);
+	return do_subdev_call(sd, check_edid(sd, edid), pad, get_edid, edid);
 }
 
 static int call_set_edid(struct v4l2_subdev *sd, struct v4l2_subdev_edid *edid)
 {
-	return check_edid(sd, edid) ? : sd->ops->pad->set_edid(sd, edid);
+	return do_subdev_call(sd, check_edid(sd, edid), pad, set_edid, edid);
 }
 
 static int call_s_dv_timings(struct v4l2_subdev *sd, unsigned int pad,
@@ -419,8 +434,8 @@ static int call_s_dv_timings(struct v4l2_subdev *sd, unsigned int pad,
 	if (!timings)
 		return -EINVAL;
 
-	return check_pad(sd, pad) ? :
-	       sd->ops->pad->s_dv_timings(sd, pad, timings);
+	return do_subdev_call(sd, check_pad(sd, pad),
+			      pad, s_dv_timings, pad, timings);
 }
 
 static int call_g_dv_timings(struct v4l2_subdev *sd, unsigned int pad,
@@ -429,8 +444,8 @@ static int call_g_dv_timings(struct v4l2_subdev *sd, unsigned int pad,
 	if (!timings)
 		return -EINVAL;
 
-	return check_pad(sd, pad) ? :
-	       sd->ops->pad->g_dv_timings(sd, pad, timings);
+	return do_subdev_call(sd,  check_pad(sd, pad),
+			      pad, g_dv_timings, pad, timings);
 }
 
 static int call_query_dv_timings(struct v4l2_subdev *sd, unsigned int pad,
@@ -439,8 +454,8 @@ static int call_query_dv_timings(struct v4l2_subdev *sd, unsigned int pad,
 	if (!timings)
 		return -EINVAL;
 
-	return check_pad(sd, pad) ? :
-	       sd->ops->pad->query_dv_timings(sd, pad, timings);
+	return do_subdev_call(sd, check_pad(sd, pad),
+			      pad, query_dv_timings, pad, timings);
 }
 
 static int call_dv_timings_cap(struct v4l2_subdev *sd,
@@ -449,8 +464,8 @@ static int call_dv_timings_cap(struct v4l2_subdev *sd,
 	if (!cap)
 		return -EINVAL;
 
-	return check_pad(sd, cap->pad) ? :
-	       sd->ops->pad->dv_timings_cap(sd, cap);
+	return do_subdev_call(sd, check_pad(sd, cap->pad),
+			      pad, dv_timings_cap, cap);
 }
 
 static int call_enum_dv_timings(struct v4l2_subdev *sd,
@@ -459,8 +474,8 @@ static int call_enum_dv_timings(struct v4l2_subdev *sd,
 	if (!dvt)
 		return -EINVAL;
 
-	return check_pad(sd, dvt->pad) ? :
-	       sd->ops->pad->enum_dv_timings(sd, dvt);
+	return do_subdev_call(sd, check_pad(sd, dvt->pad),
+			      pad, enum_dv_timings, dvt);
 }
 
 static int call_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
@@ -468,14 +483,17 @@ static int call_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
 {
 	memset(config, 0, sizeof(*config));
 
-	return check_pad(sd, pad) ? :
-	       sd->ops->pad->get_mbus_config(sd, pad, config);
+	return do_subdev_call(sd, check_pad(sd, pad), pad, get_mbus_config,
+			      pad, config);
 }
 
 static int call_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	int ret;
 
+	if (!sd->ops->video->s_stream)
+		return -ENOIOCTLCMD;
+
 	/*
 	 * The .s_stream() operation must never be called to start or stop an
 	 * already started or stopped subdev. Catch offenders but don't return
@@ -509,7 +527,7 @@ static int call_s_stream(struct v4l2_subdev *sd, int enable)
  * wrapper handles the case where the caller does not provide the called
  * subdev's state. This should be removed when all the callers are fixed.
  */
-#define DEFINE_STATE_WRAPPER(f, arg_type)                                  \
+#define DEFINE_STATE_WRAPPER(f, arg_type)				   \
 	static int call_##f##_state(struct v4l2_subdev *sd,                \
 				    struct v4l2_subdev_state *_state,      \
 				    arg_type *arg)                         \
@@ -526,7 +544,7 @@ static int call_s_stream(struct v4l2_subdev *sd, int enable)
 
 #else /* CONFIG_MEDIA_CONTROLLER */
 
-#define DEFINE_STATE_WRAPPER(f, arg_type)                            \
+#define DEFINE_STATE_WRAPPER(f, arg_type)			     \
 	static int call_##f##_state(struct v4l2_subdev *sd,          \
 				    struct v4l2_subdev_state *state, \
 				    arg_type *arg)                   \
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 04fa23b9a651..b8874eeec2e5 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1951,14 +1951,16 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
 		int __result;						\
 		if (!__sd)						\
 			__result = -ENODEV;				\
-		else if (!(__sd->ops->o && __sd->ops->o->f))		\
+		else if (!__sd->ops->o)					\
 			__result = -ENOIOCTLCMD;			\
 		else if (v4l2_subdev_call_wrappers.o &&			\
 			 v4l2_subdev_call_wrappers.o->f)		\
 			__result = v4l2_subdev_call_wrappers.o->f(	\
 							__sd, ##args);	\
-		else							\
+		else if (__sd->ops->o->f)				\
 			__result = __sd->ops->o->f(__sd, ##args);	\
+		else							\
+			__result = -ENOIOCTLCMD;			\
 		__result;						\
 	})
 
-- 
2.47.3

