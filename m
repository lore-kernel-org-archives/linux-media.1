Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521971;
	b=5KQ77iO3AKTfXEZZ6v/PdxvnMCtxiFcaH3VlqCk89150SlVNGE7a2ZGslPBBocE6amiG
	 GaTg7QSPQqIhbIOCcqYgu8v9iyqocQQLkBQsl8yQvF79DL2c5hVBJCKRDjV4bqAxt7Ocn
	 PCZLfFO0gmtXSELO+WLyKhuBuuyabOeCCZ4zQZ6HA8USBKOjw5My+fQ5RjedZypEs6/p2
	 izwNMyoiAjCjA6HmHvgHh0rqLkgGnnwDf2kw8E2D+sal4jbHW0iOgsMtucKBlOLXQNEOk
	 reTDWsPhQOWI64PIXGS6zmmiOAp90WTYPWccQ+vPtSQysZ7uPD5mFfmTVrIVApJZ4XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=pVa+ZA6aOifgImQztMbcvR8yIo5vx5Zni3d4EJa3kmU=;
	b=GZ+4u6jBqd5mE9YUJj5Vk0gyC3lTTsZtnxgFW6MqRrtnQCQwm3R4I6Aw8U4QWerjmyoL
	 W/ekHNdhs0Qh5IIbNbDrf9Sll/rBLdASw8Dhh3QnhYPGQprb02fhKM6pztBzeaVyz5ZpW
	 KiYm4zeWTFzvzPO5R88dZhUf39r7AuewR5P2EgyVP22ER7XjqSGeB2X+o/riSpSEJq8bO
	 kQaI49zuYv8kNTXFmxZLQV1+b8WgnAycACc7aBUrhWFMyTAnuE4mcjeGbBLa3Se8aliPA
	 JWX8J9DKGe24W/D1Z7oZbk49xDLym/NFovBfHsCboraV2a4QCDmKeJlPA51avjlW0dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="N//M9eBR";
	arc=none smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B3B606A33E
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 12:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90B3B606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=N//M9eBR
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ae2fb3fe2fso39248291fa.2
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 04:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795521969; x=1796126769; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pVa+ZA6aOifgImQztMbcvR8yIo5vx5Zni3d4EJa3kmU=;
        b=N//M9eBRKJVFPf5RQ369XDTjlCr76SvnaJAhvpiEb6qRo1GEuVH9ZpqUR0mb+RO05P
         Dyn56e6eGjpZkGT/q6/obpjznxk2zUpRTjBU52VhihbM5bCxNJMw3KXu8GA8SEEkbmVD
         5Jy3y+xJqr6fnRvIB+vg4ma876pUGfZnSAsCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795521969; x=1796126769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pVa+ZA6aOifgImQztMbcvR8yIo5vx5Zni3d4EJa3kmU=;
        b=DV0YXll3hgH2UvyjSydSsGCY4RyC0aBeARmOLIb5iGUx5/aZ0pZl2LOQe7di6WMWUL
         /ZK8msUy+WgCstS6uCz7e6aBs8JK70N1uActg32OAnuLw0/nGbLl850oWwZlLm1rC6DQ
         /LKaJLTP0piW4Se3E7lbJQ+/E1qrWSj0iGQkcA2EK6YZ6FEM3pZdAbhQVfNrXPeeUMEN
         6CHB3DJSvlfc7+JQAurZbDb2ChOtTNUT/RVH7n4xDOjJtBMVZV/gqF4STKHAJ3H5FOdi
         BinMn0S4lw5CSbFwwe03YFnugYD3sjkToDL/LF+7frxE+p9Axqor6imP+xFEZ7mA+GTi
         njgQ==
X-Gm-Message-State: APuU4Z+k1qmCPqo+cKqKMU+Ytn43cyjYl07x3TOs7hl5Qnh8k2lI28UZ
	k6ckMephA99icbV4TvZBUcM7U2McpJi1fmuwvVcpFihx4+iCJD60LsWOi0n7D9vixA==
