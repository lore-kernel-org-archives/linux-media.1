Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11364F93D8
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 10:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073276; cv=none; b=AW5pmECtidOEnJHe8h5PJpNWScfhCYSxYMq6c45kQHf/IQkvH92DdMa0jqKblIpRlWpcQs6FoENVbB5jbx+tnydLnab6sv/qd1hOQSKjdWDBWkNt3vQNnaB5yTI9zGZ/09N8aPQf3Vads57Afbzf+XyQpEc/6Fd5luZihGmeUR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073276; c=relaxed/simple;
	bh=H6VOwjSi27ag04j3PcyJLtzkhoLWCfxwRnIPIXoKAuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TOUDPNfooiHyIEKm5OFr+kT2uQRbOklZSILLQYI3sd9PVA6ShAH3jb1vkYGVUTHGanleoTg0Dka9cMkGIblPWu92aeXk8JNgmpCHIlAnrfVguLWac3k+CxkyXo7AjtXXfh6IF8QE24/ArUQh8GwLozJg5F+Utr8r+GVSfC5/o/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kMbEDiYA; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kMbEDiYA"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so20380175e9.0
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 03:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790073269; x=1790678069; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=peD/4G2ym+y+xSTM4sbob6geygM9Qdvcv4LFRM23Ptc=;
        b=kMbEDiYAEsrFc6HMOeiBlZSf/ibrZ7Cl9LkTXUDvQRSiLuMLXPjFi0ZMXcFAphgVfy
         ldDasBAEUIpZBqcRyGHmylpaaVp+ph3eh4lf/+RqijezD25XyqA9scLU38/eiq7IofUe
         KfMN33AgX9aMGti+gjMEEnsbpWTg5oeueBYgabZHu8LN7dnRxotRYcnIXdHt0wxIHaiC
         a+Rl8Puw6drnDGDtc0Ki2MSevimW9MYViVBOujFpm+3TXkBzcc+4rdEb5dWlihEr/aoI
         Mx8voQvkcYmd5DdubniunFGmjP7H/PNh0oEtXLXGZi/d3de5pImqhHmvuTsSXJgUTGQv
         KCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790073269; x=1790678069;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=peD/4G2ym+y+xSTM4sbob6geygM9Qdvcv4LFRM23Ptc=;
        b=R+IAgditZUINgE3CLVuD3kev29xIm3dYKTn2OfBeX9P11G1FpLNwAkXGwmOzh42e2+
         L63broVZuVUltriyUKoUMir437+DjHrm5B0L3nCRuIAu0/ynPES1iM80YhDddSkzUCqU
         QqHKSRhqAS2Nm+B3lfaDYyBSalXKhyjTKzLzIYik/v5NaFKs5utYTN9wtAos8YOD3rUf
         o8tTLJGiz95O3fT0SdGmX0p+yfbxJIvrSkt5dhCgSFKJ6PSUlWb8OYwbtZnmG0PC2o+B
         SSHimbayiW6wwYmD6Eulg1rsrPpGgsz/APCVRSmb95I5PHFeeZara/dpTlUG4+PhWnFs
         sEng==
X-Forwarded-Encrypted: i=1; AKwUvBwCS2Tx7JRM+2daUhjzaPHP1/GMxLAiIPIKlr2Tl3tlm8WpiebL/jM26JlDhIxwka+1Z/VoLVF+5jgIMg==@vger.kernel.org
X-Gm-Message-State: AFuF++l+jwTuTNhmIMcHaFtNFaSAQ04RsUvN3+qfYuLVWc6E7LWUET5u
	KTVcUYjvM0lEvYwC2lyWyUpH6ed5knCUlfFw9L+kp5/D9eEGFITc4Dit
X-Gm-Gg: AYBFou12rD0+NuWnAbCpg47iczbFXEEny1P3GHQ6wq54bsqVuUfB8bd4fWzRLCUE9h7
	xC7n+HvHzSU0sn6+jIf+zsUPLJbKUUOuz6sdt87WodEDf5hk8XrqffRDq+x4+iEYYuTnFfdRb37
	GpaauKWw8QiD7r4aHvThjKlqXKBs2Xq098EshODyDIRSpNOvvEs0FZYRBqq5go5mJjTx5Wj3Akr
	3HFG9Jeq8pMaw8ZD3sEg8f8MwVNaOVo+U/DgWJtLjS1l69fQsol8tJa/C7YcZo43wfE7KOdr9KO
	ydOvMHik3LEPAEZTIqiEG3N39gY5NLrQuQmG/5qhZgS5sl7rXnTA/iFDvCgk1zhkKCCrE6hyX0O
	5QGirh0OrVWncITDtKPWjOyAv8qstkuMFU3m5Lu730H0Ao6lY8qSlnjdGv1lFa6z8ewppv158Rw
	TRFgGv2lKt3PSMjslCu3zGibtJJafiqDeRyKFPr4pWhOGkRDI1Yj6nX/u8rNFVgeNo2Us=
X-Received: by 2002:a05:600c:8a0a:10b0:49f:ce73:5e95 with SMTP id 5b1f17b1804b1-49fce735f50mr91800255e9.35.1790073268853;
        Tue, 22 Sep 2026 03:34:28 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886277e611sm4269938f8f.18.2026.09.22.03.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 03:34:26 -0700 (PDT)
Date: Tue, 22 Sep 2026 13:34:22 +0300
From: Dan Carpenter <error27@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: ti: cal: remove unnecessary error check
Message-ID: <arJZri2tFcBqBLgN@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The v4l2_subdev_lock_and_get_active_state() function never returns
error pointers.  As the comments explain, it "returns the locked active
state for the subdevice, or NULL if the subdev does not support active
state."  None of the other callers check for an error pointer return.

Delete this unnecessary check.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
I feel like if we don't delete the IS_ERR() check someone will eventually
try to convert it into a NULL check which would be a bug.

 drivers/media/platform/ti/cal/cal-video.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
index 59f0cc4f0d1a..1990cab77344 100644
--- a/drivers/media/platform/ti/cal/cal-video.c
+++ b/drivers/media/platform/ti/cal/cal-video.c
@@ -130,8 +130,6 @@ static int cal_call_active_state_set_fmt(struct v4l2_subdev *source,
 	int ret;
 
 	source_state = v4l2_subdev_lock_and_get_active_state(source);
-	if (IS_ERR(source_state))
-		return PTR_ERR(source_state);
 
 	ret = v4l2_subdev_call(source, pad, set_fmt, NULL, source_state, fmt);
 	if (source_state)
-- 
2.53.0

