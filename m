Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792875435;
	b=EJEvN+C+sdw2Be5Sa12aPUg2zmfu3aOa1Rb4A9kuIN+P9fjyMF7JJNry0qHhHKMRlsFO
	 ux2Y5HqKIExQZi/ReN4L8FCNe2z7j7nM4MBhOD1b1wM+Q63XXqBy5uiEOCA7j2riuHOpM
	 UgrN7sMqWAYrEytpkegFdjgKS6/Lz+/kD1Zmjk57SbJiM4L0RV9p+br+FzkFwNwmv9ulZ
	 nOQ78ds8BkuucSer30L/t71BT++wpJSco4MowpqPCQQ4b5mGPidUgGJMG8K7+wMt5b5Jt
	 x67didJZ5d+eyTmk0mqayGpiuK2H8QpK7PywQu9wWywTRxHqhaftpZ2NaqlmdMHDh3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792875435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=IV1NP8FklaqMSKF4K9LgBOKBFJvutUzvKwE1feKuMJk=;
	b=qqmKYtCLp/tI3ZlMtw54eUL4xROC5xYTzbSRjCf1wJwPXDfQ1ejipq3h009Bnumf99VN
	 97KwhxWw+LRcRfhdJOmcsP1cOM3STYwVrHrgV2YS+S8eoLKt8q2vRznCwyF2OJq6GkDX8
	 rB/VUe0kuJuTCVPNySHW1R88Ofj3rdI+IH1NJtkHq3ytR1li45dQLd0zW0ajkDgzf3uZR
	 2mlc83rQJh9iO8hTjSJz/vXGcsRwiLucL1ir/Eh7G7sV5HJrynKt+V4WNVcCjEZZQ43fs
	 e3HsgEFYV4FM5umiAlzRSJQ4lmd95X9Zxhomrw1l3qg5YcmiS98qNJbeyjVIYmy5LyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cujVOZbH;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A27606A31B
	for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 20:57:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0A27606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cujVOZbH
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so13456475e9.3
        for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 13:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792875433; x=1793480233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IV1NP8FklaqMSKF4K9LgBOKBFJvutUzvKwE1feKuMJk=;
        b=cujVOZbHlQfToaTJYXhFKOmdi7F7oOBIQEBzgQxzq04TO0nTp0Pq4Fjx7TvqFwJAo+
         rtcIxzzEVRCOJL+qbkO7vsdqGmkWd7a1ZmcgO5X1cP7xTlh9OSE5Llx6uAXIpyDv2s+R
         +4+0G/CJ7Fbmn9B2UnEh8oa5f1g1v6p3DLhEH8SVzMbhC5Gs+fTfKyELTeYwVwZPCjjl
         jPSXetjPqQYQOuPvzQsk0KyuA++u2bNlr5pee1UQHQH1aIXdqId1LFX1pY9P/dg0e3L0
         aBBjA6wFF3NOPnmUx3d8PoHugujtju7/3pL0j6Z4ZiO4xR60k6FdjHfE3etuNPQov2Aj
         ffsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792875433; x=1793480233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IV1NP8FklaqMSKF4K9LgBOKBFJvutUzvKwE1feKuMJk=;
        b=hEsDynCXWcZoxrLbiWF1t8HjpukAuEU3cftFBtKoXoYCRRwbgnWzfN+z4P0C7G+HYK
         hosGzMiuqFDAvAvvTrP7L17A5BQcqRC65khMrlpMKvqvR7BhhgWL+sxXzg4WSs5xcjjn
         tGbMOekuR95h6vPnXflwrMCd6xGdJ/BcUriiy/czTC0WCLQXKVUp0h2V5Z+QtQkxWAtk
         CohSBd4F+lGdq4Di1OxCzwSsGqrX1vUNOJwzu+MvvDW34Eak4kEKYu6tX/8P3oQlJasn
         KsEeEMbA/OziiTYdhHfbwz2OoObYQqdjMyBntHYtrt32T9LsXDL588GHwFZRgZVtc4u8
         /oBQ==
X-Gm-Message-State: AFq9FYK+kMofMkIZ2QlVCQ97uUSbNr3Z4ogmsLdzLQknolJtzn4oSIb8
	vrDurR6hNcOdmEHVsgY8EuqAGSLSCqWgHuKkssSeBmRdYEBffJmlPaE=
X-Gm-Gg: AYBFou1RHC1qcaK5r8zJIBnlo4ugFo5sBqKf0Y53VTopSMwHhOh3nTGMoDG6mRKfIHe
	+VpERlBRHBFKmsO8YHwWfnQxgXvuaJDCS8HGYzQ0Ar3SZHF9RSF/rtfsDoEOCot37xoiIfs0zj7
	t/lCCwhOpie8KCGzkiqYuy9qh9jJttDkrwqzeVO51aagRHWa7p0ijVRXH1jFlcL+2hlevxBzz/Y
	ttIzfp/1NxdtGuOMoQFL3ob2i4NUK2I7yfd9dqJQawhpnwdlNQjGVYSbv8OVl+velg+lCrExumf
	s91MlUSMPfPoVCtHbJPfqsYNt4RAWWoAE5iz/ZcdYzQJDdeBCE7D0Kjyf1qckG0sNpWCRv+ltVa
	kZH3nnqEvCNz4sTtLG5NMsByCOMlcN78U3tvSDe0aEhDzuVR/h36yzt69YqiXEWupVJrCmmkKGo
	o9xly/+LUzlphFLcYth2rrtcZTXgh8m6rNAaEq/GDS7CqfzZQmmc4oi1xCDFM2Xuisv2e+1OpfV
	8u2dC3n8kaW4X5HorafNzFt
X-Received: by 2002:a05:600c:4f89:b0:4a1:ddaa:571e with SMTP id 5b1f17b1804b1-4a35ac9d018mr45023005e9.15.1792875432943;
        Sat, 24 Oct 2026 13:57:12 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35b4a8bc1sm33788405e9.4.2026.10.24.13.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:57:12 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH] media: v4l2-mem2mem: cancel job_work in v4l2_m2m_release
Date: Sat, 24 Oct 2026 20:57:11 +0000
Message-ID: <20261024205711.4041369-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Tristan Madani <tristan@talencesecurity.com>

v4l2_m2m_release() frees the m2m_dev struct without cancelling
m2m_dev->job_work.  If a device operation schedules work via
v4l2_m2m_try_schedule() and the driver tears down the m2m context
concurrently, the work fires on freed memory.

Add cancel_work_sync() before the kfree in v4l2_m2m_release().

Fixes: 7f98639def42 ("V4L/DVB: add memory-to-memory device helper framework for videobuf")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index a65cbb124cfe0..311e2e08d066d 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -1207,6 +1207,7 @@ EXPORT_SYMBOL_GPL(v4l2_m2m_init);
 
 void v4l2_m2m_release(struct v4l2_m2m_dev *m2m_dev)
 {
+	cancel_work_sync(&m2m_dev->job_work);
 	kfree(m2m_dev);
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_release);
-- 
2.47.3

