Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F66355F53
	for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 15:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787930772; cv=none; b=o799ZgFIK3lQ+ldQlppXJQcjgc6NR5A/AozafpldZVI8724P9iD/vbFEmWQY5tILZ2TRSlcM+pEoEKFsq9+F8zXiD1IpCFh5OCiX3OUT8bR+FlCeMSJAcN+X9/Xp7gd2VLwGXRh+AA/7OddVbW4fG2cOifVanpoyIi5dFIoigPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787930772; c=relaxed/simple;
	bh=ZOguFcivhQebaCZdvAdChppwsdQRvXUaHxBlHAuDnTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=faXpKc/Q/xDMqgvCOSnMksQOZzu18WvkVhxhai78BW9/rv/9+0Sk4cg3yO3TuBi0FbSoyTBvoKqx/ICKhxlaZLPEkE3D60vAEqmEqg7Q/3rLvI302I/V7+hn6+0Xwo/3rKx/P00cfFIUtJUgFsx4f61RwaEFt3fbOFOoc7P60GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lnM4x7m1; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lnM4x7m1"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-836c8bde2dcso13491377b3.0
        for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 08:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787930765; x=1788535565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=awMxog1ORn7hAaBz+LF6rq8r+AfuEBb2ZunK4hEYB/Y=;
        b=lnM4x7m1DKpUpgrxhQbC0HeuAUiwJXgPQtP+vyn1J7nqKOoUThVdepecw/bI4WsB9o
         c6Tf8lYH/450KgLvOrhBIhYL6CEjKl9liiVvB/AZOrWviOt/GO1aG4z7OwY+c48BuM1o
         Ykk8y3xt096QoJaSsFHoTc/XT5W/AZTnBsIM8n1kjQjrcj/0KE1Y2BLz6g9OLjxbmSIJ
         ItD7bLtTuv07dFnhzc0uapRTO/gzLnNXqB5oNguSSKaV5an1CKy9NsIlvC3WNuOfEfWV
         Tb8M2UvUdYY9MvK3vK9JuFz0MynXzJWCTL/SVdQnqrQ6GHsuU6zitGycBuEmvsnp2P0E
         jcuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787930765; x=1788535565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=awMxog1ORn7hAaBz+LF6rq8r+AfuEBb2ZunK4hEYB/Y=;
        b=rLk+GI+mhEeKUkUUBjLVs4B9IGX2TxF2rFpTllFTp99kbKVHewcUctlBdJWJeIIdTQ
         Ta36arBAujGUvgloe2QJ7uN1qYI4tIJVWM+dYa0x+srKuGVHWUYcqjhRS3AcrMc2x42L
         JeHHqqj+xuRAZYxp719HGcQskjQmUBryqxiq1biUfsiLMHFjG1MkCzKCJHHlTGrQ80l0
         UFnuoEVgZ07BxD4Db/5ZrxuMdRJv2RhrzC9Hd5Uoa+2Om9ayGHHC/o1v4UjBg55YCjcH
         Eadk0hpe/+i/zbOypgxwYAq+qZERglTbpWjaxdfFIM86MDpmzp/kmJ5IUtsJiDkAjXAR
         8Oow==
X-Forwarded-Encrypted: i=1; AKwUvByllBpVQGxnlfAjH7tPXb7g5hFUOLW6plUoa4ZeEA+5rZy1SuicQN9XicNg8273zh9OaVYqG6oUIZbC8g==@vger.kernel.org
X-Gm-Message-State: AFuF++nvYN9d9io/iJvwg3o7qKMDLjJQSfU83zQc7FTMs6TaZIJY3S66
	Ipg0LV7pzXdlH3JuTFDo2b+GIOZVE0YmoQwhG0y9Ggug9XcGAv4kLuLaVBqscDxx
X-Gm-Gg: AYBFou2xI/BmtirrdAXGeKwPzua+E0O8Omu3o3FqBj1NytV0p63a4k785+p1idBbams
	Phd4rKPATyF+bBLrMru85B8/wt1BzQRf0+vkqw0T3Q5nvA7N2ZfkkdPYvwui/GjC4hKTz6gB1zn
	WQWaKu6/rosjWssXitI7a1R7mBSqgQJusl3YSvV6FQKQiKt6ISPtvpZEdY00t/VBCuDz7gTDK/A
	Nzm2Po7cuZrGRSlU2qhpBZ0Ic89Tv2zYDebf9vi7sD7kDlg2SIKa2Prlw3BjT0r7jZbJLZ/ERUK
	GeZmWha9WMOHiFhLWM5UkDVsAH3LzRGOViZ6/kIzKg3XAxnkdJvcHcKpey14sZjX2BqgNHZvAH6
	RnJ7sz8eK1dAuAacDqQy80sE034gggIj6KNblJ2fQDf6nsRJVeYqS3e+7dy4pMKmkwcYvhU1m2z
	2MmJG7b2eFlAXi/TwxYOwZKJmqBDVx4/BXUPcJsUxaXrjmbBz1Cn8DaqkMPpgi5swMsgnSGgzf/
	2rMQXppJUzHLAvHxtZL1l1kiln/D07pAdkqR8yy7YQBGL+b/hjp8w==
