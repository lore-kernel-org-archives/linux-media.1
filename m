Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830207;
	b=xw54CjVraXUWqKiTbYP+aZ7sGSfqMvFW2YskEybr0NCUV2qoH3ll3cE0vOBuc38Ifflx
	 3uqqb4gHNuaeHHrlb+1cGH5Wz+uCsE4XBkFnAE5SFYWbqQNiTUYbiAnTX3VKkYaa2nr4r
	 kwEPF9fU4uujPYX2t5CoIlod78mjfkBqIcsRr87lMQZWDPwY6vKeIQ6hHsvrSQYh9s2sx
	 IStbDMxFdzD+NTBKKhvLdnaYhNEcM5SttpwZKYw9ZzLTWE3GsX7wvx9FUTQyLZgHWxl/O
	 2HGv07j4KqusmVqA0EfRfQrZKM8UriuA97oRci7udDJ+zw76BW+wNeN6pmP+HopTESA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=4YzOvjpkX5tgwdPOk/JXkyZ8MEMVph3AxHjayVExlFU=;
	b=2f4IOYVdBJ45lcObAVm8fkgIdlHTG0PyT5seB+gA3k8lw58KcnYGtX/Ogt1gMyfQIqxA
	 5MFWdBkP7f5dFAC8yskZ0VpB/hW4+TK7JwIm2KM1KWXf+BtszWdXLkIPv4GH/wckvGldF
	 Eu9i4EkH9HXHvuNa6WhtcrbL/3jH1KHQ3N1M5LjWeQIfl36mmNtc0Zyj0Pi0Y6VBwWbRp
	 AnGfhocEL6Y/s9QlvmGEdm8BcDg92wXGOt2W9D3A0FR1DfinSE/XBUogkdfyPhgjBIAEB
	 hp+P5EBWV+38l6O7pLy3mgjOQYzv1v/RizD3S1X/k/F498huZFaSFkfkCmrWljixVkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mhx8kUcA;
	arc=none smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DB5606A33A
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 11:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57DB5606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mhx8kUcA
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be4a2d94adso3110814e87.0
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 03:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794830206; x=1795435006; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4YzOvjpkX5tgwdPOk/JXkyZ8MEMVph3AxHjayVExlFU=;
        b=mhx8kUcArckpbQKbKy5DJXbBYFGN7uTiyMJU/GlkpCFH81bsNLyG7jVx4Y0NRhvtUI
         J7OvcuNMvbS6gKfgL4MVJNaIcczH4gmZb5lkmQaK7ph4gzplS8QBRO66hsGz0qdvEOoO
         lXA8Oj2whWfc1UJGWH/U+x1O9hMDp2P2AC3eA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830206; x=1795435006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4YzOvjpkX5tgwdPOk/JXkyZ8MEMVph3AxHjayVExlFU=;
        b=Mz8ca6QWfHvxEXBU1QvBpyRMedi+YqyyKze73Aflng5ZbqX9Evks9c99q/ceiKDuIr
         mxujxqzjxTb3nnOGuQRHYzZ+3eZuMJfLSEQyiNCCCku5qk8LiCq9UA5k17AKiy4s2j1D
         BH8q/zfN+HHCRyrBNxQpUHQp6LSHMFOsFlmlEh7GzaViXYSIf+vnjiYViGE0E9TCyJAb
         jljlK4ccFCYJHGCp4M8bF+RiZjwKiZUVZ3klhjNDWtRSLSBQDhp5Yn1IuyA/XETM7nJ0
         x0hk39+GJBsSHQndKM5WW54jHKRQJy5V1PW6lCtLqlEcc9FQtEMMOVm6pLakuYXRiXBb
         HJkA==
X-Gm-Message-State: APuU4Z/Gvi8b4u+KougFnCXITNHRDFXb8EaaYz540Ep2HQMuYmt67Hmm
	zhx+auzJCWP0baNDfjTPPLl/945fmIB7CFl3/1M9M0avT3aLEgjU5IAcPmCv6GzOIA==
