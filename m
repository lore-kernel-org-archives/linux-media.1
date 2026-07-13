Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7F2331EBD
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 16:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783959858; cv=none; b=ubEGEMPLcs97V2rXdbJszB+kirmBfCO1CQ9/9ixlUM45Olc5Jra9gTSZ/+vsnej2uuCvIPZFTdl65ys13jZm/ekI7UwUKFBlmAtHlOXB2T+erGovhYn9n01cxq081/I225XYfqY73OCRa5fQzApxl7kdfQxq0y6RRAfQb6Ku+oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783959858; c=relaxed/simple;
	bh=3Q+AodIikP9xCHgmvXlA1vIHQzvTfE3RDiDZXjwgjxA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pxeLt2C0mvFqbvXlQkyUi/m+mpyRNZQlvtZbM5yN4hBK2gPjsRjlDFFY/IQg92zYgxTbSEYs7GoazdAFgsriUKshxM7thP7B8LGwtifszUl2kSK74TRwaKD+gEAc4DhfYl3y6liGNXT7O/4e2X3O7NLuo4XsN5+CyBEbpCz1M1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RH//8woG; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RH//8woG"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cace91f112so29034165ad.0
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 09:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783959856; x=1784564656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WQC/83rTdPxjmMhg2uRtbJr8hdPQYpkf0x/BDJRkMyg=;
        b=RH//8woGqWA3oQi5WlN0K01/olRdB/0F8SwPXAcWVWehY+HHgxzajuSzjGLXMYtoBT
         6evdOPl9kB1LRlgCKnfC3h3kca10Fhvqh3CjFYMs3gP7gn0wLLO/4uaaEyeYwZUAvPhc
         lShdwhj6iNf0hJPwbGC6iQLH5QPvEToyaMvEZlRFbqphlQq7foHCoZfbao/x14xyDQRF
         4UEoCmWB/CRiNju0bA9Dmpo7R9kTjtiB9X65DIFeVwo0dJDj0ydsshDJIeVFFU+EnWlV
         f3n+5oipmJ3hIvToGxRNxLp/E6+CfthgwZ6GHn+aDPhZE+Zm+Jq8IXrGFbgLKkVHA5BL
         DODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783959856; x=1784564656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WQC/83rTdPxjmMhg2uRtbJr8hdPQYpkf0x/BDJRkMyg=;
        b=sAxCrqSQ/wtwJ1il8LKQavi+bzmMzZwcc+Scl4jkfEw/kwkzQ7I8HtJSHzYkCpyNM5
         DDbqBQZMgO6CcD4/a31/x+SCDFkIzscjfu+D6pI94zzsot+9a77WPQdpKKIR4Qc4Rd1O
         Qc4lEsu1HIb7f0KhJdJYTeBnpbMqP0yNDLSFflEUc6OGY9UfK6bvb1LMd92XxFjpBAS9
         44I4kR9JiuzlDCp26xjZ/MXljpernji6Dhn/r415qHjfx2I1LphLrBR2h1TSfBOUP0s4
         wn1sZ5u1843fOnG9GNqH5cozwPUv0hb7CIgRLBFIgBGc5d/WQqzxgRYapEG5A1410sLa
         DrSg==
X-Gm-Message-State: AOJu0YzjsvN3MF0DWp2T47c4g9jOAtE8qBD58EMq77HcJO5rdL1Dt+gS
	OwfTNeVkr66dKI4VhuUGZhihPK2yy+e8t85LvG3jTA025QzGNuU8mPl8
