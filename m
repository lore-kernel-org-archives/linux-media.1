Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460023;
	b=JzNw9Ysazov2haw6CQdGvHvGmV+vMc9hGXCpCpsxtAGZ4VSBpG+bZ7c50hHUnF12Axdq
	 e4c6F7kG9e6z5iv0vE6ZDg/HtOCUgn+RdET7P7B5D0tG9SJty9UrZHv+bfm7GiE5Ql9Rs
	 5YRVwlN4WHgZDL/1RCRDKww1T1ELI2H1cAZS7/2gdV5oB9qh65nQpEPp/JnEAdkKC9hTk
	 CCor/3OhXcWJggxJ2sT7UdBhb29O+Wkg/6pf2Nuf9L+wE1QA4KPhWOJxa3SgPtR3c4vgn
	 pmKshhEaXOmXx+XgoCfHfBBgp4jxmewPpuOhCPz0lnd0RJnOr1m/SGoDqQggDGmOO/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LcRitGo4lD2hIcAgYM2qaSYzmhQhpMfVqRYqAyiwjTs=;
	b=3ZYvnJEV8S94vTG4evFHYgmeT7ZTWcq9x4HLk8bK0y0WpdbjLyRqQ3rmO1y2KfqDlK5P
	 Do39ouiVFNiU6lKJtpaSsAk0c0SaZTvsdln7sVfos4pjwwgAiabj+nvmu/0QMyux3PJnm
	 r/ob9e1kL300bPkHgqilIndqws22QUz84irnPhK6hrRmrF7k3cRxfP6BeStjUVm/5nx3B
	 Qlvbc/6YxfmlDl15PyvDRmXpDcr1KIAQSxe5uXJCmdQ7bwsCYeP+KBYXoe9rGJhkKVmmx
	 33wO6xtdTZ26rpQVadAkE1L/9mei2rhWZzHx5FwryQ6I+aK021eAi9FqXKvsgRLX31A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mAOmUalc;
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DC2606A319
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 01:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8DC2606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mAOmUalc
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5c9e7731b34so2025924e0c.2
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 18:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460022; x=1793064822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LcRitGo4lD2hIcAgYM2qaSYzmhQhpMfVqRYqAyiwjTs=;
        b=mAOmUalckAYE3ipsiPSFW+RBqpv2fxmy/KsYk60j0sVs/rUuRMg5GGR+RJhsQvtDF5
         D30Vdz6eO6El4iou30hlwcYkhh+g3P3YoJfop+d1B+3DvPZYBEO1TEXVjbrC5hUPUVfM
         BPioetrR11qKvJdRzKh7cJrx71fdlfDgYY0vLfWBzQZAIbcWjDLQgQTI8TGfY1QqbIt7
         i5lhe8OdzSYgjAIzjodXBlUlG1VJDzCxqClSzPOVMQWFC0nLgrcOL070TOpXF5MkvWI2
         9AvYK8FCiV0Vo3J4ixnXUr3MI4BVDlyaNwxSXz7zSXQ+faSZOH2sVHI9LryCTbULEQIf
         1cxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460022; x=1793064822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LcRitGo4lD2hIcAgYM2qaSYzmhQhpMfVqRYqAyiwjTs=;
        b=MeCyCAKJPWQorw92DItIpsD8CewKa9asmODNJ//DGQsdQGxEhDJuOb9vgUYgsVwPjL
         blsvoURnG7Vf14mxMGl9el/oSMo7uNiIZdwupaKoMzRFjvF2a5bzksqkBmn3SpAvurW7
         O3NGyBL246aotNVll6sB7aKbu4Fl1ooe4Zcq/UDIunMIxFrOg0laNosafByAeFRodWMd
         jquwamwv1M4G7mecuXJ5yOjApmUOFh5SVRiXdbTjh6hwefEVeodafqmpqJMdLjmJeRYg
         3HMsbW0ivEo/gEVXOaY9waaSLiqJhnYMOzxXt66jodM1FbDbeWkzF6cibuUIkQo/AwAz
         q2AA==
