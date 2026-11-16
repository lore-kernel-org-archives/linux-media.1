Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851541;
	b=YGzd818G1ARxwVnpWTq6S+E3qZ69mVGLYot06Tv30hgf2NiYqqGZj6Rgi8171yU/bsK+
	 x7WFFEjPXpqDHQ4vw7jAtW83tEqmACa1GEzcKTVIMrtDu6iHRUui0IwM6meYJ0dJj5RvZ
	 uvKN1GepZSYjikXN+NSxUXwwIMhaZFPeKwDi9YSaK+ufr9IzTpXfE6umFgAeLajXgvVL4
	 h2TAqlW3OvAdJczKud49rCI+4hfGc4WTQVifGrW991z/tuXb6L+XQqvU7aknWeSPb+o7t
	 qshNXkYpUxioSbOpip/fEoQ7KHxkwB9jH0HrSGtp/d+VN05fE0SZOK/nsw+a/TltGxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=wJ8TnT2XfhDoFSzBoirS9TeHlGIUWbru6eIu+8n9Klw=;
	b=Yrl4hsCNg3LoJ3JxwxJOBrUGyLNVCNMACugD61WIpYOU5Y6N/7oVtl9dySQlyIoDlob6
	 BrmFnaw0OHw+qwn8j+nBvj+TK+4TFsAS4AlSdY7lZQaQVgFxKYJP6dtbbxx7ERisUkeXK
	 ty0c39/IZmHyxIwrQJ2i+FlWtHP2fWHckpl7PvU9E15Cv+8BJCeQKJhIffXjvVlr4TVbN
	 96QydRS7HwgpeA0KanR2QZ87NQ82X72I9VxlEn6ad6uyztxr1dna74AWHe97UbbQtVj68
	 K/N0ukNWpFSnspuV3wFL1oCx7yevrf4H8ghkfLQfX9BhskRJALF0B1kCPprXJbct8Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RDOf8EIy;
	arc=none smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBFB606A32F
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 17:52:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EBFB606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RDOf8EIy
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bfa7c09c9eso3061555e87.2
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 09:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794851537; x=1795456337; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wJ8TnT2XfhDoFSzBoirS9TeHlGIUWbru6eIu+8n9Klw=;
        b=RDOf8EIyDdPhIhwkU2Y+kks81uAo3qI0dVnrzE44118r05BQIWANGKQxYwZzuOX3vD
         zwNEJmtE63iju1pVjGWF1qU7xBKYcDB/bbsbsjpJ+8qc/knq6XU0HAUSZUmLJe0wm7w/
         g3OIplPwGclz2FdxlBa+hCMd3/BvncIvoq0zY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851537; x=1795456337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJ8TnT2XfhDoFSzBoirS9TeHlGIUWbru6eIu+8n9Klw=;
        b=vBj7pHEz42R3CjbyTMH3R5/r0RGgb+6OgKtwN0iaETkEKWpIc8+xqO7b/OLbOSUFQI
         m2GfK/ZxDwOL8Rv+086UDn/zxaZiGM3jFGIuYVPZJpTr8W1x3bODqlMm6doPjZlP0ylZ
         Dlwt79xFiPiUSfxFNpHJoJvlARNH65olaLPedGlYESZzGURqmZ3CeGDPNV9I6Pcm/7kO
         47dI+UMShzBCQEJBYm3soR13Y23aIRozQOhW/GpK3757iJeuqjIs1zwOn3/qhX02D4L5
         4r1RY0hXJyS/zwTAHfwReCY3ot8+ZEJ+5LlDpzs0GL7vcV3/GzNc7w7ExXnVYlFWxlfc
         dFUw==
X-Gm-Message-State: APuU4Z9TlvRrPQNSS8RUEPiaMzWQ7eQW6A240dqdRITlsvxvAGFiTLqa
	ZngwfJmrKvQT4n5Yh/JOc9iWetRGV8rG05jZzZMNqWedCNeCjhA42GkZ3mD2AV+gew==
