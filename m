Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D673123AE62
	for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 21:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785014619; cv=none; b=eiCANk3gCJFn9mVqrVLwcmD07pGeXqlMbtEraJf4iHCALxUcDcUy6O1gBHt3GTgrXJz4B9PmBOuyWp0XZC9Ev4xqGMIqczaWejP2tfllaPL47BwIM5TnnP76OEHcyLfzVh0vgiQKIxE9UdP3642TvpiaTOHCGU+3nrG9RfV17i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785014619; c=relaxed/simple;
	bh=63I6GshLsF6G0YYnL0bCLpp1mRi03AwNdcgsFfx0ndM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AF5Xl3zNzp9X0bNelnFiD35ucBrfOeAFzGULWZsIH9HrnZmjc0NexlU++ZjUazwYaqrhRPPnUVxV1DMedSpYb/AjX5bCZPa8EvmxKA/6l25WyagjrASpVg2EdY105cdxmppJMyDh/z0vz3biDPwlbV75x7/VETFyOX0v8zz8An0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WT5wptcl; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WT5wptcl"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-81f52945098so22687017b3.0
        for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 14:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785014614; x=1785619414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hnwoTZI/CjHGO9JhDNo/oluFbGTy4zRjcWLTIQVf++k=;
        b=WT5wptclSuUzp6A+MD9qm0He9+hljpz7bApYI2Gu4x88WHIjoMmM7QcP9UN8/X2fH3
         bSiw8b8Vso3UO+2dyHmDaP6duUOgnKqHYAt83LySP80Qme264DFaRBTkzZZvQeOqeHwQ
         +dNP0S8hpPv2mWQZIms2JyoAklvGI6OIpZsLkImqkJadwQLatLuK9hbVlPw3x/gF5bVE
         UITMWNit3kO071m3gX7hgKig7AtUW77OMAwjrUDWlnm4Lstx3HF8m2qwtye8QB4Sm5nQ
         WL5Js68sphqrrzixrsyxczPG+6G+Nt+tfyDNUqBhnbGPLNFk1qswLCdIdfteO6IYQ+7T
         ptRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785014614; x=1785619414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hnwoTZI/CjHGO9JhDNo/oluFbGTy4zRjcWLTIQVf++k=;
        b=khF7D+VlewtJ2m9Paw0snjGGv5Ny8rewXu22C+W1P/piMXiawR5vib2kwnmZ/TQdS2
         6qps8Zea3oaHVt3seodfLkOUWPXR/UbZElMurC+GNYtY8AbPa9EzTfCTLD8Hb6upKdA+
         Ckn9VJL1Nqn+Ea+BRgH8mCpGdAPtzulQX7WlyphaUchZMF7A+yFds67wSuajpS0FGtCr
         5dLJhSWUyeT1WoABAdBRpSu+ZobupEFaczV85qGDM06Nl77VXXe6SQjy+hzFaEittu90
         Gt0198VuHPfq8GHd06LgIW55Bdq71oXY7YVpmJzXaTmZ9l+JDa2GE1rqhvP7VHjW+z8z
         Q/vw==
X-Gm-Message-State: AOJu0Yx5H7MLufeFotR1GEVJidGaJ/KIOUzZBbFUz/3DgFGa5pnWTkBS
	lwPkevIjOSL3WRZpWmy+H+NDOM1qZ1TUGInZhfJxVBlbbQDD9G+A/qba
X-Gm-Gg: AR+sD10gLlpMK1LsRVKEUsDE/4aku25l4mSIEEHzn9Iqj2RtLR1+K3YYt45cWDbusni
	GBKimyCQz1Wvvy2pUilbP3FyCL2uuW1UCrxMuexjBq/fzoaLMyhfWp2lp+f0ZbKpbifvO/5wWqh
	ufKEkupSHDcagD5qEK1jx82D1v4BqJMAqTl9KQzXPofzEPOBHGPXSSArPEQADPrHjRlp7WknYmO
	PF9vVVYt7Swdf0fAT6fmgygNgnEV32Tp6c9XdHI9wNry+D947/HmyeZxTNIh+j0ywF5VqZENX3l
	t5UdlQWYBKdaqVHb0EjDGAmn9xBisETn2xCrwXNya/kQrMAZgSPQLxSsXq8PC4qGDKHsrNHSfXi
	LZMATm6eN/ipryI3WMkS2EjnJNpzP7VUan114Y8OGUNfz1cdekmzl8c0D2YTU2+KsXeMWlETCou
	U=
