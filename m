Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6E32DEA61
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 00:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788308760; cv=none; b=mGPLNWq61WeQfpgOSFdu/e4KEaRjmgdc0BVD2FyrOZVNoD6eOWZr+9KkDVjDJ06h2hWQDbsVBQwmK9XIoFeeFWGd3j8v+KQ523Ewmwnpgg8Eu+LUX41u1KmjUE4QlwUfhge9P8Y3HR0A+rFZnTLR4sQNFhJwwJW2OtuJjJ8fwc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788308760; c=relaxed/simple;
	bh=heOUxFnfZ1Mv5w5T/wATPkt2ywMDCQWjEglYxe/ob0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RwTaSZlhscpBcgwCFZlac2lqOgJq2TlKDfV/ApH/spDa9pdc5+XXZT35+nDBeDpciEXSg+a39Y6quj5aVLSK9XUN1pOidHM9m95e9ovmzqlMUBpeZ0yCH1zA97RATNcrShYtjs2TIZMychlUGtkMjYfR46EkdxUozU6mgfUxslk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pKsQ4J3T; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pKsQ4J3T"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8630c1503f2so6523167b3.1
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 17:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788308757; x=1788913557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XaX9nFI/ftp0aduMGpdZxQxv9LWib4/Sz+dza+s97Zc=;
        b=pKsQ4J3TS0sIa0/o19ovAr95avqb98mtM/WDhs5PUDhqFBhPkv8A8Jgd1y/nsydDDi
         3o6E2pTWeQhAP9tV9eKKNwUiLCw9xasQHbhVEpwnk84bjPhjyvnGtpvr1rxGD68W5/Tf
         u7Ts7/yhuePLaMOObVkrfGatMeqXBOpq5G3qBIKemela+k4AemegoDansbXUQU6cVZiU
         6UIwfDooM8ESdSpIql036OuFxeRBK526bfUC5FqDyuOVxuRAXeFRrW356zvePTEbZC/j
         Wp6hSFQtzzWSnZ4TfyHhUSHxyNxG6+8xBCd9gZBiYpLnnYHQamYlY9OvesyKzZSuc4We
         VaKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788308757; x=1788913557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XaX9nFI/ftp0aduMGpdZxQxv9LWib4/Sz+dza+s97Zc=;
        b=DnTg3vteQczf3lWY+TePcR4p9lKP83LCbgoXKZ9oVAS1azU/VmJJ4nI2vWnJdruXZG
         78ibg91fssWskpdky288I4kujMZay6LI6f66xdJkHVkhD24op2Ook6QTjHLkG9D4CcJD
         4zyfVg+55RxFPeWhS/S9fUYtN5wUbrQAYU7Z5pH3wN0lRdS/5a0uBkYF6Ab/JdjNmgo5
         7Pb/niSGytwkiyJ6lEq0sUneJ4uLipRojLmuQldTsPQf/0ymToaXJnhwSsLw2bYugEBY
         GZeoyI/0Ic2Xp8TGQ8n5nGjrkiVk7s9nCRUigBZRTW5GzfA2Qa8hMfodK+Ent/JmOTZ/
         BQRg==
X-Forwarded-Encrypted: i=1; AKwUvByZLlN990HmqiKzhwiZ9w+D19LE2RAp15q9mF7Ipzb6DXn8RGiGVMKbowE3EEFOxApGVfFlTNCE67U2LA==@vger.kernel.org
X-Gm-Message-State: AFuF++mzN27Lhk5SpdeZurj6rEOWKIMn6MENtMRY0GS23HSnLyFxKDit
	CgTsn6yqhz47AALpdlZGQWjcpsu/R2ZGzs4Ns6aR6qd1wIEydez9Wpjg