X-Gm-Gg: AYBFou17+bcUfTS48P/LZszXLgML4YBQ5kW9zsu3civl8Ug+vLrbtJA3JXrQcNlm8gv
	6eLPG+UyjL7XuZinnqr3YOnovcM/FzDcgBHdIRCJ9cI7qlBUcFYkq58Ty0+IgletdB4bYUbO5bf
	eVZ6RHAzkolwplQRWVVC/Z/7nDjg0itY40B2F79M55e8oZY8yXFm4GfXWOENT7BP2Cyax7xMo4d
	9ojCQaS/cBM/5IHtOMaSsKdv7tXk4wiDUFa4io11+MmQ7vHzNq739Pm78R/lC84LTTfbst4d4B3
	KmKUaZmTbulrTKv02XhQCLixFYXY0FN/FCFP7CUPWr5Da+wXHp3kRe7N3EtkgsiLAuacSEm8SHP
	5Tcmox2VpmC7nj3vW/9xnaW1MrsPlReX616sfmAO5QwoZI28MvEDet2VBhXQvqGOaIyY585ecjJ
	3ME41unqHpJqX7zUkwMAHJuG7t0FyfFHXS8cDlr4lR0HImqS/vmM9Eh0HubCChgcAdazoA/ArqG
	hPz+JV4xdIcUQ2dpPtxtJmsCYhn7fPx5x1tOQZbwrIr4+dOQkph81FAzCoSlMUSB93batr9yhw/
	9jjuDB1Ne44JH/AkpzHMHZEsidi18MIkEVwYc6j0BjNVNz4RJdekVfDMEVTtA8sJBkBxAyWFGCB
	o3+onHr8gRg==
X-Received: by 2002:a05:6512:31c3:b0:5c1:4f6f:564c with SMTP id 2adb3069b0e04-5c1709c5b64mr4239145e87.39.1794851536662;
        Mon, 16 Nov 2026 09:52:16 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c171333630sm3391252e87.19.2026.11.16.09.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:52:15 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Nov 2026 17:52:10 +0000
Subject: [PATCH v2 3/6] media: uvcvideo: Use bHeaderLength for payload size
 in stats
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
Message-Id: <20261116-uvc-shortmeta-v2-3-62d4a8176fb8@chromium.org>
References: <20261116-uvc-shortmeta-v2-0-62d4a8176fb8@chromium.org>
In-Reply-To: <20261116-uvc-shortmeta-v2-0-62d4a8176fb8@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3

uvc_video_stats_decode() does not take into consideration extended
header data (e.g. MSXU metadata) when it calculates the payload size or
decides if a UVC packet contains payload data or not.

Use the correct size (data[0]) instead of the minimum header size.

Fixes: 7bc5edb00bbd ("[media] uvcvideo: Extract video stream statistics")
Fixes: 25738cbd72db ("[media] uvcvideo: Extract timestamp-related statistics")
Cc: stable@vger.kernel.org
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 8bae91af03ba..ac8e0c3a0c71 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1016,9 +1016,9 @@ static void uvc_video_stats_decode(struct uvc_streaming *stream,
 	 * their first empty packet ?
 	 */
 	if (stream->stats.frame.size == 0) {
-		if (len > header_size)
+		if (len > data[0])
 			stream->stats.frame.has_initial_pts = has_pts;
-		if (len == header_size && has_pts)
+		if (len == data[0] && has_pts)
 			stream->stats.frame.has_early_pts = true;
 	}
 
@@ -1047,15 +1047,15 @@ static void uvc_video_stats_decode(struct uvc_streaming *stream,
 	}
 
 	/* Record the first non-empty packet number. */
-	if (stream->stats.frame.size == 0 && len > header_size)
+	if (stream->stats.frame.size == 0 && len > data[0])
 		stream->stats.frame.first_data = stream->stats.frame.nb_packets;
 
 	/* Update the frame size. */
-	stream->stats.frame.size += len - header_size;
+	stream->stats.frame.size += len - data[0];
 
 	/* Update the packets counters. */
 	stream->stats.frame.nb_packets++;
-	if (len <= header_size)
+	if (len <= data[0])
 		stream->stats.frame.nb_empty++;
 
 	if (data[1] & UVC_STREAM_ERR)

-- 
2.56.0.679.gc527c65306-goog