X-Received: by 2002:a05:690c:6904:b0:80c:16ad:2f16 with SMTP id 00721157ae682-81f6a65b207mr9778717b3.8.1785014614458;
        Sat, 25 Jul 2026 14:23:34 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f65901d00sm14661557b3.41.2026.07.25.14.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 14:23:33 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Jordan <jordan.mymail@gmail.com>
Subject: [PATCH] media: uvcvideo: query pan/tilt position from the device on every read
Date: Sat, 25 Jul 2026 17:23:32 -0400
Message-ID: <20260725212332.64927-1-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CT_PANTILT_ABSOLUTE_CONTROL reports the position of a mechanical actuator.
On a motorised PTZ camera that position keeps changing for as long as the
movement takes -- seconds -- and it can change with no host involvement at
all when the camera repositions itself. The driver caches the value and
serves VIDIOC_G_CTRL from that cache, so userspace cannot observe the
movement.

The cache is invalidated in only two places: uvc_ctrl_commit_entity(),
which clears it for auto-update controls when the driver commits a
SET_CUR, and uvc_ctrl_status_event(), on receipt of a Control Change
interrupt. Neither covers a move that is under way. The first G_CTRL after
a write does reach the device, but it then sets ctrl->loaded and every
subsequent read returns that one sample unchanged until the move ends.
An application polling the position sees a single value frozen for the
duration of the movement.

The Control Change interrupt does not fill the gap, because the mechanism
is event-shaped and the quantity is continuous. UVC 1.5 section 4.2.2.1.15
states that a SET_CUR to the Relative control "shall result in a Control
Change interrupt for the Absolute Control at the end of the movement".
Nothing is defined for the interval in between, and no reasonable firmware
would emit interrupts at frame rate for the length of a pan sweep. A fully
compliant device therefore leaves the cached value stale for the whole of
every move; this is a property of the control, not of any one vendor.

Add UVC_CTRL_FLAG_VOLATILE for controls whose value varies on its own, set
it on CT_PANTILT_ABSOLUTE_CONTROL, and query the device on every read of
such a control.

The live value is kept in a buffer of its own rather than in
UVC_CTRL_DATA_CURRENT, which continues to hold the value last commanded by
the host. That distinction matters because a single UVC control carries
both axes: the pan and tilt V4L2 controls map to 32-bit fields of one
8-byte control, so uvc_ctrl_set() performs a read-modify-write to preserve
the axis the caller is not writing. Were that path given a live reading, a
tilt write issued a few milliseconds after a pan command would rewrite pan
with the position the actuator had not yet left, cancelling the move in
progress. Keeping the buffers separate leaves the write path untouched.

Values staged by uvc_ctrl_set() but not yet committed take precedence over
a live read, so that reading a control back inside an uncommitted
transaction returns what the caller wrote.

Report V4L2_CTRL_FLAG_VOLATILE for such controls, so applications know the
value must not be cached and that the value read back need not match the
value last written. Since writes to a volatile control are documented to be
ignored unless V4L2_CTRL_FLAG_EXECUTE_ON_WRITE is also reported, and the
driver propagates every write of a writable control to the device, report
that flag alongside it when the control supports SET_CUR. This is the same
pairing the control framework uses for a manual gain control while autogain
is active.

Measured on an OBSBOT Tiny 2 (3564:fef8) with this patch applied, polling
VIDIOC_G_CTRL on V4L2_CID_PAN_ABSOLUTE while a 0 to 90 degree pan was in
flight (values in arc seconds, as reported):

  t+109ms    pan=0
  t+284ms    pan=18000
  t+459ms    pan=61200
  t+811ms    pan=129600
  t+1161ms   pan=198000
  t+1513ms   pan=280800
  t+1690ms   pan=324000   (physical arrival, steady thereafter)

Without the patch the same loop returns one unchanging value for the whole
sweep. A raw libusb GET_CUR trace taken with the driver detached shows the
same progression, confirming the driver now reports what the device was
always able to tell it.

The read-modify-write hazard described above was tested explicitly:
S_CTRL(pan=90 degrees) and S_CTRL(tilt=20 degrees) issued as separate
ioctls 18ms apart, with pan still reading 0 when the tilt write was
submitted, leaves both axes at their commanded targets (pan=324000,
tilt=72000). The pan movement is not cancelled.

