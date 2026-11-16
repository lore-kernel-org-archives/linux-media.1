Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851543;
	b=dbRiTwWVfzZCe6WaP6dfolreSzTLLpXpCvQk7FeLBjalJTGV5ebK5YT600yRxdJu5X6L
	 7EbkiP2NmgTrOdAHrkId+T1HKDBz0FfjHaE7wNVwDXoxrmn3fqr2iG34oQ63vhlrU70bm
	 tc29pyhvypxZAgN9aJJMVz6fxWk/D3wBeho/V6TVT9fxz1OUh1cglcuOZoxZ7K68cHMzD
	 ASBARi6GXwDS/on/owNtI9uT9PZ4LKkxX+SqBQ3zhQrtMB2XjCEuaLwD/1gm8icde0nVO
	 TotFyz40VdErzocklsE9WOOuAXRVU68ouuKmkMrYEVhODIDwn2TidSrjPlzk3d9oVqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851543;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=deg30gp4FJD2VsHY68a4c6Rl8U4R5D0htrjtOqd5+Qc=;
	b=ExLpGLbYvK/+nCfhQy0+APXbuVzWwB5wzmnWMwt0RYINTnFqApg4H0eJx8E7eBMM4YD9
	 hLqCH+7CbAnz2sbDj7ww4atad6NCevvbtsQDBz9J48Fo6hyahPhGEG0c2oxdnJEqjisyl
	 x1VzH/5f4vXnWj5o0KRr10eZ1yZxUYwlBBRFYnKBh+ILMwOPAVdH5spmhbhm/faaw6RvO
	 O0J4ZtWIfKlFkho8jzfv95uIfP0q+BqJkAhYFIpJKQZ9uw+FafO8936pm1IN7EivHULAw
	 wIPt0I4T4qBAIUCtBTYQX69dO6/+L3f0Me8aeYBXG4SqhJ8CKeJ9UHE5kvZPrOdfEDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=E1hrV0Ob;
	arc=none smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFEA606A893
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 17:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AFEA606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=E1hrV0Ob
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3adfe77d336so37519841fa.1
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 09:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794851538; x=1795456338; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=deg30gp4FJD2VsHY68a4c6Rl8U4R5D0htrjtOqd5+Qc=;
        b=E1hrV0ObSHIhJI+dblFEdXqV2DiXCIgjZTnIuU09oypzRm7lUkGbEWPXJjoPCVrpgy
         NjWdcxbQP0Z9ApewgsHXzKxE/yfjwL+D3MbppAcOWcWU5hsPFMnF4VwBXBhZEMh1olD7
         sujLePiejeZxRh4PtCUuPCbGI4llt5legUIoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851538; x=1795456338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=deg30gp4FJD2VsHY68a4c6Rl8U4R5D0htrjtOqd5+Qc=;
        b=m0cEA02/7Mnh9eIs4CrZKabd27EqAvmzvWHKP81IM7B6bLGGhKbLUxY2moR4C8JDXq
         b0yFcuQA5h+LZe1slmHBe49rlLlG1A2Ah8/8UomXNnb4t1KMLSzDCW6BrHtBjUlKrazF
         v1ZmLjwN9sTy1uLs/6Pcl1SZJ1A5qIAVbe0pCOqujjtIHAlDKCm6cfQGi1lYvVvHirj8
         MMaIDBLxStviiTgmZ6SBwPK7u51PRZb1Ro84D6QVq+1XUyMET/pieXF3sQDQXmkXiYEL
         m2l0g9JsWea2opW3uJ77W/CVzOA+DXHM5JBDa50Qmvm+hY5LAIENO9a6EyZNxG0ulqFB
         vF1A==
X-Gm-Message-State: APuU4Z8xw6mVpy1Blyo2AgLdNBq2tfNrFjvu4G/g+8u3xucV4fSV5dM3
	8hb67HY1Wp60YAfHOJ8FJDbFIXNMHV0kn/4LeykEPQEQV6vqGSmuZ6YCD1hXQNl6Ag==
X-Gm-Gg: AYBFou0e4q2DlKF51zMlPO5qHuRdyUOX7ik4Wpz4Wqc1tGlvc17I63v+8M0M8RZat7a
	B8GZ3zys4G8EJr1S4apqAInREMBwzNIfHQ0KngMv/qx+2rSa0xefS40/i7g7o802tJ+fFOomGWe
	pxUOYUgqkzSV34bPPmx3Nxw7UroA7w/omJe9P2SAcNCOSTTpJMzI1bkFLmirBav338cvNclRAIH
	1Ru9eAbc8uupARcfxeWhUSpLPEiUu30ZHrledT/aSxJdMTeBv8zB4F8i6g5Eg8hOZZS+qx2Fdmc
	aWsfK0yybf3Uxq1WWwvQll7yCUYv6pofZYeUVwYqThtpDt9HzB1o4a7LZhSYPnUJWmmM77KTolg
	PprROu+0BjAgaLGs8lEKElNNTMTel+vo1dhYUs7E5LYx7XmQmosKIWMzA+sBeGkx4hInGqDk3+Y
	4B4Q4O51fGc+R1oQgunyOa3L5lvBgGAZgjiwFTHxJspPmqgL/ggysELdI8uiwFmeW0oIjsoGOfc
	z3aPOd/m8iemwOQQQv/u3XLee/2EHJYraGU288ZctJRQaxF2SfE80e/h6D6YxrnVboXvabyifRc
	6uSAIw13s335MTtswa6DG7Sczo8rIIeWZ1wPPIXInacWa5Nzargz9lgrfnbHMWXES0RVoGjCHAh
	ZI2rgO+3dYg==
X-Received: by 2002:a05:6512:6890:10b0:5c1:4c4a:f01c with SMTP id 2adb3069b0e04-5c19d2498admr506677e87.43.1794851538279;
        Mon, 16 Nov 2026 09:52:18 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c171333630sm3391252e87.19.2026.11.16.09.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:52:17 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Nov 2026 17:52:12 +0000
Subject: [PATCH v2 5/6] media: uvcvideo: Remove redundant payload header
 length checks
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
Message-Id: <20261116-uvc-shortmeta-v2-5-62d4a8176fb8@chromium.org>
References: <20261116-uvc-shortmeta-v2-0-62d4a8176fb8@chromium.org>
In-Reply-To: <20261116-uvc-shortmeta-v2-0-62d4a8176fb8@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

Now that uvc_video_decode_start() validates the header length, there is
no point in checking it again in the functions it calls. Some of those
checks are not complete and all are redundant.

Remove them.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index a822b8234789..4e32600d9326 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -593,10 +593,6 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
 		break;
 	}
 
-	/* Check for invalid headers. */
-	if (len < header_size)
-		return;
-
 	/*
 	 * Extract the timestamps:
 	 *
@@ -982,12 +978,6 @@ static void uvc_video_stats_decode(struct uvc_streaming *stream,
 		break;
 	}
 
-	/* Check for invalid headers. */
-	if (len < header_size || data[0] < header_size) {
-		stream->stats.frame.nb_invalid++;
-		return;
-	}
-
 	/* Extract the timestamps. */
 	if (has_pts)
 		pts = get_unaligned_le32(&data[2]);

-- 
2.56.0.679.gc527c65306-goog

