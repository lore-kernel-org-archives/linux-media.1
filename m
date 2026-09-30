Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583CE3C0A19
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 07:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790753728; cv=none; b=KoVlvLtcbbquyNW0e+U1ADc7FSalE2FZfcc9lG5dUMvFOvEIl4N8Es1TJwESIpkcqqUuIGmFJ1sdIyEMa6OQsHG+ER7j+5tjbgmntr/6Ukq5E0ZJc3D8hCI52R18HJ4B+v089O3pj1c1Omad+ZH2VJnkQRw+Im5Ec19Lok6yhgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790753728; c=relaxed/simple;
	bh=8jGVgeAsi4w2FymRKhfkQ4ZH8Dt7Je7AZlJL80qfSm4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=DFDYD43RFM2354M2B0i7FtVjmJ9f+/m7dIFnkw/lU/gd83djfaqo1usODJ+9ibAEhZgid0+9DgqdWEAQ3VjHTuzA15u9g/ik+rH4whFC+yN/EOd1ERRR4Q2+3VsFRwEk7cj11HcDjx55EUGCeLJqDs/ItdMjDWWVBMrj9WNPU1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lOH+0OK2; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lOH+0OK2"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a498cb99b3so889929a91.0
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 00:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790753721; x=1791358521; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/DmxIGCqxQEtfsdP4GpsNIMQ3eXB5ANPTlWJ5OIQB94=;
        b=lOH+0OK2hexo71FlcY4eRsFklOrOhrAYMyjw5tgW0zdsfUCA1yhyzrX8qXvZyin6AM
         NulXY0AVJJo77B8Mrp0saALZPVec0itaq9wI2ZibciBmAuZaZ/N1LN5iZBrD7/l5yCMe
         pyFu9exVrNEIYENKAq8ZbvVSZ52MviEkTcMr3xbwMyZXt9lF9r9LdFRB0n05TnVSw8TX
         vbUNB7zCcdiNblRZ7X2DObPQ2PJr5EWaxRCgAOqOrCqnmkrQE++v6vVHz3dVFoZj2FoB
         06A79NPp3q3h3218nVZSFMLENuipZrTk4oH5iW+8LB8eVyVUeB3s6NM1OT7uN8lecfvt
         3FjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790753721; x=1791358521;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/DmxIGCqxQEtfsdP4GpsNIMQ3eXB5ANPTlWJ5OIQB94=;
        b=AhdO3kzLa/lMJUggG0H3CL3ah5OgvT+urQc5JIS/k1b4rvkRhy5qOUAltp+RijORNY
         VWts9voJKNmlDRSAnCcc3EV62X1V5weuAMIyayCY+VVaDEXV6TRck6ru/qhp3j0nNMM/
         UKNeHTnSGwpMnoQpLgeGT0i8HqSpmzBujxk7AGbiCWWjZT9UxIAgWvDWZAFN9Pm1fWwF
         BA2RsvpTwim6ocBVTYwLjCJGueiNdLI9zchx0VBuT/przgAEYS3HBQKmZYT1kcXDBaMf
         Ic6EzCh2KQl5icKdTQOI1Ugks9HcdwA9ev7mD6Hsh6SvLeksLjhzOeOqzDbCHextA3+E
         FI/A==
X-Forwarded-Encrypted: i=1; AKwUvBxKARvl1Tef/24+kgzsCO2cDSRLk6NL6w4R9ZQbPo0j/dgCXV2IAWAPLhwJKR9JxqHTAOYCCihh4zSKwQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKRp2rjEVQgNJnVhhOOlGBHwSSrKw7QWeQz4Fln6a6cAf0QHFTy
	RKhVWBDJzKUOYPEIcrm2ehZ3uTuodh4VG5BsOUIIjdNFbgVV0W3OzawgWLXrMMTp