X-Gm-Gg: AYBFou3C07YsnMP+k46X3w+i4iBayLXypV3PSeJuGN/kDKf0skA0LG4knQ+TZAQnLHP
	gsRyIjvwqF/viMrTy+jKtLYtYg7l2zyno5JnFy4iNv4kqgF7f+lp1TWbZ7btB0qCrd8Y8JIXPFV
	JTpc5W6QUul1ZBEecYZQ2wzsXH2MDBvwB8oHwNzL7hJPHudCx8EUbiu/iQ+rn8sOUtw7rcUGBnX
	M8g0iu1naA3lSkDt+/HlJjDg4HPkbXOu56CAuZetO59qFWqsOalkIl3fq9QdYnIK6fEv8WW1y7U
	niQebYq1Xu7GwJzLCcScdiPBYtvJfDzZeEygFgmlc5oF+oIbFD+htpLVd7Chc5hEPddZWOch4Au
	ti/bChcsmQYNHKT3cwQY/VDoE+C9DSxe3esTj7ky18Mdq+7DEesOEkyNp01innFQ+SX2GBE4K39
	lyXY25ObSPFTDyKDAGP2DlTLhsdkNGs22XYFia9UaKIxROsQnvSoJY7iEeDgjIpLhlf/F6Q4089
	F+5XkqC2dfBV41OFH/3kbKhZsNJ79tLW3IzBSz8HlqIkC1+5qNaIA==
X-Received: by 2002:a05:690e:480e:b0:66d:1851:1bc0 with SMTP id 956f58d0204a3-66f9be7f1b0mr230775d50.36.1788308756933;
        Tue, 01 Sep 2026 17:25:56 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66f98656c1esm755344d50.11.2026.09.01.17.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 17:25:56 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Jordan <jordan.mymail@gmail.com>
Subject: [PATCH v2 2/3] media: uvcvideo: generalise the XU flags fixup to all controls
Date: Tue,  1 Sep 2026 20:25:52 -0400
Message-ID: <20260902002553.34839-3-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902002553.34839-1-jordan.mymail@gmail.com>
References: <20260902002553.34839-1-jordan.mymail@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

uvc_ctrl_fixup_xu_info() holds a per-device table of controls whose
GET_INFO reply is wrong, and overrides the flags for them. It only runs
from uvc_ctrl_fill_xu_info(), so it can only correct extension unit
controls, but standard controls suffer from the same class of firmware
bug: a device can report a wrong capability byte for a Camera Terminal
or Processing Unit control just as easily.

Rename it to uvc_ctrl_fixup_flags() and call it at the start of
uvc_ctrl_get_flags(), where the flags are derived from GET_INFO for
every control, standard and XU alike. The fixup replaces the flags
wholesale, so when the table covers a control there is no point in
querying a device we already know gives a wrong answer: return early
and skip the GET_INFO request altogether. The call in
uvc_ctrl_fill_xu_info() is dropped, as uvc_ctrl_get_flags() now handles
the fixup for XU controls too.

No functional change for the devices already in the table: their
entries are XU controls, matched by entity and selector before as they
are now, and their flags come from the table either way. The only
difference is one GET_INFO request no longer issued per fixed-up
control.

Suggested-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Michael Jordan <jordan.mymail@gmail.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 91 ++++++++++++++++++--------------
 1 file changed, 50 insertions(+), 41 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index aceb26310..64c90c380 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2852,6 +2852,48 @@ int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl)
  * Dynamic controls
  */
 