X-Gm-Gg: AfdE7clsPTducpNQzsgtaKf/2+tDYdE2c/KHy3l1h7qfR/kPbIXksmn/VDZYFUkLZpG
	GEhnxqupDmAWv0e6BMn2YWcb8asH0+2huZAAp841BiQFflNQv/DrMD+q8nDeQywLRaEGI6O7uXz
	8yylX6oXtnSE42Ett3S4Zl29IBsZLdLCYKrWx7ngKpdPQb/5GG1+UGRke/tRsom7vBnYcyHvd5x
	wSGoQ8B8Nj7Ck+57dapU7Qep9CFS6OqFzEpNgODjdX05GMRaaQn3KjKVLjeNCtcok1XSa7xFvVf
	RZ+BJXVI74oEM0kwNpYWArrs+9GkAgi2PhSAr9sBdL5NhOt8AxAFP/yZ2Xf/JyzYdsDSs+NQjYF
	b1Xka7GBOOou6Ubu9i4CRkvHb2IbJvVYkUROMoXfIGpQ6pHi4drbzK+N3wK7ZlrHmV/PK4lHx4x
	8MxohnymgqWEBFOXXvd7//O83Oe4blsyvWuXQq
X-Received: by 2002:a17:902:d591:b0:2ca:c68:c554 with SMTP id d9443c01a7336-2ce9f15d1f6mr88684135ad.38.1783959856288;
        Mon, 13 Jul 2026 09:24:16 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:fef1:348:93e9:93fd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d59e51sm103838005ad.76.2026.07.13.09.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 09:24:15 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: tfiga@chromium.org,
	m.szyprowski@samsung.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	me@brighamcampbell.com,
	koolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH] media: videobuf2: move vb2_querybuf() kernel-doc to header
Date: Mon, 13 Jul 2026 23:24:03 +0700
Message-ID: <20260713162403.13545-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the function documentation for vb2_querybuf() from videobuf2-v4l2.c
to videobuf2-v4l2.h to match other functions.

Leaving the comment in the source file prevents the kernel-doc parser
from extracting it - thus become missing from the generated HTML.

Additionally, format the comment block to be the same style as other
functions in the header.

Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
 drivers/media/common/videobuf2/videobuf2-v4l2.c | 13 -------------
 include/media/videobuf2-v4l2.h                  | 13 +++++++++++++
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 4baded4fd..5a1ee5eb9 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -635,19 +635,6 @@ struct vb2_buffer *vb2_find_buffer(struct vb2_queue *q, u64 timestamp)
 }
 EXPORT_SYMBOL_GPL(vb2_find_buffer);
 
-/*
- * vb2_querybuf() - query video buffer information
- * @q:		vb2 queue
- * @b:		buffer struct passed from userspace to vidioc_querybuf handler
- *		in driver
- *
- * Should be called from vidioc_querybuf ioctl handler in driver.
- * This function will verify the passed v4l2_buffer structure and fill the
- * relevant information for the userspace.
- *
- * The return values from this function are intended to be directly returned
- * from vidioc_querybuf handler in driver.
- */
 int vb2_querybuf(struct vb2_queue *q, struct v4l2_buffer *b)
 {
 	struct vb2_buffer *vb;
diff --git a/include/media/videobuf2-v4l2.h b/include/media/videobuf2-v4l2.h
index 71d2864fb..d51e10c10 100644
--- a/include/media/videobuf2-v4l2.h
+++ b/include/media/videobuf2-v4l2.h
@@ -72,6 +72,19 @@ struct vb2_v4l2_buffer {
  */
 struct vb2_buffer *vb2_find_buffer(struct vb2_queue *q, u64 timestamp);
 
+/**
+ * vb2_querybuf() - Query video buffer information
+ * @q:		pointer to &struct vb2_queue with videobuf2 queue.
+ * @b:		buffer structure passed from userspace to
+ *		&v4l2_ioctl_ops->vidioc_querybuf handler in driver
+ *
+ * Should be called from vidioc_querybuf ioctl handler in driver.
+ * This function will verify the passed v4l2_buffer structure and fill the
+ * relevant information for the userspace.
+ *
+ * The return values from this function are intended to be directly returned
+ * from vidioc_querybuf handler in driver.
+ */
 int vb2_querybuf(struct vb2_queue *q, struct v4l2_buffer *b);
 
 /**
-- 
2.53.0

