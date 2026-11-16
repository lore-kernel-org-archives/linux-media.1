Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830207;
	b=BrucvUxN6SYOCDWRev3mMH9HioVbJhFdk59DAhxVxMYPXOohc7PBIQjo5ezb+l/R2rFR
	 6gLgHYgG5W2a5pd4IyyvUrGYJhLTvxdnhKBVIjhvgr1GrHX22CrWd6K4oNNhMM2mqwqaG
	 oabloeLkwhOPDpoqfY5Gh0kPIk/fmWLmnob1rQIZVUWRiuF2KuPg1eR1FyoWRIZ+yv/RE
	 o8e2OgQQAo6gNM0nEww7qOBp9GOIPv/TA4MWUTmucOCXqYDaW6O/aUBtt5agxhsuGSBit
	 WWQJO6/lksP7nL7FQiYSfsJSN9Xj7BbAezL1rEYABK5Ilpo36SNL/azq+PDbvqBA+kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=jSBrXKq0EnuHM2QzrZ5bmia2mjHZUO+yHmfmjk5qeGg=;
	b=s8fOum6Sm06v7xerVR+LVhAcRInI48L3yLjpjWRJf6/BVtSL5jkbMgl1W5H3aBj5x5tt
	 W2gQd5pL2h5WBJV9kVzi1CaEXW7C9OHrIR5m9dhb/MowJMzZc4LsOgOwq/t5LZ5eelpLi
	 IqOzOzG0CVyiDZKtShiGrZowQQWDvOC8DZNFFzdQ7NVlvC5J98UYykaLBUwM4kUF0O5Wb
	 av7I/HE+FMUMIWfNbsfawhioWTTqtZeB1Arg4nRi76N8TJt2Bzk7XtBxjKQRUsPOZRHKs
	 ZqETLZN44zkdOec3WTED+mbKKn7T4ahARqSxSTYSutLRyv0mZREH2295+LvfLvNr0ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mRh1AYSc;
	arc=none smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB9B606A88B
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 11:56:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCB9B606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mRh1AYSc
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c14e307f29so3877517e87.1
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 03:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794830205; x=1795435005; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jSBrXKq0EnuHM2QzrZ5bmia2mjHZUO+yHmfmjk5qeGg=;
        b=mRh1AYScEGf3D/c9eYuqNCIYkBP5lw38Q4dKqtNZVW4VN/wdjSr1zqvbsC3WAXBzvu
         48VgeS6Bl5WhIcYYpBF8EaTz5+2QOYbDC/Wr12BLbrx3evKxiqBNLy2vrTdCXAGlId4/
         hHZZZFAbjXpkwLtdZTCYTHT9Z7qDIhwswq5m8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830205; x=1795435005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jSBrXKq0EnuHM2QzrZ5bmia2mjHZUO+yHmfmjk5qeGg=;
        b=ihv9beUAOHHng42yysuWYzcIGPV22rlwkGMwLjYwrFOA2Nhi05d/rVTaUS29jE345k
         2Ajis4kUHW62es/s1bkZ1ZbWjCoj/ls4wiRCh2oPtrfEkfIukPo3rzom1/hVoHSnAaNs
         hNHuytc1hsS/86jXyi0ZDTgYmcCdEMH68aP5qAlJc9Vzau4fFSbx/pt46FwNIpjgaWug
         YBJiyIdinPUjW8kRuU6sHEICu3KR92yAIFAxSRw7JR7BQLOub/pCRodkDJTwmQ/VkN19
         bjrJw2WxJ3fYVUsz08lRyeEHDTKnjkxrRcaBXR+2AT6jcO9tPWIuh0AZgtcQzjRoGGX/
         3PwQ==
X-Gm-Message-State: APuU4Z/Vnb4pmfeU7PbZLnaoaF26XV7Z1+ZqgYe0SUTl4RKpX5150poQ
	UVOUp5qZY7SAR3yYs/5GJVa2KqbYFxGVYG1ktf2104ltUTXmMmK3srCR7KpRCpVcyw==
X-Gm-Gg: AYBFou2NtCXOuUg5P1DBa/A4lJAR5y4s38+DTwrTRIlgUCtop0Kxgq8NmtWbDJirMFX
	6IX+tcSet1R4aQytJflYZs3SfyCypmRwRZBMxEzowEMFD44bTztf7tEJ4O/6PkQWZEgbtkifcyg
	mSCRKIdUFeVsiTo2QpO56RwmjfYdK7fTlra9gkGuUgO1NuK5IX3xDrKNeVANfOe1fmLiG6NV8Yv
	f8Qbvg6KVVHkUxEroi/f2GXu/Z6vtK5uUTgRYjAadHBRcW8xcxYxZjP3Gsrsn3/nT0z88V4v8/J
	lSJgXjAmpZMmD/kHq1mf6SQHoZzi4wCL4pXamAvRP9lsj9UQZ6T9dY0Txs4Ghde680k9fIoN/Yl
	NsncQj2/yiLBzHQg8D5Rz33UQpO+9pW8JPtYSSzMdsxKHEq9LlA82daLRx1Z/V8Dxo0LLDbt243
	ebAlE04oxo2ldE31SYDM/Zx27X6UGVBBVRcFVuSGfcoll46iF3N7z2lZvgfey7dMR949sJwZXuF
	ZtNXnz3GUPyJIpgxZNoECPpQGorfx78uq2uLLUAk+gby2Nsen+i+qxoegBOhT0lFWP0JURKRo6Y
	ZnSxST84ONO3Js36p25RkyUgmruYkzJh3LipkM/Yj1x+8l2llShRmudXZyB0ec7b6Ok/aKC/7uK
	mMWtZsipZYw==
X-Received: by 2002:a05:6512:b06:b0:5bf:dc6d:3153 with SMTP id 2adb3069b0e04-5c170b46db9mr3813859e87.67.1794830205068;
        Mon, 16 Nov 2026 03:56:45 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712dad7dsm3183754e87.9.2026.11.16.03.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:56:44 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Nov 2026 11:56:38 +0000
Subject: [PATCH 2/3] media: uvcvideo: Check header length in
 uvc_video_clock_decode()
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
Message-Id: <20261116-uvc-shortmeta-v1-2-487cfe42fa89@chromium.org>
References: <20261116-uvc-shortmeta-v1-0-487cfe42fa89@chromium.org>
In-Reply-To: <20261116-uvc-shortmeta-v1-0-487cfe42fa89@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3

In UVC, the header size is defined in data[0]; all the bytes beyond that
length are pixels.

Currently, uvc_video_clock_decode() could parse pixels as PTS/SCR
because it checks the bounds against the USB packet size, not the header
size.

Fix it.

Fixes: 66847ef013cc ("[media] uvcvideo: Add UVC timestamps support")
Cc: stable@vger.kernel.org
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 9cc5d83acbc2..e9be0a627033 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -582,8 +582,12 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
 	}
 
 	/* Check for invalid headers. */
-	if (len < header_size)
+	if (len < header_size || data[0] < header_size) {
+		uvc_warn_once(stream->dev, UVC_WARN_META_SHORT,
+			      "UVC non compliance: payload header length %u is shorter than expected %u (flags 0x%02x).\n",
+			      data[0], header_size, data[1]);
 		return;
+	}
 
 	/*
 	 * Extract the timestamps:

-- 
2.56.0.679.gc527c65306-goog

