Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A3F5349B6
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 16:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699794; cv=none; b=oWlqRms8fch0pz96ZBrJueJqwMf1kwVs6c1dhYlC4ENogMPizy4S5XtddTP+4pvR/utaZtLVs+7HgEpzPhSGI5aCLil+DZ5kDXrp3fixSld8Zed0dJ6G30TI+z1oDp64BOuKr9zHaBgHiCUvLZrHoKoAtqUankMv7ZlbfZH6abw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699794; c=relaxed/simple;
	bh=pjYrJ9i0qHLTf9O3mi8TxMKUEWpf47OoDqxCYILUe3c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AunzoK+4lM/es7nO59kFuH1zkePYPGFbqqMQ+YpGFnCYUcsAskrVqOQrJshSFFP56vTlD/MFrBEa+welWFAVWrXtYM3eUdqxE8Q3B/FlI/GbbVvcV7ShtQlKHrefuxy6levlVolEnKyFo4XfaWd+PGlmccv6q/kvdMrgntEj6Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LNTZD5aV; arc=none smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LNTZD5aV"
Received: by mail-yx2-f40.google.com with SMTP id 00721157ae682-8ab445ac183so10052527b3.3
        for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 09:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790699790; x=1791304590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v87Cgp68PWMd8kFdgdgVYnaWP/CXIf2dW1oTwO9m/XY=;
        b=LNTZD5aV7IMmmnDEIdaTXnRIyuV2vY/1f5AgHux8GY6Ex/ox8iDUhrQveaHZyTNzjX
         Y4UusdUBRYouAjQcI0XzFlwwxRMBesofftzpoAgVQ0E3J9944wUD9XwvkWgsnwyTFGN3
         nHmy0tQXkmqao6fE6xOQa1Qkv6OEwtlgBRPfd09EbkrvonHJznH5/b97+fYo6VPEQ0Bd
         LE1Grrbao0Ua57FPBaaaPsi/ieWjsj6B63tEr6lSCfuelboofSIeChjOpyVGPvn9gtpx
         oLYFsJ0CPp8EaLY9tzGypVpzJ7ViT50+8EIuNJAd68V1pY3VW5SMwQxBqT2xwvxzpkgQ
         S45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699790; x=1791304590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v87Cgp68PWMd8kFdgdgVYnaWP/CXIf2dW1oTwO9m/XY=;
        b=JoiJwUjwJrJusFJq8Nq2PVSusINhDBRsRK27YdcyD/7zb3C0EMJfPC+tM9Q9iU0GGF
         L2aM7gJQZRSbaHY9vF8gmnEw3AgflqxnZOUW321DNfRWFJOqi0ld5rK39IcfdUy9Tncp
         NLJg2vwVw8XCHHwCKhUkvXffvTO1F8FE9JwNr6dDH2c9jCU5PGJF1IROxbJwtQf8M9VN
         PXRVTVhzPJRNpTMmJs6BQQw5dbT7p3jgBgX4ox+xfdlLf9qAQoRQncJricPQ0aMOdCFy
         1vnDK/wAC6TGOr5QxQT7yGgd5fpOIsgA7VtKoUYd1RoqST8RvBHetcQXPaGH8iErdlUZ
         uNMw==
X-Forwarded-Encrypted: i=1; AKwUvBzEPHNziOv0iuodUticT4zwdoTsmhimwbl3ev9h2LfWJH7xpIfGyF19Y7R8s/IWDN/ccn9z5ugpTX4XOQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLCCPW0plbVstQT7INRkF1VAw5dqz1wXuc8JR5sFeour+5Je90c
	Sz2WNL16L6Fiobpa2cl+LokMDM1YKJBupV88jPei/9nuSJq2+VfP3RFN
