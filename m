Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851548;
	b=Gq/+kEF3xH3ABc8JZRGPrHMiRnOEix/KdqJhRishkUE9mc6ojsMr0qaBVxoPY13P7Sl8
	 tIXWGv9qOBEsGTpCzD4TQi6sohxvREiUZqJYYEJGrnRzaY1VBLiAeLTQKj13uu0fdRqnS
	 0xonpqAAKPeE/p/FxDXTi/UzWf0T1s9kDNvkgFjIJoRy2Pgf9yHPj7XeauCOkgqRhMQAT
	 NwLLMEDx5Goa+7wF3xLjile6MVhYChn6McXyFesZe8+jja5eJYDcn2LoiqK5Iii/5Zwxo
	 j/xk4Ntk8Sca0kLlCVV8RQA38plWjyY354qU2j/DS0d5E8yO01bIXj2pHElfJY1ofAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=PaRGNEmt//619pxBJGscfP/f4jqd7bM7FVqtMrYw3Os=;
	b=S9GGGMLvHHqo2GfWENb9dN0KWodOcsX9au4m7OAZNXOTUzzfO1sxtV9DGCrkQ9MChbt+
	 nZBbKhJ8XJjDrPvJTVq+lG05HzHmk8kyDQXW83uBXzZmY30crD8H6qVZYQtcbx5qxe4rm
	 XDCOtOdJW/bGaTvwg2NAoqJ3pkHVtH0DgHjLchMabimb0Eapyt5u6qq+UsOsoJ+d9rFJT
	 tDsmwH+kgZW3CpXnhRGGZMpK2d+H9AasAm3OMbzsyoAQZ14JOUKxZgbGnwHwaPcnkCf7/
	 xKV3fSxrNy4IplbH6Ok0Oz3PQK66hjvAE4d4HrrZxfBj6aGaWSyLngFQwWWq4t4eLng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OgXgFlvK;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C31606A887
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 17:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41C31606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OgXgFlvK
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c1465bbbdaso3374113e87.3
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 09:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794851537; x=1795456337; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PaRGNEmt//619pxBJGscfP/f4jqd7bM7FVqtMrYw3Os=;
        b=OgXgFlvKOEMs11VxHFKS8Q6Bon5uLbybbWRwurbnp+6hzPkrhnaGWaK79w2aRejWfn
         8xLBNdIDikUgAX9OBqwHKTO7y2KdSXBL+pTJlVK12EAsDfbcbBJ/LWeMwqavDitaiLkk
         uZWWgXcm5+S1EAhIcz33oAgCVpXaSLVXq2a/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851537; x=1795456337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PaRGNEmt//619pxBJGscfP/f4jqd7bM7FVqtMrYw3Os=;
        b=mV0G8yq/gRL1HUkgww5Otn53r+vkrE/PhsM4HR3NZ9d+toJVIb6DHEjsk77Dg9YdJt
         AvTKjezts6HAykFD60MHzkeQXJCRYh1XLiPZ2x4rKdSTU8+xh3kZar0UOd1ne7QeVP2t
         W6eTSi0Rt5rDnvmD1w8MR4DSGxyBbrlccTE/FfpvIdBqvZmr5O451eAHbcFItzqsOp3b
         iWqOA2hzrzM6lNcocrSCbPdKmAjqkSYrdL6BBs7yrjQUw9naqT7j4onkGxkog8RSX7TK
         VwU1siXfZMc4nRaAb38S5a9WsXDh+KFjXKd72wB9Q69dW9MqoDwP6i2GKOcZCNneKEvN
         69yg==
X-Gm-Message-State: APuU4Z+LQV6yGc/wn8TpXRSe2P9BVAagsiyA6Bb8XZAPsaIZVtV7fSS1
	XGB7vpgUgV7elcjxc6GbLiwQqkW6MpBfOKWjKdsw06eKTURd2/kYiPf8sEkOwzxTfg==
X-Gm-Gg: AYBFou3OdppiTwRqgbRbebrk4UUpd2VXvS1TUoDA8npALwf6w3S+ZFAX9RpheIQGCYs
	L9J45ArDrXzx+I4HVsiKbu4zph07Uhe3b9uNxyTR+aQ1NJEvZ/YlNFxfy5YCP7skuEtMMx6fqaj
	/NNaRuTBg49xb6T7uDCjXQDTNHcbKI+FJo7VbgX8sv7GyDDW2EiS9uP3tD9O94juiDhDd7MaJHB
	7WC3sjHcvFgGYDA+p/kcyK9lFYhSvKGDrQtNi3hMOL0fF9/WwLyCk0rxl2zo2FHj/+9lbcAck6X
	K73k5wWvMxljD0A0mzh5rod3wnbmAIlbSEBduK6iqgpY3WACfx5HI031rn/54vXKpBG6eUWCfti
	nYsIDM32DTyhA0D66YOW1kdFsifMaxQYv0LeDhfMj+c4yWcSzHT+FC/vSyCV6QgBIgZRdDeo+K4
	msLXYkRSR4FpYOz6rG2dvcqgeSVRlh8DB2JUWltGxYtTNrRfcKfiIqnBC0SxE2PaZdbqcc0NfIC
	fkqOeIesTcqEPuLJg7QoeIi2q6amYiQ41s6VpuWbcQS49C90ZRHMgR3L6WeMLJ5AgJ2Rn1I8M+r
	qRtNSC1Blgv19fD1iaAfaYLpjwn6jU0t+lN6bYLXo9FP//QzcMbtekp44oicUMyQu+rTes6Bp7f
	P4C8/V2MCWpI=
X-Received: by 2002:a05:6512:138d:b0:5bf:ce20:57e8 with SMTP id 2adb3069b0e04-5c1709c19c4mr4170869e87.40.1794851537494;
        Mon, 16 Nov 2026 09:52:17 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c171333630sm3391252e87.19.2026.11.16.09.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:52:16 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Nov 2026 17:52:11 +0000
Subject: [PATCH v2 4/6] media: uvcvideo: Use bHeaderLength to detect empty
 packets in clock decode
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
Message-Id: <20261116-uvc-shortmeta-v2-4-62d4a8176fb8@chromium.org>
References: <20261116-uvc-shortmeta-v2-0-62d4a8176fb8@chromium.org>
In-Reply-To: <20261116-uvc-shortmeta-v2-0-62d4a8176fb8@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

Use the full header size (data[0]) instead of the minimum header size to
decide if a packet contains payload data or not.

This fixes the heuristic on affected devices if they also include
extended header data such as MSXU metadata.

Fixes: 5cd7c25f6f05 ("media: uvcvideo: Ignore empty TS packets")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index ac8e0c3a0c71..a822b8234789 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -641,7 +641,7 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
 	 * clock sample from many and the clock recovery algorithm wouldn't
 	 * suffer from this condition.
 	 */
-	if (buf && buf->bytesused == 0 && len == header_size &&
+	if (buf && buf->bytesused == 0 && len == data[0] &&
 	    sample.dev_stc == 0 && sample.dev_sof == 0)
 		return;
 

-- 
2.56.0.679.gc527c65306-goog

