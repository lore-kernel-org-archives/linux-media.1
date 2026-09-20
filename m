Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF2E41A78A
	for <linux-media@vger.kernel.org>; Sun, 20 Sep 2026 11:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789904404; cv=none; b=Qn6mXJPe4HvebbQMZStF/zZPXQYozG8BwUQv4tK06slW284SmTWLA3OnJfY6J5nTLWC2QKTGNI54xpFzbhFVPh0sCaUp+T69YrNN0saxHxD/tUQH+Hz1pYaxuTOf/z47UmIkJv5AIVNH6Ic/8jI94un9yYdpsn+H9ANc/XBwiy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789904404; c=relaxed/simple;
	bh=LceB0LS7j+MFWha8UPy32p0rP31JuLmjDEisZMDloXY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oOGhenO0k0SF9BRq19l3vtI6GZQ97Q1MD382QV2QtjEgcCNf9Kqe5p2WoP5lDpf0tsK7SBDRulIrO3VWigoauS7hZ0ZU5UQmFf8eSeuH2XADfIei0U0zkUXIQaUu3SzQN+DqKSLGxFVPJG7svGEkwq4WKHm58174zAwN7gPEAdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n1LlJBAY; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n1LlJBAY"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d91ede8035so25448935ad.3
        for <linux-media@vger.kernel.org>; Sun, 20 Sep 2026 04:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789904399; x=1790509199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oX07aaXGAvN5OBrOOHOsLFreyAL+4hdmNsHY0PkuU7k=;
        b=n1LlJBAY5cdwYXRDWeGgByiSlzUxd8YgbtW6UlW9IrW+BhpT3/8yoR5L5G5J+TG02c
         BB8m46ymv2lLv2XyYRQhFWk5Fwe9D/S2fUWngijwvn2BIYHbWjR71El1f+R+RHdusjXL
         Vzt9kIYhAucSD1x0H6BnhgrEbfV1++XCT2uPOXWK2MuGEsT4TCfnZY6Juw/cMXeKdSXm
         e+bAHsYM3gA50rbrf0r+598Zt9gxpZClsvI+AQ1N2djzSr8nXzsEbhG4dyu0nEbSpByt
         4y5v5MnpQF1Z2VQUBWaWGE10YweQSR0/NfPYxJdzQhNZ1zAkwtcRI0LEa/JK2+UmEQiu
         /LrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789904399; x=1790509199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oX07aaXGAvN5OBrOOHOsLFreyAL+4hdmNsHY0PkuU7k=;
        b=yKWH272ROU2yZstz57cuJMEGdweZSCEvIinoX5EOy3BR7xqjBnbUMmOtccbowIwlDM
         Fuv5SXkO3eHlT4I6V3u2mjNgImw0jnaf1Fj36qgILRyGN2t4/D1wvSPuE9/iUNV5aKUn
         JBWST8+cHtLGGny8j6q6b25E4wKJbeCehFo3eqpah7cDOhWUJv+fZAG76AxLFAvCGaom
         AXTjLodaMgHeqrSb3E9JXQrlphjkUeFmjNjxwEnsyfOjYkxlmdbcN++7YDFbfjD02ubb
         weybVpEBOgXJisGQAxDJqEWyqBDA5ea9C9l8GV1A/0RtEWbEKfkV/CN5Rb/tlUlsIVWr
         Rn0A==
X-Forwarded-Encrypted: i=1; AKwUvBxaeDQV5OLvE7/7XGJ6oKk5v2v8AsbUZesUfoz60G0lknB3exDDIzqvvyVi2gKIlsfopjZRugedI9m8CA==@vger.kernel.org
X-Gm-Message-State: AFuF++mVD67Mbx76aZLYZBfH55IJ+cTqqIXXNwdjFJVZoCwSs8h1S0hX
	aIafZm46IOEHINkFp4E0AcqS2wmc0sEt3gb6gqfQRjVzc01xBDzRDb+N