X-Gm-Gg: AYBFou3BIOWyfeMuJSIRmeCDmISY3Xgrk3jLB7/MfMCJIdKy5jdmXE3SQkTD9lnEckv
	0/NDFT6ctefWP6cuYC3bMQuWmraYyC25CDPq/3InUTC5lsZK5nNtjEi2dlcNkrwo5Bc49XZh8pk
	unOdDrYylBoqhEpk0nqh+PTN9WlNVWQac/b2dtLPa9zl/UAcuL/9ntrovfRMgBB8QmIQXQ5HWXj
	0rGcTxZN5gvqcCM7Um1TKkkfH14pWDBTvv18O5gNeITez8MctxrHKtsRKAwAnGhLQVbH6sAwEDh
	iJLLVh4G/qQFMUUJFLsKG3f7ihe5lMUQua4NxU6ngqKKNWocBk9w5CREJ25P8Tk+mvdgslYyGDf
	fGeByupwvJQGx52Ia0UMgF1foJE8x4/0sLJInMAIrVlzt/KpTgWUchNKrns32zs5ExxHRdnXzD2
	eamhhxmgplSi7OV1MTDR29erV9Q1larYCCMeJ4+2w8T52vqf7KSkEI0m/eEyXHZp0l1hQTGB0WP
	Uak2fpuJ+dtiIy+HGt82+k7ABPeDXop0aUmBHMGnEVdC5i3PE4BRg==
X-Received: by 2002:a05:690c:9d:b0:820:1014:526a with SMTP id 00721157ae682-8a649591e12mr103054527b3.29.1790699790606;
        Tue, 29 Sep 2026 09:36:30 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8abc8549056sm1027117b3.0.2026.09.29.09.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:36:29 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Jordan <jordan.mymail@gmail.com>
Subject: [PATCH v5] media: uvcvideo: report AUTO_UPDATE controls as volatile
Date: Tue, 29 Sep 2026 12:36:28 -0400
Message-ID: <20260929163628.1004589-1-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Report AUTO_UPDATE controls as VOLATILE, and EXECUTE_ON_WRITE when
writable, to describe the driver's existing read and write behaviour.

Volatile controls must not generate CH_VALUE notifications. Filter that
bit in the shared event path for writes and device-status notifications,
including asynchronous completions. Keep flag-change notifications and
initial subscription snapshots.

Suggested-by: Ricardo Ribalda <ribalda@chromium.org>
Assisted-by: LLM
Signed-off-by: Michael Jordan <jordan.mymail@gmail.com>
---
Changes since v4:
- Resend only former patch 1; Hans merged patches 2-4 into uvc/for-next.
- Fix the EXECUTE_ON_WRITE explanation and spacing (Laurent).
- Filter CH_VALUE in the common event path, retaining other change bits.
- Drop the Reviewed-by tags because the event handling changed.

Tests on 7.2.0-rc4+ with the rebased UVC driver:
- Tiny 2: 31/31 PTZ/event checks pass during a 302-frame stream. Live pan,
  tilt, zoom and speed readback work. The same probe records 32 unwanted
  volatile value events with v4 and none with v5.
- Sunplus 1bcf:28cc: 17/17 ioctl event checks pass (v4: 11/17).
- Synthetic controls using the production event functions and real V4L2
  queues: 34/34 checks pass, including async completion (v4: 22/34).

v4: https://lore.kernel.org/linux-media/20260928215021.819064-2-jordan.mymail@gmail.com/

 drivers/media/usb/uvc/uvc_ctrl.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index c633ff7dbe72..70f724d5ec6d 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1841,6 +1841,16 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 	    (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN))
 		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
 
+	if (ctrl->info.flags & UVC_CTRL_FLAG_AUTO_UPDATE) {
+		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
+		/*
+		 * The driver sends every write to the device, even if the value
+		 * is unchanged. Report this behaviour for writable controls.
+		 */
+		if (ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR)
+			v4l2_ctrl->flags |= V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
+	}
+
 	if (mapping->master_id)
 		__uvc_find_control(ctrl->entity, mapping->master_id,
 				   &master_map, &master_ctrl, 0, 0);
@@ -2060,6 +2070,13 @@ static void uvc_ctrl_send_event(struct uvc_video_chain *chain,
 	if (list_empty(&mapping->ev_subs))
 		return;
 
+	/* Volatile controls do not generate value-change events. */
+	if (ctrl->info.flags & UVC_CTRL_FLAG_AUTO_UPDATE)
+		changes &= ~V4L2_EVENT_CTRL_CH_VALUE;
+
+	if (!changes)
+		return;
+
 	uvc_ctrl_fill_event(chain, &ev, ctrl, mapping, value, changes);
 
 	list_for_each_entry(sev, &mapping->ev_subs, node) {

base-commit: 7a7c915d6bae574d8f43a205d566a837af0d0868
-- 
2.43.0