The cost is one control transfer per read of an affected control. Polling
the control at 5 Hz concurrently with an active 30 fps capture on this
device showed no frame loss and no change in frame rate. On a device that
merely echoes back the last setpoint the extra transfer buys nothing, which
is why the flag is set on pan/tilt alone. Zoom, focus, roll and iris
absolute share the same character and may warrant the same treatment, but
are left alone here as they have not been tested.

Signed-off-by: Michael Jordan <jordan.mymail@gmail.com>
---

Notes:
    Notes for reviewers; not intended for the commit log.
    
    - UVC_CTRL_FLAG_VOLATILE is defined in include/uapi/linux/uvcvideo.h beside
      the other UVC_CTRL_FLAG_* values, even though struct
      uvc_xu_control_mapping has no flags member and userspace therefore cannot
      set it. Keeping the whole flag namespace in one header seemed safer than
      splitting it, since a later addition of bit 9 on the uapi side would
      otherwise collide silently with a driver-private definition. I am happy
      to move it to drivers/media/usb/uvc/uvcvideo.h if you would rather uapi
      did not grow for a bit userspace cannot use.
    
    - uvc_mapping_get_xctrl_compound() still reads UVC_CTRL_DATA_CURRENT and is
      deliberately left alone. No compound control is flagged volatile, so
      there is no bug today, but that is the second place this would need
      wiring if the flag is ever applied to one.
    
    - Only CT_PANTILT_ABSOLUTE_CONTROL is flagged here. Zoom, focus, roll and
      iris absolute share the same character, a mechanical actuator whose
      position lags its setpoint, and focus absolute under continuous autofocus
      is arguably the more widespread case. I have not flagged them because
      pan/tilt is what I can exercise on the hardware I have, and widening this
      adds a control transfer per read across a great many devices. Glad to
      extend it if you think the argument carries.
    
    - Reading pan and tilt in one G_EXT_CTRLS call now issues one GET_CUR per
      mapping, so the two values can come from instants roughly a millisecond
      apart, where previously both decoded from a single cached sample. The
      skew seemed inherent to polling a moving actuator and not worth a
      per-ioctl generation scheme to share the transfer; flagging it in case
      you weigh that differently.
    
    - Testing: built and run on v7.2-rc4 (mainline); the posted patch is
      rebased onto media.git next and compile-tested there. Hardware is an
      OBSBOT Tiny 2 (3564:fef8). Verified that a live read tracks a physical
      slew; that two single-axis writes issued ~20ms apart both reach their
      targets, which is the read-modify-write regression the separate buffer
      exists to avoid; that pan/tilt report V4L2_CTRL_FLAG_VOLATILE and
      V4L2_CTRL_FLAG_EXECUTE_ON_WRITE while zoom reports neither; and that
      polling position at 5 Hz during an active 30 fps capture costs no
      frames. v4l2-compliance results are identical with and without the patch
      on this device (45/47, the two failures being the camera reporting a
      Power Line Frequency default outside its own min/max, present in both
      runs). Also checked an integrated UVC 1.00 webcam (1bcf:28cc) with no
      pan/tilt, to confirm ordinary devices are unaffected.

 drivers/media/usb/uvc/uvc_ctrl.c | 57 +++++++++++++++++++++++++++++---
 include/uapi/linux/uvcvideo.h    |  2 ++
 2 files changed, 55 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 3ca108b83..c6e0c9958 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -30,7 +30,8 @@
 #define UVC_CTRL_DATA_MAX	3
 #define UVC_CTRL_DATA_RES	4
 #define UVC_CTRL_DATA_DEF	5