X-Forwarded-Encrypted: i=1; AKwUvBx2DTM9308RfYVU9iOUvysgiHT475wXXG7ipfP6EZzQ7Rl9rq6Z6eL76l34dkgTopvpFrOD7cW7Xkj8ZQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIwntQL2csrCjS9Yz4i1B9xL+ZYH94XECDC9y6kYXxW+UZiaMdo
	bwMHkkga0r/XWmenSii2auEiOG2ZrbJIdzLNriCVhz3XPJUNavyeKKMFXrY7CA==
X-Gm-Gg: AYBFou3uc112zVs2NhSWhbBMEYlhHfdhVLt4WttbqS4CF8UNITNk1SxlgVYh+VwBbT0
	gYAUB9lbkZNIB6GOoSgkXZW+tj+/bG2nYvR1kc2VCta2yZiTok8nUtcizravjDg8W9OwsqvL56D
	bqrbDdsxVDvVXHIeudtH9UVIPP3c//3kQ15FQkquBPqy8RwCMQ5/+w4ObI9yYEsamSuocqO2FUU
	A8QLOHcMfE9y0Xrp/p5jWt3bbrAa5EOG9pVWFOGoP1xTw6eSZ3bqv3ItW9uFzA1JUGvSY2E9AOp
	YrVQDx0TByBX4BHdeBaCaAvCWqWG51cplGiSj43fYFfII9mNMIHVllNW1UbTQ0uEkaOSQZPu4u9
	bDxh0nvGcpY63nnsgeSr1NnpLsKYuuhdDGfRUGVZ36jYuWujWXKqdluULe9zZDaV21GYJCh0kS8
	IuPHiOQ2wyoyzMlQijbu601dSrrDF9UNXWE4Q6fER6ox88G3Hg3uLD+BQWcRiXYfEaa7BwmqwWv
	MmZX3Kfnq0LNQK9EordCm3hf7VJkD9eyI1wIS8QWJ34/pZd3AC0yYlaqj+uJKts4yZC
X-Received: by 2002:a05:6122:6d10:b0:5cd:575f:9396 with SMTP id 71dfb90a1353d-5eaaa51809bmr2933859e0c.12.1792460021880;
        Mon, 19 Oct 2026 18:33:41 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.tail2bb604.ts.net ([2804:1b3:a801:c1b3:7470:124f:adf9:af22])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eadaefa69bsm1518201e0c.12.2026.10.19.18.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:33:40 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: sean@mess.org
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] media: rc: nec: Treat a full NEC command frame as a fresh keypress
Date: Mon, 19 Oct 2026 22:33:31 -0300
Message-ID: <20261020013331.251334-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NEC sends one full command frame per keypress, followed by short repeat
frames while the button remains held. The decoder already distinguishes
these cases and reports them through rc_keydown() and rc_repeat().

Without a toggle bit, rc-core treats a second command with the same
scancode inside the key-up timeout as part of the existing press. The
second tap therefore loses its key-down event. Call rc_keyup() before
reporting each full command frame so rc-core recognizes a fresh press.
Repeat frames still use rc_repeat() and remain unchanged.

Measured on a Ruwido Z3 over a 1.2 s hold: one command frame followed
by 11 repeat frames. Command and repeat header spaces were 4.5 ms and
2.2 ms, respectively, with no overlap.

NEC remotes that repeat full command frames while held will instead
produce press/release trains.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/media/rc/ir-nec-decoder.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/rc/ir-nec-decoder.c b/drivers/media/rc/ir-nec-decoder.c
index 37b99432ad0d..4357413763ca 100644
--- a/drivers/media/rc/ir-nec-decoder.c
+++ b/drivers/media/rc/ir-nec-decoder.c
@@ -153,6 +153,7 @@ static int ir_nec_decode(struct rc_dev *dev, struct ir_raw_event ev)
 			if (data->is_nec_x)
 				data->necx_repeat = true;
 
+			rc_keyup(dev);
 			rc_keydown(dev, rc_proto, scancode, 0);
 		} else {
 			rc_repeat(dev);
-- 
2.43.0