+static bool uvc_ctrl_fixup_flags(struct uvc_device *dev,
+				 const struct uvc_control *ctrl,
+				 struct uvc_control_info *info)
+{
+	struct uvc_ctrl_fixup {
+		struct usb_device_id id;
+		u8 entity;
+		u8 selector;
+		u8 flags;
+	};
+
+	static const struct uvc_ctrl_fixup fixups[] = {
+		{ { USB_DEVICE(0x046d, 0x08c2) }, 9, 1,
+			UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX |
+			UVC_CTRL_FLAG_GET_DEF | UVC_CTRL_FLAG_SET_CUR |
+			UVC_CTRL_FLAG_AUTO_UPDATE },
+		{ { USB_DEVICE(0x046d, 0x08cc) }, 9, 1,
+			UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX |
+			UVC_CTRL_FLAG_GET_DEF | UVC_CTRL_FLAG_SET_CUR |
+			UVC_CTRL_FLAG_AUTO_UPDATE },
+		{ { USB_DEVICE(0x046d, 0x0994) }, 9, 1,
+			UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX |
+			UVC_CTRL_FLAG_GET_DEF | UVC_CTRL_FLAG_SET_CUR |
+			UVC_CTRL_FLAG_AUTO_UPDATE },
+	};
+
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(fixups); ++i) {
+		if (!usb_match_one_id(dev->intf, &fixups[i].id))
+			continue;
+
+		if (fixups[i].entity == ctrl->entity->id &&
+		    fixups[i].selector == info->selector) {
+			info->flags = fixups[i].flags;
+			return true;
+		}
+	}
+
+	return false;
+}
+
 /*
  * Retrieve flags for a given control
  */
@@ -2862,6 +2904,14 @@ static int uvc_ctrl_get_flags(struct uvc_device *dev,
 	u8 *data;
 	int ret;
 
+	/*
+	 * Some devices report bogus capabilities through GET_INFO. If the
+	 * fixup table covers this control, take the flags from the table and
+	 * skip the query altogether.
+	 */
+	if (uvc_ctrl_fixup_flags(dev, ctrl, info))
+		return 0;
+
 	data = kmalloc(1, GFP_KERNEL);
 	if (data == NULL)
 		return -ENOMEM;
@@ -2893,45 +2943,6 @@ static int uvc_ctrl_get_flags(struct uvc_device *dev,
 	return ret;
 }
 
-static void uvc_ctrl_fixup_xu_info(struct uvc_device *dev,
-	const struct uvc_control *ctrl, struct uvc_control_info *info)
-{
-	struct uvc_ctrl_fixup {
-		struct usb_device_id id;
-		u8 entity;
-		u8 selector;
-		u8 flags;
-	};
-
-	static const struct uvc_ctrl_fixup fixups[] = {
-		{ { USB_DEVICE(0x046d, 0x08c2) }, 9, 1,
-			UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX |
-			UVC_CTRL_FLAG_GET_DEF | UVC_CTRL_FLAG_SET_CUR |
-			UVC_CTRL_FLAG_AUTO_UPDATE },
-		{ { USB_DEVICE(0x046d, 0x08cc) }, 9, 1,
-			UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX |
-			UVC_CTRL_FLAG_GET_DEF | UVC_CTRL_FLAG_SET_CUR |
-			UVC_CTRL_FLAG_AUTO_UPDATE },
-		{ { USB_DEVICE(0x046d, 0x0994) }, 9, 1,
-			UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX |
-			UVC_CTRL_FLAG_GET_DEF | UVC_CTRL_FLAG_SET_CUR |
-			UVC_CTRL_FLAG_AUTO_UPDATE },
-	};
-
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(fixups); ++i) {
-		if (!usb_match_one_id(dev->intf, &fixups[i].id))
-			continue;
-
-		if (fixups[i].entity == ctrl->entity->id &&
-		    fixups[i].selector == info->selector) {
-			info->flags = fixups[i].flags;
-			return;
-		}
-	}
-}
-
 /*
  * Query control information (size and flags) for XU controls.
  */
@@ -2972,8 +2983,6 @@ static int uvc_ctrl_fill_xu_info(struct uvc_device *dev,
 		goto done;
 	}
 
-	uvc_ctrl_fixup_xu_info(dev, ctrl, info);
-
 	uvc_dbg(dev, CONTROL,
 		"XU control %pUl/%u queried: len %u, flags { get %u set %u auto %u }\n",
 		info->entity, info->selector, info->size,
-- 
2.43.0