X-Gm-Gg: AYBFou1a/n3OQXszYwZHaXourHkwSMgZlRzMr+eFXefZ0TT2wySSQSBGSEDmXkXsoJ7
	DNqKOcSqgHvGzA/bnNpZijfLRkwEoePweso/W4xDTAv69AvxcWdss3MLa94owMs0Xz3EkrxefQ1
	E/ujaioViR6E5zFZicD9SpAr3S9DjuGHJ1T3dERmforYp5TIJ8sZm+Z98CUp6gt2yfnlIOezjHQ
	G1itoCmyAawc6aK+o5ZUewXHn+IuLRu+Zfv6Ayg3lDgyesDwPaqP9VAhZh3rFX+HW96mO9YxUP8
	EC5axdR7izlD/ctCBXlWR0wbJ3SfHeA+CHFy2Pfs0rMYVE8s0InrXq/iolcZbdC8yGi9fdDIoeI
	UZXyAe0tnoPwbcKRZ/rrN3VTx29G+hPJ1hasN7UXkZ2tjNMFNy1sf62WjU0c7zTspH6Sr7R4GzS
	hBCnxqGqHxMeFwzyJ35kBBiVCPqoEu8BYxT/UWP948szeFIzLZiZlTGpOE/tVZqNw9XmWrMQPLs
	xu/WKKUKNyaqk2DUyJsMCo=
X-Received: by 2002:a17:90b:1c08:b0:3a0:dec0:c0cd with SMTP id 98e67ed59e1d1-3a4d17a0c3bmr320928a91.28.1790753721107;
        Wed, 30 Sep 2026 00:35:21 -0700 (PDT)
Received: from SANGHOON. ([1.220.132.212])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4c7662ed6sm808626a91.3.2026.09.30.00.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:35:20 -0700 (PDT)
From: Sang-Hoon Choi <csh0052@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH] media: coda: store context ID before error cleanup
Date: Wed, 30 Sep 2026 16:08:58 +0900
Message-ID: <179075213853.3.17591166088476877916.idr-bug-26@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

coda_open() allocates an ID before formatting the debugfs directory
name, but stores it in ctx->idx only after kasprintf() succeeds. If
kasprintf() fails, the error path calls ida_free() with ctx->idx, which
is still zero because the context was zero-initialized.

When the allocated ID is nonzero, this releases ID 0 instead and leaves
the allocated ID reserved.

Store the ID in the context immediately after a successful allocation
so every later error path releases the correct ID.

Fixes: 649cfc2bdfee ("media: coda: fix memory corruption in case more than 32 instances are opened")
Reported-by: Changyul Lee <lcy8047@gmail.com>
Link: https://github.com/lcy8047/radix-tree-bug-temp/blob/main/bug_list/idr-ida-xarray/premature-id-release/IDR-BUG-26-coda-release.md
Assisted-by: Sang-Hoon Choi <csh0052@gmail.com>
Signed-off-by: Sang-Hoon Choi <csh0052@gmail.com>
---
Compile-tested on x86_64 with allmodconfig and W=1 against mainline
6f8319e3e9a44dd537d17f41565a8453c560a581. No hardware runtime or fault
injection test was performed.

 drivers/media/platform/chips-media/coda/coda-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/drivers/media/platform/chips-media/coda/coda-common.c
index be37ea568bfe..06b165c556f9 100644
--- a/drivers/media/platform/chips-media/coda/coda-common.c
+++ b/drivers/media/platform/chips-media/coda/coda-common.c
@@ -2617,6 +2617,7 @@ static int coda_open(struct file *file)
 		ret = idx;
 		goto err_coda_max;
 	}
+	ctx->idx = idx;
 
 	name = kasprintf(GFP_KERNEL, "context%d", idx);
 	if (!name) {
@@ -2640,7 +2641,6 @@ static int coda_open(struct file *file)
 	v4l2_fh_init(&ctx->fh, video_devdata(file));
 	v4l2_fh_add(&ctx->fh, file);
 	ctx->dev = dev;
-	ctx->idx = idx;
 
 	coda_dbg(1, ctx, "open instance (%p)\n", ctx);
 
-- 
2.43.0
