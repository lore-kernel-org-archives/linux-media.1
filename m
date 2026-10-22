Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792698567;
	b=qFYCNCAbJ8mtSoKlrN9ux77mr/WuCYk+DfUiUiUGzFvWUFIlktvLggHGc9YOpm0uLIkn
	 UgUxqOD3V/JWhTC+jeqr/FgQNEBhBoCPA+bXp/7F728rPZclrUPp7i7KW+q9lVpkgKlJ+
	 Cb1V7GUNkzv4WF8XIv72/rX+YpGU9a8dyXk6ziSxRaxwyJg6iAueGAwomQJREoJ2YkoFt
	 Xx7w9bqvoLT/pRVugMDZtVj0DNAhetx+0g8ALb0IFXIUJ1McAPdLKu0pG8D2o1aQOVwHC
	 I20fPt8pcpMYjiDswAIUIheH9/B5Wyf+qby7jOF/VfqTgqQVGEXVj2F0nO8t6gduKeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792698567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aaS++5sXoJG/YlcvTtCnJ+zCT8E7XnqY59bgumC6lOc=;
	b=1YD6FCKqzxBc+w3NM+WKj/i4y+6i78O9aPxup9KfNNkFrkfdCrfwnFN5o9h0EQLv6YmK
	 GhrtXaPY4uStEY+U7P+6Sv6B2lZ/enix/VFmnW0LB4LRY44uZvl5dufDj3CuDqbv0vs/t
	 em8zgjtbZ5EFsC3uop/cyVKff6LpBVCwEd0DBs/kNS+Kd6aMg4WXDGkUPmWh5wP93sr53
	 HoEdmo1k9EjfE44ns+ri/6uhcyeCErv/mfGNtUxGqpMAqfqePQ2sMTtKhZVwG0Sw1xT4X
	 FUIdKuK3FyKXNqo2XUyKjzOp1lYY+nwCjOwuSUdDJC16MIM2/s6h9Wi9o1Rfqd0iFLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="b/RNinda";
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE3A606A31A
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 19:49:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DE3A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b/RNinda
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so88807a12.0
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 12:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792698566; x=1793303366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aaS++5sXoJG/YlcvTtCnJ+zCT8E7XnqY59bgumC6lOc=;
        b=b/RNindabrXdOmwiZAP9uvX3eS7eESJU5lbH5Pz7tZtFfVuenp3KryR8GK9UwgtGdt
         Z5/ZZH4ovkhh+nHQpiAWOr2oCjx9QSK0mt4ssL1dya0c6NxP+hbYgQQSNXo1kDqNNs5a
         bTc4lXgKAdKXdIafx/EdDCEfkpEhfmtECeLg66JjYMCwFS3kBwuI1RP4b9SRrPfXkvhH
         +qB84ucMR8IytDJ5rrCbNqu9pB3WAZf3N4yIFgcI3xl10kOQvbrNPNQkITnOYunwOT+n
         km2IZ5ZOCPzuLp2xbQS2ndjOn6A7aYjGSF8qYOUEQK+Pq5la/IuUYPthuvKQzk7SwzP8
         38lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792698566; x=1793303366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aaS++5sXoJG/YlcvTtCnJ+zCT8E7XnqY59bgumC6lOc=;
        b=dELcwAueDTdSYDBJ0e3nBWAPzW+nYYvHAZjQJ7oEU7XIt/+jxpcQMOs8CIrmunYsTM
         8Bpa7PPARSnG25SR3ZArcdyb2EN+TmLt6QkIZvYHqrVU9XzdtbGR1Qe5Lmh0hQME+n9i
         6UdztjMGYHDxnhdqvsByVA3cUHxva9A3iKdLMw0Zfvkr5mfQeiENfRQN8c+Mvv3dERkp
         WV8aZ7tmTSJTnoMwY54RYw50A9LALF0VDfFsfKQvxOB/3eiGkReAK/OVLb3bQl/kcOyC
         yeD+bhXyL/aDCCeA+Li1F/7R6SVh7SwdHe/7QFCzF+ERzBGY+APCUVOb2Kl464AP2g1h
         cG3w==
