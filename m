Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB2F4DF4DC
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 10:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887452; cv=none; b=b6KXJfHRfbT2Kh7RRF3VDz004vWY9I/ZG8PLBbhCg0r1DwWxUNmtRsJW6yu/hP692PxiOJ5yogWSCKwYzcG6iD3dA1COTbxWdN7gt+t7mg4feA1/SuuUt2bWSjMzOyK5xH6cMy51TzwpThO7Ao9u0wQ8k+fmbfIqp655F16sxSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887452; c=relaxed/simple;
	bh=OFgV7Q+Q9m5bPZHtkc0vgB4UyPytyI7XAZBQBoWSxfU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tabTqE2mPDRxT60OwkwfSg+8WlEYudblMjbFduHvrrVqWlDXWjzL3/dto+goLbTyCaTGf7LIDGIHjfZ4pBFuqge1CLGXwkyNdZtWr8uoymtuAPvM9ox9DYC3yymgUj3YxNHWFjwLB0Rz02RHZybDdrX2tQYzZN8oVVlA9p1RyKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hudshSSb; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hudshSSb"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so25703915e9.1
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 03:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791887448; x=1792492248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N6TD2JBSDx2Af9KVVYuH1Qa1LkplFUH+G2vte2t2dJ0=;
        b=hudshSSbzyeMT04LStOk1D1MuK1AwmJV2UzjkLCFZ6cIPzWbGkLhppaQZQmraS2hkd
         JamDSC6l4lDyEx10CvG2t7pH8wg4bm2aj39cxYg8fbRN3K4VOdvilUCJPnE133J25Y2T
         S8+L/+XlxukfdHB4MhQ/tciygNI/SYxuUVfCDMJZV56/q9kuAksUkMEN66e3+FXfiLgy
         evMibTL9HF4DhJOYxRtho9KP2kXmusZlxFPNdAtookxQKrXxxJPdHngJHLh++Qei5T5/
         gCW8h2FPElZ+Ozy+24kJU5Uq6MHQIRsHXW26CjxpEb+T6njPDGYLm0GIsu4ZNov1/AAx
         Bi1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887448; x=1792492248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N6TD2JBSDx2Af9KVVYuH1Qa1LkplFUH+G2vte2t2dJ0=;
        b=qUMBR1z0ianQw2Rh06Wflu/JqeKDr7jE8K47by6SOO57qdEYgUum+/x4U+/zkvJy1V
         4O+aWu/I11wYlgtrJQBFgXJQPFZTFXahkw5NA7QbVkc4b5/4jHSzjyQ66yig9xz7AC0v
         GmpT5QdRVmSLIXpSraV/g+zZmXEwqMlaqS66+97oQPYmzzZWEdgsLFoNSwCS3Dm/1ybQ
         uqZzaXbQHtpw2BB+nrfbm25YddjNmoM7oD7KYjGjOrqPbUOYNeDNacXRb/8bs99bnhPh
         Ecxe7eidoVqNnAoodQ5PSxXmhdHCAal4A7yamHVSPZzFpyAERIoaN+uMQWc1oCqobvZR
         jA7Q==
X-Forwarded-Encrypted: i=1; AKwUvBztqbi0ETOFwwIq76zaCbHUi9DOS3vEEnWdXDQu3xkgY0/5TvN8moWgLZbdYuSzRB2sE69WNWyA60y4ew==@vger.kernel.org
X-Gm-Message-State: AFq9FYIPL/LT1hFUClYUBVpwDS/JlnYi95rJkYJSHKY4YIgmXsGTy1Nm
	kuYyOgLeIfaQW1Tl3ZOiUJ09C2rELgVXDAFe39IhyAQxee/FmxR7DTQYtntid+e6GTo=
