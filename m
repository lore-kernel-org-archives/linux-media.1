Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915934;
	b=LCTjrbrbnDF246IytDOwP4jngcaaxAYmx8/zHNsKgQ0kmZdEh0wRK0lXpUbJplsoEJRN
	 zAlZ1bXxHBjT0/iiAcOEkzh1lszGg/0YmF9WMWemk8cf85KbJFxrIFsCqnI591+UFi1Xj
	 vOCzj+663TRvwCe9RC1c0pRf8W8nKfUaxPnKPOaKkWsNQB8z9zmgezVxsqUEOY8erdeSi
	 ZXbmmlIR+Zk9U7h/4f1h5HrAOGJXkEy9XD/daNylP0JeUMIEjOTeqAGSDh4ezXt/tRYgI
	 NZV6QjJTPOvh6i/5XlNC8BfiRUh+3Vij2EuP5GUhzvldVn/4tPf6AxsZWaCQN+j75lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=TAYmdl/66vF4RcVM8uARuF8SUlYU6Q2ZVCQpJ4fXX8M=;
	b=IYYKO+R2kehOLO08DISjHOmxOzczKL1nmOrRLKUY6rs0IbJM41DjvLaG06bEUz1mjRGE
	 lcCsCgKbcT1HBPxAwIQfkLpxEfiPLnH1r1VCsec3ynOQdo+LwHtYyNiD/vtJN0kBq8LOX
	 TX7hH/MoYOscDOJlngsUWqLTp6mZghG3C6A9hv7q0Kw1ubvY+ZMo4C4PLU2G4PuHHoauG
	 hIPeDcdWeSIWwAX3CxsB0iYEw9lv7oj/2lfIyzd/VrFOAKmvIYDwOtlyhQgey4bamCzfq
	 uWspJJQZ8nL/RgZq9RtZZBD58hgnduMhlGxcAyTZi5rOr0ZhE0R6wHZ6CJgsf1o+V3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WsqOSfIV;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A15606A883
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 11:45:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23A15606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WsqOSfIV
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c1479a959aso3666462e87.2
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 03:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794915932; x=1795520732; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TAYmdl/66vF4RcVM8uARuF8SUlYU6Q2ZVCQpJ4fXX8M=;
        b=WsqOSfIVK25F9p93Brwyq5FUsh06s2akhOotHBD76D3QqA0aAGgDo3nhbPfHQWpteI
         2VsdK9H01btnbfZZY2X/kQOEjVBJftHFgs63gbzTMAf9X3QKTj6k6qzKs8k58Yw7fxGm
         7ASWZq4F1S4bivuZu64rDBZU4oUb5Wq6jIOIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915932; x=1795520732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TAYmdl/66vF4RcVM8uARuF8SUlYU6Q2ZVCQpJ4fXX8M=;
        b=e8Z14/Ni8IPJv3xVeay6iZZUfc1zn2Y9MjLVda6bgLRW3sHyEu1Tn6FnzQjY16xgjF
         yySNBItWUr7ux8oIhMVbZ/DDBfkfT8wZWh6Keav/d/xFWZo2UluRse0kdR3FJtn7VlwY
         QXirIrPxpSyJ4Pp1RZ/nqSZuXljcF1SIbY5qfcN8xIZtlV2NIvMmiJYTy6PAmuwoEPOY
         PN6lBHnJOVbinx8MSjUzsJuiJBAbAdSzj1wwC6vUwk7D/Lzz3iP//YoeSVrsv4i4r8u/
         2hC/5kUqoztfpbUgxWuUPpHtuoVytj4p1+ZStQAWjGcw+PDCCyaLZIGs7+yXgusX7LBy
         9Ubw==
X-Gm-Message-State: APuU4Z/DGYcvsD886uPUtqQPzraW1YCIg+5XqTbrclptOJtO3Fnm0kIn
	nJB0Cmg13rV2lXhNBnnWgXnlE1q+apBZkW2pNxkfDBs6IzBsGekaczlY90tH3uzEFA==