X-Gm-Message-State: AFq9FYLzS0I5zAXxBH7QAhxeVvwbrbprmPJxdt+KA5DQT2BEN5k7rz5I
	Ov+efC6EbtLmdOxKgoOPQ/vXAHtKNogzCzcSqhCk9TLwN/0EpQKkwzQ6Agujwr6q
X-Gm-Gg: AYBFou12G7exnPrEnBAd+lmw1vrStTRUKWTR44UUYsYDQAj1ZAMjpOqaii39hRE35op
	LY8rPtUs/eKgcI5nMUOaXJm1QUDadalTvF8V4gEGb2GoivWv4ArNAILgX4nnhC8IFU950uHQ22g
	3jGiwHsLyg8xSDdaaXenPgSonbbpQiXF3P62b+yYqvsQfgNY5rmSP3GmgWUmYp2ZYdX+yTFWS3R
	ojUuxCFzrfLtEW3I7oImj6hPy+d6Tx4AccrPW2j7cGF1zhkY+2K/Q78Lsn/sCr7pB5m3xt5U9Ms
	T1Ope77an6RVR9/hvFxUwBVICXbLuKhCy+90E+m/YZBZRm2aEb8Mws56kNaFMFz1Klo9iDp6ZrU
	xpSFTPfcVSYLPYYMTZVoSBuFCp8f/P5rl4WqcioYm3fZvXYcPu5S+eNlAx9hRrAGS2LVUfoCdmy
	Axi7YsT3ZdWLWkRi6712h/LOoKjItvhDB4wlC9dUbb3LGaRXTqu8IK+NOr2o0vZy+cirAGlUYeP
	+QHpTSvLJjBYaU6ZLypHRtFF8IETml9NJjGF69+TONe+SMfeotqku79ZiWyf4xWdvp3XCzyCi6l
	NX5rPZxzKYXgpv2Ps1xeA87WOJerDpEN
X-Received: by 2002:a17:90b:44:b0:3a7:e11c:4e6e with SMTP id 98e67ed59e1d1-3ad86f26e60mr5365036a91.59.1792698566516;
        Thu, 22 Oct 2026 12:49:26 -0700 (PDT)
Received: from casta ([42.116.198.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada490d4bfsm6400293a91.10.2026.10.22.12.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:49:26 -0700 (PDT)
From: Nguyen Duy Nhat Anh <neganhat@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Duy Nhat Anh <neganhat@gmail.com>,
	syzbot+809dfc586f33fc44b6ac@syzkaller.appspotmail.com
Subject: [PATCH 1/3] media: em28xx: check dev->disconnected in em28xx_v4l2_open()
Date: Fri, 23 Oct 2026 02:48:58 +0700
Message-ID: <20261022194901.14302-1-neganhat@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022194618.14170-1-neganhat@gmail.com>
References: <20261022194618.14170-1-neganhat@gmail.com>
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

em28xx_v4l2_open() attempts hardware register initialization via dev->intf.
If a USB disconnect occurs concurrently, dev->intf is freed while open() is
executing, causing a KASAN slab-use-after-free read in em28xx_write_regs_req().

Fix this by checking dev->disconnected under dev->lock in em28xx_v4l2_open()
and returning -ENODEV before attempting hardware I/O.

Reported-by: syzbot+809dfc586f33fc44b6ac@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=809dfc586f33fc44b6ac
Signed-off-by: Nguyen Duy Nhat Anh <neganhat@gmail.com>
---
 drivers/media/usb/em28xx/em28xx-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 84424284d486..d653341ffd16 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -2367,7 +2367,7 @@ static int em28xx_v4l2_open(struct file *filp)
 		return -ERESTARTSYS;
 
 	v4l2 = dev->v4l2;
-	if (!v4l2) {
+	if (!v4l2 || dev->disconnected) {
 		mutex_unlock(&dev->lock);
 		return -ENODEV;
 	}
-- 
2.55.0

