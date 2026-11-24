Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514795;
	b=gY+VVuP9Naq3PiVRwxBj9/NAWBty5HmfaLJUohsVdjm6ii+8sOl04z0RpxADeKQHgIhd
	 jklvp85GCOrzkXucuGkZFLRJr4jRldH5FtBUPD2YQ5ExizFn3ZpjIeklNw8qysA2vA9KL
	 M83EFr1QDoC1IdwqO9zZGHZNN9SKoppCqkJo+BHf9us3zoJ/I7FeOgJi76BPotOB7Sqd2
	 ZA2zRZCq6Mit/ScDVT45VX9NmnERMxPKRKVclL1y0m3Rmx/misFFR98AakBDOlp+Wr2Ql
	 YWT7zk1doXagqGQp358+WDkuVRzC5tw8q71m88xGOYSIcUB1KrVM0abf/wJJJdexAdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514795;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=r7DitdOlHqA5mEYHwEterBTbi/yNYMUAPnVhvFCyj2E=;
	b=dknbpY6y1j440/lJkVyJJPPEO1dnLXkes7dTk0Jkz4H9ltqKF4QnILTz0CGSivnZi0qS
	 mdTCR/OFyBcgbHEClRnj/XQyCJ4OFoBRdzVnZrXsWBVKq5oafmMSs8axR2rmU6GVnBsyH
	 7UoIp/JXhLJUCL5f6A6UrNA155R5iKMDy5U+prpLJB1H0bal3tOO1eAP1sm6858rPTtAd
	 KKYO+JnCecQBjsepTEhnK8EqlKnh55FyRRs7+wHgkoNg+2GlEqHOL4nMTb6Uvaclk/l04
	 B6WEEwayDJXPr+J44LclTYvpB2vqj/7Wl3eCgytwZOrE4iFs+Y2TIMbaciChSHCCmjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=VQwSJE5o;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D59A606A31E
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 10:06:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D59A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=VQwSJE5o
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1DACD3FE38
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 10:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1795514787;
	bh=r7DitdOlHqA5mEYHwEterBTbi/yNYMUAPnVhvFCyj2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=VQwSJE5ojtBuoWydDA7f2Yjon5khS2NwZfMnOg4Q1GY18ko1WV336jo4OdnDEGDWO
	 A/F2NdjEmoHBd+MbVV5CbX9/UCtBLgFE1CNKjcMahuFQmhxQqDFnmtAHCGkpm4X1Nj
	 HB9RHV9Lx4dR1xtCTMi+6Wyr2+n4AtLtqQ+tBxDozIZM28iJKyGB/WcLraAVRitZU3
	 yY/KTRzF2vtqceX/ziombk5IZb11WtyTvKmRj8E0kYkvK5X4JZFm63ceMgVf+sgNW9
	 f8o3Qaj8d0tfG4ebXeuWTpCLH7/gCR3dssNigoX128Dtg7TH8ubej1um/8t7A6eoZa
	 4seRhQoTltwfIl7F/XbZmu+ut59fngSKu/PPR3fkpz4tmQeO3ZmPq3SgAyzf9EhgFx
	 Tqjs7VtnxzWl9uC4Tph0EvhqAjxbaAdykqrYb1EX2jTQEd7sfPYOc2B+CDQNHNeXJI
	 x+MVDuzm5xwtjL1yfJnCCfEvtJDunrqbDZbIivZ3eRL8k0Zmtrqe/RU18DplK3iTRO
	 sFqB1P/3449274KEeWUJmAAZWFDh1y1u7DiN1LJSrJc2GolechM0kQt4poF4vaDy3W
	 qWtjmW4MbexPhqs6PQDfVm5fNDtKQHg3if69JMwUQf1GJ0nSiqmw1R0WKDl3GjKB5l
	 KUZL9OYpyyCgBBvhIgu8psxY=
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4bb69d84053so29960745e9.0
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 02:06:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514787; x=1796119587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r7DitdOlHqA5mEYHwEterBTbi/yNYMUAPnVhvFCyj2E=;
        b=WVC1Qrs1jFRkcWWvzEpeO8UlBTI/kroXUUvi/qVREnp44/323BXReXmbiqOKNabtRi
         A4KnpzF5RnBIxswP8Jfzbq/EUlvATKQ9dmahMfmgim8K+565NC2GcnKJ9AKdfSxeUI2I
         2kdABPhZxnxdfdAQ+xbLAvEkT1a/uRQ1JIRqOstEgdqyO8foiHOx7xBNy/wus6A3V/Ib
         dwai296wTy5JG3n+9Pkjdm5oFVR6+GQIdlbgkP5JH/j5Ec9KbnGs7Ed/NTuLZQHYTuU5
         btFJJyyOTsBKMW50rOotknsaisDxB+ogNmgCSu431YVvKKBy972X/yBP3x6lw1nPcyPf
         1Hmg==