X-Received: by 2002:a05:690c:605:b0:81e:799f:d55e with SMTP id 00721157ae682-85d6b27675emr39397517b3.19.1787930764876;
        Fri, 28 Aug 2026 08:26:04 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e6756e0f3sm8064327b3.43.2026.08.28.08.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 08:26:03 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Jordan <jordan.mymail@gmail.com>
Subject: [PATCH 3/3] media: uvcvideo: fix up missing AUTO_UPDATE on OBSBOT Tiny 2 pan/tilt
Date: Fri, 28 Aug 2026 11:25:57 -0400
Message-ID: <20260828152557.653475-4-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828152557.653475-1-jordan.mymail@gmail.com>
References: <20260828152557.653475-1-jordan.mymail@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OBSBOT Tiny 2 (3564:fef8) answers GET_INFO for CT_PANTILT_ABSOLUTE
(entity 1, selector 0x0d) with 0x03 -- GET and SET capable, but with the
AUTOUPDATE bit clear. It returns the same 0x03 for every Camera Terminal
control queried, so the firmware is not computing the byte per control.
uvc_ctrl_get_flags() takes the flags from that byte, so it clears the
UVC_CTRL_FLAG_AUTO_UPDATE that the static uvc_ctrls[] entry sets for
this control. Without AUTO_UPDATE nothing clears ctrl->loaded after the
first read, so uvcvideo serves the control from its cache indefinitely:
VIDIOC_G_CTRL returns the last value the host commanded, never the
actuator's live position. On a motorised PTZ camera the position keeps
changing during a move, and changes on its own under the camera's
autonomous subject tracking, so userspace cannot observe it at all.

Add a flags fixup entry restoring AUTO_UPDATE, alongside the flags the
control already has, for this camera's pan/tilt control. With
AUTO_UPDATE restored, the rollback at the end of every
VIDIOC_G_EXT_CTRLS runs uvc_ctrl_commit_entity(), which clears
ctrl->loaded, so the next read re-queries the device and reports the
live position. The fixup replaces info->flags wholesale rather than
OR-ing, so the entry spells out the full flag set for the control.

Tested on an OBSBOT Tiny 2: without this, a read taken while the gimbal
is moving (or after the gimbal is moved by hand) returns a stale value;
with it, VIDIOC_G_EXT_CTRLS tracks the physical position on both axes.

The vendor has been asked to fix the firmware (support ticket #8220,
2026-08-04); no fix is available at the time of writing.

lsusb -v (device descriptor and the Camera Terminal):

  Bus 003 Device 006: ID 3564:fef8 Remo Tech Co., Ltd. OBSBOT Tiny 2
  Device Descriptor:
    bLength                18
    bDescriptorType         1
    bcdUSB               2.10
    bDeviceClass          239 Miscellaneous Device
    bDeviceSubClass         2 [unknown]
    bDeviceProtocol         1 Interface Association
    bMaxPacketSize0        64
    idVendor           0x3564 Remo Tech Co., Ltd.
    idProduct          0xfef8 OBSBOT Tiny 2
    bcdDevice            4.09
    iManufacturer           1 Remo Tech Co., Ltd.
    iProduct                2 OBSBOT Tiny 2
    iSerial                 0
    bNumConfigurations      1
  [...]
        VideoControl Interface Descriptor:
          bLength                18
          bDescriptorType        36
          bDescriptorSubtype      2 (INPUT_TERMINAL)
          bTerminalID             1
          wTerminalType      0x0201 Camera Sensor
          bAssocTerminal          0
          iTerminal               0
          wObjectiveFocalLengthMin      0
          wObjectiveFocalLengthMax      0
          wOcularFocalLength            0
          bControlSize                  3
          bmControls           0x00023e3e
            Auto-Exposure Mode
            Auto-Exposure Priority
            Exposure Time (Absolute)
            Exposure Time (Relative)
            Focus (Absolute)
            Zoom (Absolute)
            Zoom (Relative)
            PanTilt (Absolute)
            PanTilt (Relative)
            Roll (Absolute)
            Focus, Auto

Suggested-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Michael Jordan <jordan.mymail@gmail.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index b16a5cc0d..379ee51bd 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2876,6 +2876,15 @@ static void uvc_ctrl_fixup_flags(struct uvc_device *dev,
 			UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX |
 			UVC_CTRL_FLAG_GET_DEF | UVC_CTRL_FLAG_SET_CUR |
 			UVC_CTRL_FLAG_AUTO_UPDATE },
+		/*
+		 * OBSBOT Tiny 2: GET_INFO on CT_PANTILT_ABSOLUTE_CONTROL is a
+		 * stub that reports GET|SET only, clearing the AUTO_UPDATE the
+		 * driver's own control table sets for this control.
+		 */
+		{ { USB_DEVICE(0x3564, 0xfef8) }, 1,
+			UVC_CT_PANTILT_ABSOLUTE_CONTROL,
+			UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG_GET_RANGE |
+			UVC_CTRL_FLAG_RESTORE | UVC_CTRL_FLAG_AUTO_UPDATE },
 	};
 
 	unsigned int i;
-- 
2.43.0