X-Gm-Gg: AZFdTZelNeF+W05p+ylvexjJhybX1StAP/H1grwxTq/Ok5/EOZ+rLfWUrBMpaiG4N5Q
	0VTbxQHEle8qNf/939W6PD2UEhwdnUoUs5R1gu0rN0OLDoxn+TaapHRvufWitI0RuW2eYf0n9uu
	EUEMIStOXh9pm/jKhGY7L/0Uj+N1O+fkmfbO9XNAiejPKR/oqfBui7AX0EoAuSmuGGTxAIrM4Z8
	0J0kvA+7yJY1i6hQfyE4GJYh7cPPKuSNopSqprF0BAPpFS/+4rEgK7qEOmntBmc/qI3VTaMl5+B
	/lEt1dCxkWraBrWvyVbi5fwXKeaeJIc8Q6ifJ4TYjmX+EnR6CREhfuGx5zN8n4GPesj7VFeQ7J3
	L2WKmdx/ROxG17XdRO4A3mICBHW+rgZlouePSGpTcCUv0Xd9yQESCwgRW6o6pkivm0U9LAMBSie
	mxU7rWQBGlhx3LRLWXeTATCb0bnxVG+z+xyZktIkXbyJbXZeHHaSx6APDxc8wp4f8OXP7qGqu0l
	8y5dDsqXnERa3ggI7EWWwnVRoUy5KhFW9Gbi+aOLL91G90mrDLJr9Im3p7EAID1yOubV/dAfBtK
	KU3FfxF83zpYrHv9WUpGZZ/nq76SmRolRkGhaByv14Ygv2YCSiFJrCFjstXzy4YnJS1Q9gDHZVX
	W2G+TeeKVvms=
X-Received: by 2002:a05:6512:224d:b0:5bf:d0d5:3b12 with SMTP id 2adb3069b0e04-5c1bc805a72mr5534713e87.42.1795521968752;
        Tue, 24 Nov 2026 04:06:08 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd01772esm3654675e87.39.2026.11.24.04.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:06:08 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 24 Nov 2026 12:06:05 +0000
Subject: [PATCH v3 2/2] media: uvcvideo: Use wait queue for metadata
 streamoff
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
Message-Id: <20261124-uvc-racemeta-v3-2-f82822cbadb3@chromium.org>
References: <20261124-uvc-racemeta-v3-0-f82822cbadb3@chromium.org>
In-Reply-To: <20261124-uvc-racemeta-v3-0-f82822cbadb3@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

We are now using a schedule()/loop to wait for in-flight buffers. This
works, but it is not beautiful. Instead we can use wait queues.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_queue.c | 7 ++-----
 drivers/media/usb/uvc/uvc_video.c | 2 ++
 drivers/media/usb/uvc/uvcvideo.h  | 1 +
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index 844e9baa8066..f44b740cfe55 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -229,11 +229,8 @@ static void uvc_stop_streaming_meta(struct vb2_queue *vq)
 
 	spin_lock_irq(&stream->meta.irqlock);
 	stream->meta.streaming = false;
-	while (stream->meta.in_flight) {
-		spin_unlock_irq(&stream->meta.irqlock);
-		schedule();
-		spin_lock_irq(&stream->meta.irqlock);
-	}
+	wait_event_lock_irq(stream->meta.wq, !stream->meta.in_flight,
+			    stream->meta.irqlock);
 	spin_unlock_irq(&stream->meta.irqlock);
 
 	uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 5de7f215ee28..fe163edfc0b2 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1802,6 +1802,7 @@ static void uvc_video_complete(struct urb *urb)
 		scoped_guard(spinlock_irqsave, &stream->meta.irqlock) {
 			stream->meta.in_flight = false;
 		}
+		wake_up(&stream->meta.wq);
 	}
 
 	/* If no async work is needed, resubmit the URB immediately. */
@@ -2355,6 +2356,7 @@ int uvc_video_init(struct uvc_streaming *stream)
 		INIT_WORK(&uvc_urb->work, uvc_video_copy_data_work);
 
 	spin_lock_init(&stream->meta.irqlock);
+	init_waitqueue_head(&stream->meta.wq);
 
 	return 0;
 }
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 26d4461f2774..785473928760 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -486,6 +486,7 @@ struct uvc_streaming {
 		bool in_flight;
 		bool streaming;
 		spinlock_t irqlock; /* Protects in_flight and streaming. */
+		wait_queue_head_t wq;
 	} meta;
 
 	/* Context data used by the bulk completion handler. */

-- 
2.56.1.809.ga0b61035b5-goog