X-Gm-Gg: AYBFou1q0qdmCiNWGEfSLsBM9IwPXcEKwkPQ19RCGZH8MRWOPa613OfcR/khfcQXyk9
	IOh+4mqNcwvlin5465pqu5di4pOEsHszyoWofcmaS93QL1rtpKu83OHJGjbSzsdbvqJD1CvDEF9
	K7Zhmea1MphiEMqEyUDvBxf88JTs4QVDWmqa8zsTvowBG6hLNRK9LS4FRQn9s1u+AgaVkWbq7G/
	XSrZWhfC08HKQ7VsHX99jTrujc934SzL1dPSU7AitIQnRHlQbPNzbBNGiqiv8sBserVcuXwePTr
	cd0p4HuSBQg8yHMl3LltYWxg14/xnfxB2RCYMl5hVehaqz9LqngDCPLjF6eChUONXTuyvt2ahGY
	iz0WD2E1hncvdcipRPSt+Y6YDuTDkD8PLfx/w9QDv88yPTNDkqBoMNrXxpbmKdjA3kH8j4G9lQu
	5Qhk5ozTi+GNhWFQLpnwYKJteA863hfOBhnUHwe/s4aOQbbmZStrh8nssBFuKjk1J1CM9OWiduu
	gr549dnuJ9psMU=
X-Received: by 2002:a17:90b:35c9:b0:39e:6c6a:656c with SMTP id 98e67ed59e1d1-39e6c6a674bmr6138097a91.47.1789904398889;
        Sun, 20 Sep 2026 04:39:58 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d4a:e90:2022:c2a9:de8:d005])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c6dd585sm8490548a91.0.2026.09.20.04.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 04:39:58 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: floe@butterbrot.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v1 1/2] Input: sur40 - don't wait for buffers nothing will complete
Date: Sun, 20 Sep 2026 18:39:48 +0700
Message-ID: <20260920113949.12726-2-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920113949.12726-1-ngocthang2710.1999@gmail.com>
References: <20260920113949.12726-1-ngocthang2710.1999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sur40_stop_streaming() calls vb2_wait_for_all_buffers() before handing
the queued buffers back. Those buffers are only completed from the input
poll callback, which is gone once the device is unplugged. Closing a
video node that is still streaming after a disconnect then sleeps
forever in vb2_wait_for_all_buffers():

  vb2_wait_for_all_buffers+0x20f/0x330
  sur40_stop_streaming+0x45/0x310
  __vb2_queue_cancel+0xc5/0xf70
  vb2_core_streamoff+0x5d/0x180
  __vb2_cleanup_fileio+0x6e/0x190
  vb2_core_queue_release+0x1f/0x190
  _vb2_fop_release+0xe8/0x280
  v4l2_release+0x280/0x430

It has not been noticed so far because sur40_disconnect() frees the
device state under the open file, and the close then crashes earlier.

Return the queued buffers first. A buffer that sur40_process_video()
has already taken off the list still completes by itself, so the wait
afterwards only covers that one.

Fixes: 6a8588156657 ("[media] sur40: fix occasional oopses on device close")
Cc: stable@vger.kernel.org
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 drivers/input/touchscreen/sur40.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/sur40.c b/drivers/input/touchscreen/sur40.c
index 09d8c5f8d09f..7020bcf9b81a 100644
--- a/drivers/input/touchscreen/sur40.c
+++ b/drivers/input/touchscreen/sur40.c
@@ -929,11 +929,11 @@ static int sur40_start_streaming(struct vb2_queue *vq, unsigned int count)
 static void sur40_stop_streaming(struct vb2_queue *vq)
 {
 	struct sur40_state *sur40 = vb2_get_drv_priv(vq);
-	vb2_wait_for_all_buffers(vq);
-	sur40->sequence = -1;
 
-	/* Release all active buffers */
+	/* Release queued buffers first: nothing completes them after unplug */
 	return_all_buffers(sur40, VB2_BUF_STATE_ERROR);
+	vb2_wait_for_all_buffers(vq);
+	sur40->sequence = -1;
 }
 
 /* V4L ioctl */
-- 
2.43.0

