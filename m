Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991914D487C
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 15:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790954963; cv=none; b=K0abWB969Qb3C/lHBy0rteU94lk5Qm+fjJ+TpSC1GHK9jNg9mJtRiXCCxK2zd+uNhuBQVgx7Fs6tGxd2OzSISOalAkoIzNBmbM0MAZNcIG+8UCSXti3D5Fw96rjvUuUGKpadnbCbwrJsE7Apt+kDl/t+4MzJofrto88Cw20jlRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790954963; c=relaxed/simple;
	bh=+OBjYQGtLlurh1faTG96XQPXKsb0cUKChMpKN6GSHpQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P7VmzKSpgkC0aiQOeIZxfzjRL31P6graMO8eChOD7l+Ud2zReLbjiAIptCQ5ITDQsdk4IdguJb3UW9y4b6/8l9buNDuKXNBIfDpDjtap+XxxLeGNEkKiVrQo18RlnfFuRlvqC8njchk3wg6100zL2XVRqfafzi5FKRlSH/2N98E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fOgg0TlI; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fOgg0TlI"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba330dbd67so3613135e87.0
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 08:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790954959; x=1791559759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GUCbF1X+LhYYU0qbeAvTrQr5Hsx9TGU8eackVdXgsqk=;
        b=fOgg0TlIKXJDPlWMr9E9RjPiaB72Z/pnpsB10yY8y1GHGMz31Lc0JidCDcc1X5CyQD
         grudkemrmsHXQNCRZ5fSacIfMwUrchq4Bkz9YtqJdgy2AgiJAtuISXWbCLytxZ29bttJ
         6Dy4fbfrCcCxMDIiqRGkdQjGQ6Oj9uxA5ZTq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790954959; x=1791559759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GUCbF1X+LhYYU0qbeAvTrQr5Hsx9TGU8eackVdXgsqk=;
        b=A85Sswu+kvrorhLk9ER0paNmwF9s4YRDfstWOmHiUL0YZjvvn5hzmfTcICUh4vjN0f
         A92qZuQMcyYT42QBsNLwM1TCn8QM6wJHYNde/pTXlQc2Ywu/kZXUldyRRWHLnGNsK3lM
         8GG0bbKmkA53C91SspICXF0stkEdEo0mHItBtKJ7YKsp/kycHIntTLooZzyrC4s/196f
         FsLu8+HNVa+tf63cRCIH1LwXP9L+SW6EyT1vCR2ltypmIefp4HQqOp2iNyBX+KzsYrNP
         Qrrm0boEgqTdBW2kMwLYko+0FZKDivK1LF6HdTVP51a8c7KiW8x1bZip0NWndV2YdLZd
         vVzw==
X-Gm-Message-State: AFq9FYJI0JhZqqQxCJf+6+BNk248pJ/Z2HriT8oiAUb7y/57/tryT37+
	BwITKRN9g/hUwoBOrM+jDaHuUGlZPt2L1qdZthRPURccVTvdrKILNE6ECsYZ0Ij9a58pNQO9Yus
	XbDIdEg==
X-Gm-Gg: AYBFou0JYQf+XzbAoLO+fqdX+E6eqLAhKmVzLDFtvHKUs2WlxNI6QbpV0QO4NnliYTI
	lHnGDpmY8eUvs8s9SKunlHo/5YPmdQY3Libdl6U5WmWFtQjIeRm9u83my34aiZfCQqdyGGjqcrd
	2r328mvsHWcYuBA3K/h26O9nVIxHOcOgjeXsJdHIczCjchVVzPLd3fllpcXsOxNjBnZKUkbTUQF
	hz3RTum0xhcBFbi3gAaMT48tahM8th9Ls4bL/xho7YULBXYBg3X6GfqNd4pGVJx8CjsjsOnMBDj
	LW3o/pW38bJyARBjHvpSeb3Ovc6GT1EaH3Et+wKAwCrbjxjcxSt95kogE6QhnjNga5MxVvq8NGs
	l78O1tcr0jN5XmhG7CDNHOkj7AgSS2/Xp1yss7K/54Jk64E3Fk9v3qOpQRJWFI7UNPN8X0d55gK
	rWKIdtkh3D1d3+5ZTdC+bs6yFQ1eQiUnDwVoHLRnpBtF0f/P4JndctZ2gj2cTUHREdLl5Z7wuvK
	Gcgr8kwjTA3FjcWRYaywv9ucA1ob++mmZmdEoPy/I9KxG+wggz9SoU=