X-Gm-Message-State: APuU4Z+sFKFrI30p7IuauPRNmUS6tfiA4aFPK+Sc0aTk1jSxBkZgpfNP
	RyLfZRgRQzaz5/x4kP6fmCDheZMQdY4zNc+CVaSioFj8rMcLmGCfdl/NI1mvu77ZT+EJQ1+ujFI
	m4eDFiknQU5kwpTKa1KHiDgq9qWx6qvHAcP/F7pgflGqILYeLOmgWrsH3tDRy4XNkVOd+Y+0/Lf
	3mb/P1NZQVvjIQ
X-Gm-Gg: AZFdTZdPVCxkxt769LswwcG2cKJADZt85nyX/+8yjLD3EyJxKAElmEynJG/yDlo2rDS
	W44/C8hg0GaUgrQSxrkIyM923ejw1B3NC10C2aijbTfZPQ9aSmHk8ziwGRKoNQD+r+A4U3s/yZ9
	c0yNaoaCTCtaVLtEyRyHZBFbyK0dAzWGq82afCXlRORfc9lpLkh2o+1WKJDkUn8ceSvQ4E6lPKN
	nBxqveQlTkJZUVm8/dyjo0gIgeNeRvOkIKrOyyWw7JmLDF2hKQrp1ZwV7vGyMEeL0AS6bWBxhSB
	lxJOAtEl0Ood0mC3rYVg8+7t676mivMsxcREEtXTaXXBShDI2afdY36eRRfvpaZ3aOnpNymb0+s
	5LgHcuLPZ2S80+Lecutyq0zkW8hcEMtuGpeK8vRB1wRTI2rqQl57gUP8bqaGq1To=
X-Received: by 2002:a05:600c:4755:b0:4bb:7033:de79 with SMTP id 5b1f17b1804b1-4bb8881dd02mr294185675e9.35.1795514786367;
        Tue, 24 Nov 2026 02:06:26 -0800 (PST)
X-Received: by 2002:a05:600c:4755:b0:4bb:7033:de79 with SMTP id 5b1f17b1804b1-4bb8881dd02mr294185315e9.35.1795514786008;
        Tue, 24 Nov 2026 02:06:26 -0800 (PST)