X-Gm-Gg: AYBFou3Cm0HXmNHixNbGfaX92Fvmu0kQ3Aew7qVh/fS7XytWMtcprm1ARA1jCZDEHWu
	tuPncrt3ehrYiowy0hMwWpKF/FfaI8+tDd0Oi5/NpiweDoR4XCFi+MbNOMOARk3laSjxFQ2KkrA
	X2zVsBTF82IiXVM8+k0BJfTVdKwBo6v8UObx5MA2fYyIfYavlDPjVoOP4a7e9C1O6bCh8as/LIo
	tHRKyuVhUXXheVUXKF25qsqKxHlK+RIgw4kPaWrJKyBmsYfzuwY2Jr+6WiWiHahtk/wIr5CPSlq
	Nd25NrNs5xxOElu5uEK0AAHdTnCrEwMqwgn1hs2t8LaHJLIvfYL6Ou+mF9POOyMh2i8EqHmAPbc
	VjU3dg7KbUYvns8ai5ufGCTrpuhwkGgJu3ACwA5EKrvPEg+sIEyOYMCLyIXEbUfx4gBrEPI1AfD
	+jtjalbaDqOQ7ByzJfxb6LqjRKe2XiVtCBTHihTGDfRo5d+aUEBKpnERi96sWTyssfGu6PLB4op
	hJpakbn+oSchzZfwI/rC70GMZktWIxA8QQDuqMKZfrJXe5qtrJvVsnhlVBf+bFfKZJXK00dkw4J
	4kaAE3CKVhr+nOWL+u7z7DQyFwsI6OH8oqf+oRUJQV0faM0NJPCrbfan/srqK5EmN/UakYJbMOm
	DInHiYxSjRJ7fLnyHcHg8I3Upu+AZw/0=
X-Received: by 2002:a05:6512:108e:b0:5bf:d072:fa3f with SMTP id 2adb3069b0e04-5c1709fa4f2mr3628890e87.54.1794830205715;
        Mon, 16 Nov 2026 03:56:45 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712dad7dsm3183754e87.9.2026.11.16.03.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:56:45 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Nov 2026 11:56:39 +0000
Subject: [PATCH 3/3] media: uvcvideo: Fix unaligned and OOB access
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
Message-Id: <20261116-uvc-shortmeta-v1-3-487cfe42fa89@chromium.org>
References: <20261116-uvc-shortmeta-v1-0-487cfe42fa89@chromium.org>
In-Reply-To: <20261116-uvc-shortmeta-v1-0-487cfe42fa89@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3

meta->buf and scr point to packed metadata and USB packet memory that do
not need to be aligned to anything. Also, scr + 4 is a 16-bit field, so
reading it as a u32 reads 2 bytes out of bounds.

We use *_unaligned() in the rest of uvc_video_decode_meta(), but not in
the debug print.

Fix this.

Fixes: 088ead255245 ("media: uvcvideo: Add a metadata device node")
Cc: stable@vger.kernel.org
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index e9be0a627033..3e3296ec5c65 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1532,9 +1532,9 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
 		"%s(): t-sys %lluns, SOF %u, len %u, flags 0x%x, PTS %u, STC %u frame SOF %u\n",
 		__func__, ktime_to_ns(time), meta->sof, meta->length,
 		meta->flags,
-		has_pts ? *(u32 *)meta->buf : 0,
-		has_scr ? *(u32 *)scr : 0,
-		has_scr ? *(u32 *)(scr + 4) & 0x7ff : 0);
+		has_pts ? get_unaligned_le32(meta->buf) : 0,
+		has_scr ? get_unaligned_le32(scr) : 0,
+		has_scr ? get_unaligned_le16(scr + 4) & 0x7ff : 0);
 }
 
 /* ------------------------------------------------------------------------

-- 
2.56.0.679.gc527c65306-goog