X-Received: by 2002:a05:6512:b96:b0:5ba:43ff:3bc9 with SMTP id 2adb3069b0e04-5bb9370edcamr1375179e87.3.1790954959625;
        Fri, 02 Oct 2026 08:29:19 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c718f62sm835544e87.12.2026.10.02.08.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:29:18 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 02 Oct 2026 15:29:07 +0000
Subject: [PATCH 3/3] media: uvcvideo: Sort all the uvc_ids quirks
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-uvc-sorted-v1-3-65f52e4d7e16@chromium.org>
References: <20261002-uvc-sorted-v1-0-65f52e4d7e16@chromium.org>
In-Reply-To: <20261002-uvc-sorted-v1-0-65f52e4d7e16@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

We seemed to have some devices out of order. Fix them.

Also, add a couple of auto comments to help the CI identify what parts
needs to be sorted.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 049566a4e5f7..45267a59003a 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2550,6 +2550,7 @@ static const struct uvc_device_info uvc_quirk_force_y8 = {
  * Sort these by vendor/product ID.
  */
 static const struct usb_device_id uvc_ids[] = {
+	/* keep-sorted start block=yes */
 	/* HP Webcam HD 2300 */
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x03f0, 0xe207, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_stream_no_fid },
@@ -2582,6 +2583,22 @@ static const struct usb_device_id uvc_ids[] = {
 	/* Logitech, Webcam B910 */
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x0823, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_WAKE_AUTOSUSPEND) },
+	/* Logitech HD Pro Webcam C920 */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x082d, USB_CLASS_VIDEO, 1, 0),
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_RESTORE_CTRLS_ON_INIT
+					       | UVC_QUIRK_INVALID_DEVICE_SOF) },
+	/* Logitech HD Pro Webcam C925e */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x085b, USB_CLASS_VIDEO, 1, 0),
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_INVALID_DEVICE_SOF) },
+	/* Logitech HD Pro Webcam C922 */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x085c, USB_CLASS_VIDEO, 1, 0),
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_INVALID_DEVICE_SOF) },
+	/* Logitech Rally Bar Huddle */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x087c, USB_CLASS_VIDEO, 1, 0),
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_NO_RESET_RESUME) },
+	/* Logitech Rally Bar */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x089b, USB_CLASS_VIDEO, 1, 0),
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_NO_RESET_RESUME) },
 	/* Logitech Quickcam Fusion */
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x08c1, USB_CLASS_VENDOR_SPEC,
 					1, 0) },
@@ -2600,22 +2617,6 @@ static const struct usb_device_id uvc_ids[] = {
 	/* Logitech Quickcam OEM Cisco VT Camera II */
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x08c7, USB_CLASS_VENDOR_SPEC,
 					1, 0) },
-	/* Logitech HD Pro Webcam C920 */
-	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x082d, USB_CLASS_VIDEO, 1, 0),
-	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_RESTORE_CTRLS_ON_INIT
-					       | UVC_QUIRK_INVALID_DEVICE_SOF) },
-	/* Logitech HD Pro Webcam C925e */
-	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x085b, USB_CLASS_VIDEO, 1, 0),
-	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_INVALID_DEVICE_SOF) },
-	/* Logitech HD Pro Webcam C922 */
-	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x085c, USB_CLASS_VIDEO, 1, 0),
-	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_INVALID_DEVICE_SOF) },
-	/* Logitech Rally Bar Huddle */
-	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x087c, USB_CLASS_VIDEO, 1, 0),
-	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_NO_RESET_RESUME) },
-	/* Logitech Rally Bar */
-	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x089b, USB_CLASS_VIDEO, 1, 0),
-	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_NO_RESET_RESUME) },
 	/* Logitech Rally Bar Mini */
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x046d, 0x08d3, USB_CLASS_VIDEO, 1, 0),
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_NO_RESET_RESUME) },
@@ -2810,6 +2811,8 @@ static const struct usb_device_id uvc_ids[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x8086, 0x1156, USB_CLASS_VIDEO, 1,
 					UVC_PC_PROTOCOL_UNDEFINED),
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
+	/* keep-sorted end */
+
 	/* Generic USB Video Class */
 	{ USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_UNDEFINED) },
 	{ USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_15) },

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