X-Gm-Gg: AYBFou0534uYCoOEjBfvcALzWQ9FFXzf5sG+UCtOE8I/GhNGGuXS69OnRZDBKU+5ZLs
	Yr1SEmWnfjbVHodrMK4vYf9ANpdMZVTqftDnlBomE+yFfit6KZ9txjrBhjpAIt5kdQnWUxmHPPR
	kGhIQ6w4miXgJuNWqTVnlt20oi3HvT09Fa+TvAg4WJobqXOKkXgTVPNDS6lJpBg2njt8VKOmjAf
	wYm/LEg5I41gCOAXdOL5SUgCveNXBkA6KjjC+OtHhsHxws74nqbJpvTDVkFV/gEV7FF/6cfJ5es
	LCnYTnjs3jKalXEOaXZZLFEDhQeVUm4ti6ARNxf+z7kVTZvqTcf7YFJ69kJkojkc3J5dKEnfeoK
	P8VrDjNNUq5kUF3/eyq6zkljlPUxqBBKG+9kK5SoS34zaoeg9+L1zm99LzJtwdQxRGVrJ+2w52l
	3VcAHST8Xpa8Brw4nOU9ycpcYWHkvsSQjt33IPPr8e64xcb4K0tctSyMwmks4g9vdEuo440wg7Q
	vts+rE8k5Z1/QCptxx2Ap+7NFEvHAZ1UUPzpI3ECLOP+fmdJkhcpBXduBDAppo167bMO0L39Tw4
	x1nSAj6DAXyEWecZUuz2iOBb6AvRh5kQlTTDIGDilgA2Obbh5t6+xRl7oXlzI9PhqkQNPZResNB
	il/o38c/2zA==
X-Received: by 2002:a05:6512:2305:b0:5c0:13f:8fe5 with SMTP id 2adb3069b0e04-5c170a07f28mr5117026e87.51.1794915932409;
        Tue, 17 Nov 2026 03:45:32 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712d9dd4sm3955141e87.7.2026.11.17.03.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:45:31 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 17 Nov 2026 11:45:26 +0000
Subject: [PATCH 2/2] media: uvcvideo: Force the COMPRESSED flag for
 compressed formats
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-uvc-dji-v1-2-7cb3cf3b4b5a@chromium.org>
References: <20261117-uvc-dji-v1-0-7cb3cf3b4b5a@chromium.org>
In-Reply-To: <20261117-uvc-dji-v1-0-7cb3cf3b4b5a@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org, 
 Jordan Moormann <service@jordan-systems.de>
X-Mailer: b4 0.14.3

Some devices, namely the DJI Osmo Pocket 4P (2ca3:0023), set
bVariableSize to 0 which fails to identify the HEVC format as compressed.
Due to this, the driver sets the buffer size to 0, making the format
unusable.

Add a new heuristic that automatically sets the
UVC_FMT_FLAG_COMPRESSED flag for compressed formats and publicly warns
about the non-compliant devices.

Fixes: 40b222b56ea8 ("media: uvcvideo: Add mapping for HEVC payloads")
Cc: stable@vger.kernel.org
Reported-by: Jordan Moormann <service@jordan-systems.de>
Closes: https://lore.kernel.org/linux-media/c2c00ad1-b21c-42f9-b3a1-e03a0ad49651@jordan-systems.de
Link: https://lore.kernel.org/linux-media/c2c00ad1-b21c-42f9-b3a1-e03a0ad49651@jordan-systems.de # USB descriptor for DJI cam
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index cbc14569716b..f5446fc8100d 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -332,6 +332,18 @@ static int uvc_parse_frame(struct uvc_device *dev,
 	return buffer[0];
 }
 
+static bool uvc_format_is_compressed(u32 fcc)
+{
+	switch (fcc) {
+	case V4L2_PIX_FMT_H264:
+	case V4L2_PIX_FMT_HEVC:
+	case V4L2_PIX_FMT_MJPEG:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static int uvc_parse_format(struct uvc_device *dev,
 	struct uvc_streaming *streaming, struct uvc_format *format,
 	struct uvc_frame *frames, u32 **intervals, const unsigned char *buffer,
@@ -413,8 +425,14 @@ static int uvc_parse_format(struct uvc_device *dev,
 			ftype = UVC_VS_FRAME_UNCOMPRESSED;
 		} else {
 			ftype = UVC_VS_FRAME_FRAME_BASED;
-			if (buffer[27])
+			if (buffer[27]) {
+				format->flags = UVC_FMT_FLAG_COMPRESSED;
+			} else if (uvc_format_is_compressed(format->fcc)) {
+				dev_warn(&streaming->intf->dev,
+					 "UVC non compliance: forcing format %p4cc as compressed\n",
+					 &format->fcc);
 				format->flags = UVC_FMT_FLAG_COMPRESSED;
+			}
 		}
 		break;
 

-- 
2.56.1.708.g77570a6a1d-goog

