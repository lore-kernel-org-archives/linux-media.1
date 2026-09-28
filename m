Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A170501F33
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 21:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790632228; cv=none; b=WbG+4OUILprLdSjETu2hTPVQhncVM5y7vNps5/szgo1+GIPT722Q4+2szplmuZ49oHRgFBfCABVGjioBHW1p3RcwnuCvkRPTD6Eska2EfcQDB4qbW49XOoYdnbWgcTT9Er1RjTDpEJJ31FWegKJLJa+Koo4mdF5JnkO1UCFG36Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790632228; c=relaxed/simple;
	bh=IIBHO+Sw6Iv9Typh78TXUOvYbodkq7YZ6nHtg3eT110=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=laW2hUMxi2msL+o4T+cI7qJNZpwIx5d4pnP7WhY8jSQh7oFpY1ai3Y85n0lhDXnyo3YBNv7i+0/hFjf/19QZKkOnZ4fk7KCt4AyB1HwaNDqsZh7+v6sL9y+L5+HhJ7IK3HimTIcXwaj4LldXLOx9sE4oRE9/ahOCz+P20Me6kw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LbJkubHp; arc=none smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LbJkubHp"
Received: by mail-yx2-f42.google.com with SMTP id 00721157ae682-8961cca9193so50485097b3.3
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 14:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790632226; x=1791237026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VOVKY+/2Y+5VXgBa8mexKsBUTTO8lhGPBPoG6WjQr6w=;
        b=LbJkubHp2Yoomfo/nlaF5bBqpUh6ZiXLvVZ6zcqb22Mclf1iBcyMg/l8C6yppVGOMN
         rLP639B0X0Uw4HbASwyETezvfE7MJxdPnQH379uiaEzmO4tCkk5+TiFwMxhVpjwKmw/4
         aUZvAHe6Kh6QDIp/yQeqU8fHQOui6ynugYBhgH4NGejI+bcRf7etAaAz93O4G+6DZxe9
         1EwSYYzh6K/EsYbpTWBIu4+cF66IfUMs13pP5hEGkH9Ceyyk/WFxAKkWTGUcHFnCzd2k
         g8SqFz6stpAvC3UCQ94j5X5wNFjTm7bIj0pUKAWBGnfEhaF+UEIGW82vL/+za+ie/rQv
         b9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790632226; x=1791237026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VOVKY+/2Y+5VXgBa8mexKsBUTTO8lhGPBPoG6WjQr6w=;
        b=sd7EXZn+3g05nRXgn6BlO4A9VvFmLEk/uOfVAFlHqtj6GS4pXdDD9eYQjvsGr6kZ1k
         Waw3ylOkoRm0elqbPyp09brs/dFbSzMFmuO8eQRw5ScC48HRMpBk1T/GTiJyn0CbVQ7u
         672X2B9SB3SJUIxwS4hHxmRw++t4hsTVn9Q1Z6cEgc5TZ280vc5Fd8FlneLl5lCAtJXD
         YdaCvBht+z4uiHhjCYYFYG6SOVOinaPy8vkppCbY1qRnnEV07TWrRkH4iXQk3tL3cX5C
         8Ed1pbfUCQnF6VpYsbusDeK3bqErWYCH3e+Uu6jUyTedrsKuOukWmGgUWJiebO5NWFLM
         ehDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFy4dE8Od5MoScR4PtKuclDC5Y09RbzVvAY4Lx2M0MEr1+h0Kxa3rw8UcXJgeV6e3PgrHEUhh4zppu0Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYKHVyOSB0YsB5UF/wrQ1RVwYfe/QCNKZyCtB0KHdqZ4lRc5UzGv
	wp+YrdX2sMdsi0PoMRRL6WFpp2GY9v+aXp+jHUszI8nHR4uIohGCwB+k
X-Gm-Gg: AYBFou2hWGE7WVwiA7dkKwNRXfYLaw3W+2Db/1ejpx62/lcengiSqZ9oOQomp3cqlzp
	fQC0AqDpd1L0xShCnfLFY01TC4wvzK4wWgOe6LeYQT6S5DuNdUGEdD290CGC5uoCzIZKiAqrIn+
	EkCEMqrm6Xkw/JFkgUp15cC4/QtQULGHdu45HXa6kxctdkvrMIq/XQlhHwDNUclxch8IcmCN4I2
	kdxmpeUaD4I3cZ6F6b5HTuSj+/wtGVbNAGiKHlj29ejOWtEE7QVIA049Y57joy35z96UY52srU9
	rbZ+qTHq16hEJW27vvwRWYEOheBuTgRdoXK0l0LKilOhWtZHp9VG0s4hv19vUNnKj2biMsrtaIH
	idu/aQ4U2WDHyy/29okaSyzx8x5+/zcFn2mKdCuPmi6ZJeIxoQiGq4Q7FNOTj65Y7wRi+q2cQiF
	7SJ9My9vhUM4zGg2ov9Tf4R2vRvJJ4Qu3RnZX1UaUv25pZMjUCj78DcP6KKhtGTKInEkZoCvpsI
	qeD9eptT9QhiKuHxhWM9ABhFSkKmuQ/LdddkZsYfKBGt+V7y2TmaQ==
X-Received: by 2002:a05:690c:3489:b0:8a9:3c0c:936a with SMTP id 00721157ae682-8a93c0c94c1mr36945387b3.35.1790632226346;
        Mon, 28 Sep 2026 14:50:26 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a861012f4dsm50897647b3.37.2026.09.28.14.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 14:50:25 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Jordan <jordan.mymail@gmail.com>
Subject: [PATCH v4 3/4] media: uvcvideo: fix up missing AUTO_UPDATE on the OBSBOT Tiny 2
Date: Mon, 28 Sep 2026 17:50:20 -0400
Message-ID: <20260928215021.819064-4-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928215021.819064-1-jordan.mymail@gmail.com>
References: <20260928215021.819064-1-jordan.mymail@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OBSBOT Tiny 2 does not set AUTOUPDATE in GET_INFO for its pan/tilt
and zoom controls, so reads return the last value written. The camera
moves them on its own when tracking a subject, and sends no control
change events.

Add fixup entries for the three controls.

lsusb -v (device descriptor and Camera Terminal):

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
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Assisted-by: LLM
Signed-off-by: Michael Jordan <jordan.mymail@gmail.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 64c90c380d3d..49ea6a6bcf57 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2876,6 +2876,18 @@ static bool uvc_ctrl_fixup_flags(struct uvc_device *dev,
 			UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX |
 			UVC_CTRL_FLAG_GET_DEF | UVC_CTRL_FLAG_SET_CUR |
 			UVC_CTRL_FLAG_AUTO_UPDATE },
+		{ { USB_DEVICE(0x3564, 0xfef8) }, 1,
+			UVC_CT_PANTILT_ABSOLUTE_CONTROL,
+			UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG_GET_RANGE |
+			UVC_CTRL_FLAG_RESTORE | UVC_CTRL_FLAG_AUTO_UPDATE },
+		{ { USB_DEVICE(0x3564, 0xfef8) }, 1,
+			UVC_CT_PANTILT_RELATIVE_CONTROL,
+			UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG_GET_RANGE |
+			UVC_CTRL_FLAG_AUTO_UPDATE },
+		{ { USB_DEVICE(0x3564, 0xfef8) }, 1,
+			UVC_CT_ZOOM_ABSOLUTE_CONTROL,
+			UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG_GET_RANGE |
+			UVC_CTRL_FLAG_RESTORE | UVC_CTRL_FLAG_AUTO_UPDATE },
 	};
 
 	unsigned int i;
-- 
2.43.0

