Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521969;
	b=QbAZkZjK78aeDZc9Qq8upphm2XoAmMHUeyYds1JPcvBH6yiXXV9xH1s1T/KDXJEhTNuQ
	 P4BSIACVJ/EKrnj5wxl9G0KjJiqoxBZZy+qlGQ7mbRzjx06Mr8d71TJYNqoPDCmnXw64t
	 BFXQoPn2XZMKLii8IO7BxRyst72HBSjzJCxl51RFeEGqc2VdOP9czn4hhF/F3kvEftott
	 N2H7XoNxAnVvefYZlGaowqoUWDgo8AYEmlmB2c1xU4tid7K4Mq1nQzqOI8qhcllG4FyY9
	 x85/L/sgliwlY3x+j7KhhDOMux53cn352ZLJZZEBVRYUzJn2/5g/qnsRaQy09uAY3TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=KOl2yz4M7C/s7a2F3laG5SJ8ROMJ5wzUSTSBiLclugA=;
	b=lmhYviQLziWrsYQzNCw6pu00yT96Jr74xBU5noTNMwoRTkHT+zNpZ81tfKKKHxPoNrUK
	 CYhgtbKM4wQpL7pBY1kaIda9m74W0BAUf7XZV4b0w9IMpGzw2qgX5lyjL5E2DuQDd+XO3
	 1kegPoGQqqvN3HBjjHbSHlZXgqlsXzVHhGM1XQPQp9YfKxUzipg3KUGeqr17CBkwbSvq2
	 4+39zQ5JzJKQSZCaEKefwMbPOzZeVVhZ2uP58soUyWx8sZdRxT9pMzfU1usomEW+7l9Zk
	 qY+1JTsSslYtnyUlrnjNnPrx+NsiFqGp9QNu0Du/hWTKeDbULQqq6KBs8MpdRb568CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="MQ/RXhgV";
	arc=none smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9457F606A335
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 12:06:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9457F606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MQ/RXhgV
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be53e5fce1so4005711e87.1
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 04:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795521967; x=1796126767; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KOl2yz4M7C/s7a2F3laG5SJ8ROMJ5wzUSTSBiLclugA=;
        b=MQ/RXhgVqU5sAcBNnuTQ5U0+AZ6JbM/oIPEOQ2KoEQwTD+GMBeWAGs5HSHWf5LbnjY
         0dlv/BunRCPGkSSliuOGd524M5yxjRd8aHmBHJJOuW5cL9ddleDulX+v9QfPjxrB12in
         pehtr+vEznWV+PMiZ0Vz5rsflnAJ2nOcmL/ck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795521967; x=1796126767;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KOl2yz4M7C/s7a2F3laG5SJ8ROMJ5wzUSTSBiLclugA=;
        b=fEwdGzag6Fbh51vgVcWgzXmu69ZC3f/wTqBmkXsnplybv+6EkIue5H2mPhOHWVs/4P
         SntOEoXdFr7Cq97Rdoo7Bv8cgOArIvgYQbbBaQ/kgpJmt8tLlDbUihYMgTyYhif3EJYy
         U3WO6MdpVc1eTSevzAqLn1raCQlGbImkLNS01s2wB+0/ui+50rddXRDpvK+zVFS7Vl37
         3PQqm0PtxqTY1cIARq+t7vAs71r8dXRkRcbjAcXaJN1mRL1/jvaavOYxqQJ7ij8SjRwI
         piPpijVZxrHME12uUpOLxgTCoVS0NWbpUBK41xKZ5MyG6MBPBGcJJtSx8NyOQbwdvoop
         QXpw==
X-Gm-Message-State: APuU4Z9gadtzZiSwJPQ6/iVooSFQkIZ7WEJUO8mpi1TYuWInAzN75UJX
	ZP8XGfz/YPPe5Q8OnK4ZndEHyWRXZoMZb8BwnsxJ0em4QpTk0N+cy0ZCPYuN07ahrw==