Received: from px13.Home ([2a06:5902:822:4600:d3c1:2e3f:2545:da9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm27831841f8f.48.2026.11.24.02.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:06:25 -0800 (PST)
From: Chris Bainbridge <chris.bainbridge@canonical.com>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	mchehab@kernel.org
Subject: [PATCH 1/3] media: uvcvideo: Report the failing control when restoring controls fails
Date: Tue, 24 Nov 2026 10:06:21 +0000
Message-ID: <20261124100623.2227323-2-chris.bainbridge@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124100623.2227323-1-chris.bainbridge@canonical.com>
References: <20261124100623.2227323-1-chris.bainbridge@canonical.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When uvc_ctrl_commit_entity() fails while restoring the controls after a
USB reset_resume, the only message visible at the default loglevel is
the generic "reset_resume error -5" from the USB core. The control that
caused the failure and the reason for it are only visible with the
uvcvideo trace parameter enabled (UVC_DBG_CONTROL), which makes the
problem almost impossible to diagnose in the field.

On a Logitech C270 (046d:0825, USB_QUIRK_RESET_RESUME), the processing
unit restore fails with UVC error code 7 (Invalid Request), mapped to
-EIO, and the user only sees "reset_resume error -5". The restore order
suggests that WHITE_BALANCE_TEMPERATURE is written while auto white
balance is enabled, which the device rejects.

Pass the err_ctrl out parameter of uvc_ctrl_commit_entity() and report
the name, the selector and the entity id of the failing control,
together with the error code, using a ratelimited warning. If the
failing control is not known, report the entity and the error code only.

Also extend the "Control error %u" debug message in uvc_query_ctrl()
with the name of the UVC error code, the name of the request, the
selector and the unit, so that the cause of the STALL is visible in the
trace log.

Signed-off-by: Chris Bainbridge <chris.bainbridge@canonical.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c  | 36 +++++++++++++++++++++++++++++--
 drivers/media/usb/uvc/uvc_video.c | 31 +++++++++++++++++++++++++-
 2 files changed, 64 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index d2f722bc3459..f70fa37800a4 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -3199,6 +3199,34 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
  * Suspend/resume
  */
 
+/*
+ * Report a failure to restore the controls of an entity. @err_ctrl points to
+ * the control that failed, or is NULL if the failing control is not known.
+ */
+static void uvc_ctrl_restore_error(struct uvc_device *dev,
+				   const struct uvc_entity *entity,
+				   struct uvc_control *err_ctrl, int ret)
+{
+	const struct uvc_control_mapping *mapping;
+	const char *name = "Unknown Control";
+
+	if (!err_ctrl) {
+		dev_warn_ratelimited(&dev->intf->dev,
+				     "Failed to restore controls on unit %u: %d\n",
+				     entity->id, ret);
+		return;
+	}
+
+	mapping = list_first_entry_or_null(&err_ctrl->info.mappings,
+					   struct uvc_control_mapping, list);
+	if (mapping)
+		name = uvc_map_get_name(mapping);
+
+	dev_warn_ratelimited(&dev->intf->dev,
+			     "Failed to restore control %s (selector %u on unit %u): %d\n",
+			     name, err_ctrl->info.selector, entity->id, ret);
+}
+
 /*
  * Restore control values after resume, skipping controls that haven't been
  * changed.
@@ -3210,6 +3238,7 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
  */
 int uvc_ctrl_restore_values(struct uvc_device *dev)
 {
+	struct uvc_control *err_ctrl;
 	struct uvc_control *ctrl;
 	struct uvc_entity *entity;
 	unsigned int i;
@@ -3230,9 +3259,12 @@ int uvc_ctrl_restore_values(struct uvc_device *dev)
 			ctrl->dirty = 1;
 		}
 
-		ret = uvc_ctrl_commit_entity(dev, NULL, entity, 0, NULL);
-		if (ret < 0)
+		err_ctrl = NULL;
+		ret = uvc_ctrl_commit_entity(dev, NULL, entity, 0, &err_ctrl);
+		if (ret < 0) {
+			uvc_ctrl_restore_error(dev, entity, err_ctrl, ret);
 			return ret;
+		}
 	}
 
 	return 0;
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index a92a986ab714..b10064defaf4 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -68,6 +68,32 @@ static const char *uvc_query_name(u8 query)
 	}
 }
 
+static const char *uvc_error_code_name(u8 error)
+{
+	switch (error) {
+	case 0:
+		return "No error";
+	case 1:
+		return "Not ready";
+	case 2:
+		return "Wrong state";
+	case 3:
+		return "Power";
+	case 4:
+		return "Out of range";
+	case 5:
+		return "Invalid unit";
+	case 6:
+		return "Invalid control";
+	case 7:
+		return "Invalid request";
+	case 8:
+		return "Invalid value within range";
+	default:
+		return "Unknown";
+	}
+}
+
 int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 			u8 intfnum, u8 cs, void *data, u16 size)
 {
@@ -125,7 +151,10 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 		return ret < 0 ? ret : -EPIPE;
 	}
 
-	uvc_dbg(dev, CONTROL, "Control error %u\n", error);
+	uvc_dbg(dev, CONTROL,
+		"Control error %u (%s) for %s control %u on unit %u\n",
+		error, uvc_error_code_name(error), uvc_query_name(query), cs,
+		unit);
 
 	switch (error) {
 	case 0:
-- 
2.53.0