-#define UVC_CTRL_DATA_LAST	6
+#define UVC_CTRL_DATA_LIVE	6
+#define UVC_CTRL_DATA_LAST	7
 
 /* ------------------------------------------------------------------------
  * Controls
@@ -302,7 +303,8 @@ static const struct uvc_control_info uvc_ctrls[] = {
 		.flags		= UVC_CTRL_FLAG_SET_CUR
 				| UVC_CTRL_FLAG_GET_RANGE
 				| UVC_CTRL_FLAG_RESTORE
-				| UVC_CTRL_FLAG_AUTO_UPDATE,
+				| UVC_CTRL_FLAG_AUTO_UPDATE
+				| UVC_CTRL_FLAG_VOLATILE,
 	},
 	{
 		.entity		= UVC_GUID_UVC_CAMERA,
@@ -1499,22 +1501,58 @@ static int __uvc_ctrl_load_cur(struct uvc_video_chain *chain,
 	return ret;
 }
 
+/*
+ * Query the device for the current value of a volatile control, storing it in
+ * a buffer of its own. UVC_CTRL_DATA_CURRENT is deliberately left alone: it
+ * holds the value last commanded by the host, which is what the
+ * read-modify-write path in uvc_ctrl_set() must use to preserve the fields of
+ * a multi-field control that the caller is not writing.
+ */
+static int __uvc_ctrl_load_live(struct uvc_video_chain *chain,
+				struct uvc_control *ctrl)
+{
+	u8 *data = uvc_ctrl_data(ctrl, UVC_CTRL_DATA_LIVE);
+
+	if (ctrl->entity->get_cur)
+		return ctrl->entity->get_cur(chain->dev, ctrl->entity,
+					     ctrl->info.selector, data,
+					     ctrl->info.size);
+
+	return uvc_query_ctrl(chain->dev, UVC_GET_CUR, ctrl->entity->id,
+			      chain->dev->intfnum, ctrl->info.selector, data,
+			      ctrl->info.size);
+}
+
 static int __uvc_ctrl_get(struct uvc_video_chain *chain,
 			  struct uvc_control *ctrl,
 			  struct uvc_control_mapping *mapping,
 			  s32 *value)
 {
+	int id = UVC_CTRL_DATA_CURRENT;
 	int ret;
 
 	if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0)
 		return -EACCES;
 
-	ret = __uvc_ctrl_load_cur(chain, ctrl);
+	/*
+	 * A volatile control tracks a quantity that varies without host
+	 * intervention, so the cache cannot be trusted and the device is
+	 * queried on every read. Values staged by uvc_ctrl_set() but not yet
+	 * committed take precedence, so that reading back a control inside an
+	 * uncommitted transaction returns what the caller just wrote.
+	 */
+	if ((ctrl->info.flags & UVC_CTRL_FLAG_VOLATILE) && !ctrl->dirty) {
+		ret = __uvc_ctrl_load_live(chain, ctrl);
+		id = UVC_CTRL_DATA_LIVE;
+	} else {
+		ret = __uvc_ctrl_load_cur(chain, ctrl);
+	}
+
 	if (ret < 0)
 		return ret;
 
 	*value = uvc_mapping_get_s32(mapping, UVC_GET_CUR,
-				     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
+				     uvc_ctrl_data(ctrl, id));
 
 	return 0;
 }
@@ -1840,6 +1878,17 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 	if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX) &&
 	    (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN))
 		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
+	if (ctrl->info.flags & UVC_CTRL_FLAG_VOLATILE) {
+		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
+		/*
+		 * Writes to a volatile control are documented to be ignored
+		 * unless EXECUTE_ON_WRITE is also reported. The driver
+		 * propagates every write of a writable control to the device,
+		 * so report the flag accordingly.
+		 */
+		if (ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR)
+			v4l2_ctrl->flags |= V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
+	}
 
 	if (mapping->master_id)
 		__uvc_find_control(ctrl->entity, mapping->master_id,
diff --git a/include/uapi/linux/uvcvideo.h b/include/uapi/linux/uvcvideo.h
index cbe15bca9..b22fee8af 100644
--- a/include/uapi/linux/uvcvideo.h
+++ b/include/uapi/linux/uvcvideo.h
@@ -31,6 +31,8 @@
 #define UVC_CTRL_FLAG_AUTO_UPDATE	(1 << 7)
 /* Control supports asynchronous reporting */
 #define UVC_CTRL_FLAG_ASYNCHRONOUS	(1 << 8)
+/* Control tracks a value that varies on its own; never serve it from cache. */
+#define UVC_CTRL_FLAG_VOLATILE		(1 << 9)
 
 #define UVC_CTRL_FLAG_GET_RANGE \
 	(UVC_CTRL_FLAG_GET_CUR | UVC_CTRL_FLAG_GET_MIN | \

base-commit: a52e6f7923c17a672135b485ffd96fbd72f46267
-- 
2.43.0