X-Gm-Gg: AZFdTZcMaxESzRFohr8NFb7scNf/1iYa5aKJYq8ChAPUIiELn+/JjRyF5CE8CP7uNaB
	fWJvYKxI3VszF+NKn4hYZ7nNwIOrf+MkYaqOTn4uGuPdVNQSboH9s/k8lbLYVGWVrAu2khYYNC2
	y9zfTB2GVrEsRrHVxciFqHtYG2lglldms0/1HHZlKNbuFhO2erIiAfrLOKgf08QFWFoHyzsd7l1
	Dizet/cPXmDRIHkuCTjPFLLUZaUU6OXZLvRYm8RPGTwkGG1i/oj5LkguKD/WB5JrM6ufED1IbQ5
	xJhWSD10EjM2IwpoInVFtcsc47NQahLH5RWdTaVgAH/+yMmUGrYAIe00nSWnaKvPLxOe/zoL5yr
	4urtpGxVLiC5nSemEsN83EGhwZSvLsHZe9mg3FRbyXZ8gBVwg6aJrvCPw0+ao2gRZEy5HYPu2D3
	WGJVz32x75F2tHFUqWF0aX4Q24yUfs4jfLSpakwM1PSZv6uIJB5iVpsgh2N3cRcCAkV93AXQaIW
	HodHbK8nfAkkygWHgvd43END9pqpl8y9JRB738ZnEMAXu8ZvWVosZHJUov6wSEHBEKqsB4XBhEu
	K0NC7KLShLE5Ave//Tb9FJsjvWVQOjltsUAJQULUaaGJkNSOEZkjcFxHuh5+loaktQJJN+HOcZ/
	prUBTp+LLSg==
X-Received: by 2002:a05:6512:3087:b0:5c1:4a42:fb17 with SMTP id 2adb3069b0e04-5c1bc89ed7amr4414564e87.59.1795521966845;
        Tue, 24 Nov 2026 04:06:06 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd01772esm3654675e87.39.2026.11.24.04.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:06:06 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 0/2] media: uvcvideo: Fix race condition on metadata
 buffers
Date: Tue, 24 Nov 2026 12:06:03 +0000
Message-Id: <20261124-uvc-racemeta-v3-0-f82822cbadb3@chromium.org>
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
X-B4-Tracking: v=1; b=H4sIAKt9BWsC/3XMQQ6DIBCF4asY1p0GsNLQVe/RdDHCoCyUBpS0M
 d69aNKNSZfvJf+3sETRU2K3amGRsk8+jGXUp4qZHseOwNuymeSy4VdxgTkbiGhooAnBEUlSum2
 dsawkr0jOv3fu8Sy792kK8bPrWWzvHygLEFArbosnGtR4N30Mg5+Hc4gd26wsf73iSupDL4GD4
 KSFleha5Id+XdcvXrJgeOsAAAA=
X-Change-ID: 20250714-uvc-racemeta-fee2e69bbfcd
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Georg Neis <neis@google.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3

This series fixes a race condition when calling streamoff only on the
metadata queue while streaming.

The first patch fixes the race condition and the second patch replaces a
busy wait with a waitqueue. It is probably overkilled and this is why it
is a follow-up patch.

Feel free to apply the first patch, both, or squash them into one patch.

Regards!!

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v3:
- Fix race condition in uvc_video_get_current_meta_buffer() by checking
  stream->meta.streaming under stream->meta.irqlock before peeking the
  metadata queue.
- Introduce stream->meta.streaming set in uvc_start_streaming_meta() and
  cleared in uvc_stop_streaming_meta() to prevent URB completions from
  acquiring metadata buffers or starving stop_streaming.
- Add Reported-by: Georg Neis <neis@google.com>, who also reported the
  same bug internally and pointed at the race condition without
  meta.streaming.
- Link to v2: https://lore.kernel.org/r/20260629-uvc-racemeta-v2-0-10e91d2afba0@chromium.org

Changes in v2:
- Use a new flag in_flight to avoid keeping the spinlock for long
  periods of time
- Link to v1: https://lore.kernel.org/r/20250714-uvc-racemeta-v1-1-360de2e15a9a@chromium.org

---
Ricardo Ribalda (2):
      media: uvcvideo: Fix race condition for meta buffer list
      media: uvcvideo: Use wait queue for metadata streamoff

 drivers/media/usb/uvc/uvc_queue.c | 27 ++++++++++++++++++++++++---
 drivers/media/usb/uvc/uvc_video.c | 32 +++++++++++++++++++++++++++++++-
 drivers/media/usb/uvc/uvcvideo.h  |  4 ++++
 3 files changed, 59 insertions(+), 4 deletions(-)
---
base-commit: b7ac871daee981f1963f632586ff9b9d898ce5dd
change-id: 20250714-uvc-racemeta-fee2e69bbfcd

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