X-Gm-Gg: AYBFou3Ld9yRuJDT2hu5Sbv/aing1rhwm0G1ew5VluzsyE35EqUG4Sr2niUs3ssQmw7
	kr8zTFyGeRhvB+POZSfmdDW6CALuDZT+s50jfrZbvjBewQZOgqc28EsG0j5yxY4auY+dg5kRdyV
	paMhwWR0MBKUH/gy0lHDd0sMarZ/ucPyxsmuss5QKgWiYxUGOng4IRp1u3AFQLCWA5A0UfHKKwC
	3wNeMEYk3FtLKcSeTRLhvWiAFq8srSdMsxWeq/1BO8+pTEfhuFwXFuZbET04D0Lsyrsv4BfSDbO
	Uoo/odWlqy9RCkXjo4Vw75PcVnFd6YShFUu8uF8etCPB/wqMYdaKs+RhIIsATHp6VD/YAdKLQAU
	U4ZqpFFUCmH6MR2TZvQee148IcNIx+4VmSCpQjf+lUE55YXVdw5/348xb+w0jb8QtXyLfd/Aa6K
	AOLZiFPMGEaMa9q/2sEAAaaH3zIawik3JS8HQsTcKjVYiAfu2LKRZqEOJbpc5IpEfpQ429/tpVA
	91M1kPom+0Rwj8A/eRE4E75bZoiX3LewAwMQa5wCpezGpLAeShOn4W0ElCoS6C8ElyQz6n2I/QY
	vka251BvU3EQDS25SkziokGQ+5MMwWGhQGsar9eX
X-Received: by 2002:a05:600c:348f:b0:49c:fc6e:8caf with SMTP id 5b1f17b1804b1-4a18e4c05e5mr243082755e9.19.1791887448077;
        Tue, 13 Oct 2026 03:30:48 -0700 (PDT)
Received: from my-vps.. (ip212-227-39-93.pbiaas.com. [212.227.39.93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ae0c9fadsm49810175e9.4.2026.10.13.03.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:30:47 -0700 (PDT)
From: Louis Clinckx <clinckx.louis@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Louis Clinckx <clinckx.louis@gmail.com>
Subject: [PATCH v2] media: uvcvideo: reject bulk output payloads too small for the header
Date: Tue, 13 Oct 2026 10:30:41 +0000
Message-Id: <20261013103041.145445-1-clinckx.louis@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <LE-MESSAGE-ID-REEL-DE-TON-v1>
References: <LE-MESSAGE-ID-REEL-DE-TON-v1>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A bulk video output stream prefixes each payload with a fixed 2-byte
header written by uvc_video_encode_header(). The per-URB length counter
in uvc_video_encode_bulk() is a signed int initialised to the URB size:

	int len = stream->urb_size;
	...
	len -= uvc_video_encode_header(...);	/* returns 2 */

An output device can describe a bulk endpoint with wMaxPacketSize 1 and
negotiate dwMaxPayloadTransferSize 1, leaving stream->urb_size == 1. len
then becomes -1, and uvc_video_encode_data() casts it to unsigned
(nbytes = min((unsigned int)len, ...)), so (unsigned)-1 defeats the
clamp and the following memcpy() copies the whole frame past the
one-byte URB buffer.

Rather than guard the encode path, reject the invalid configuration when
the stream is started: the negotiated maximum payload transfer size must
be able to hold the 2-byte payload header. Requiring size >= 2 also
guarantees urb_size = psize * npackets >= 2, so the encode path can no
longer underflow.

Signed-off-by: Louis Clinckx <clinckx.louis@gmail.com>
---
v1 -> v2: per review (Ricardo Ribalda, Laurent Pinchart), reject the bad
          configuration at stream start in uvc_init_video_bulk() instead
          of adding a guard to the encode path. Can move the check to
          probe/commit (uvc_fixup_video_ctrl) if preferred.

 drivers/media/usb/uvc/uvc_video.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1942,6 +1942,16 @@ static int uvc_init_video_bulk(struct uvc_streaming *stream,
 	size = stream->ctrl.dwMaxPayloadTransferSize;
 	stream->bulk.max_payload_size = size;

+	/*
+	 * Output payloads start with a 2-byte header (see
+	 * uvc_video_encode_header()), so a device negotiating a maximum
+	 * payload transfer size smaller than that would make the encode
+	 * path underflow its signed length counter. Reject it here.
+	 */
+	if (stream->type == V4L2_BUF_TYPE_VIDEO_OUTPUT &&
+	    stream->bulk.max_payload_size < 2)
+		return -EINVAL;
+
 	npackets = uvc_alloc_urb_buffers(stream, size, psize, gfp_flags);
 	if (npackets == 0)
 		return -ENOMEM;
