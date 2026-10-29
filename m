Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793285404;
	b=jm9fmmKkGsTbXnh1XG1QMRcz10aJRAVvfeZf8VMg8HGZB34gDj5h3yqqlgHdAU6VWtka
	 18azswQ+XmBtx2mR/lw9PLKzjJspaXvTcr4ZR7DTgmIsWBE+GLAOXyKIpcw3W29O6KWoO
	 v+imXWCODRVj8C8o0mdiHmzVZaUM4Qy6Q8hrsA6cWFiVwXlAAQUNqIFyyH1lsIVfR47h3
	 8L/NV0AYnRiX3itc91Zwi3zEgVUK5UwqhIKdfeVj9A7XQGyC2yzJJOpVcJIgvImQuZzW8
	 kqV+KrKZqyZv64THkfCqzDlW1ldq2k4NNPkmmFwHO5j/RjfFbQXPSsvhVDthkFDHcqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793285404;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=YiS+ZqM4N0etxzK3IEm5q4W24jW4pgB2WCqd/8bzfrM=;
	b=1/iuPc2ODG8pvqT3wkQxBLW4r7OxyzM0XYHjfbxqlJO65UeOS9W4JsvsDKGGDERwNIgU
	 PrUwCO2wz5eGoycbdo0USfajqr6Hm/y7hYTQfux16A40GKfg/9CBvLolqLOINjAumYDbF
	 hrYbszOpREhTc473qtNsRdoIQBWPS8E2wnIqFmiBOiZkgVAsqFNWT9NUv68kZTOawDz69
	 8cNi0EHqwGt/J7tZVgZMKMltEdDvehbJ+YTNPYsyzUWMUqma5bibqEyyncKp9K1EScSZC
	 PnNzqsBpRyBZlzKjj68UCfU61vXp0edvZ7Sk8nbfMjDQPBt9CradVf17n+Xr+nwQ7RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a4+MrLOs;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA55606A31C
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 14:50:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AA55606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a4+MrLOs
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso22980055e9.3
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 07:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793285403; x=1793890203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YiS+ZqM4N0etxzK3IEm5q4W24jW4pgB2WCqd/8bzfrM=;
        b=a4+MrLOsd9lAxrEAXdStaB2oVHOwqOXcdlUK00gbccB4ZRkS0/lcWillWoFIdBBeRN
         Ykq18IBUjeWxK7QjMws9JnzcjK+7ee5zX0WuhTYzo6KVq4uwfRalwbofTSR8F5JDgugD
         rcK//saMRXGf14fZDWzxU/4KZ8pFGJVuDrmW0DWybtMu20xLLA1kRM/CsqxQZ9/nLncZ
         ZaNFw7dDVohZyIoHnzj61MibvJPwEnzMBiFpD/zW2J7Ej4qcTA/cDNMPjuNuV4IWhOZO
         NU3joP9FIL0jNXZOOJp1es8ONPJEzm8U2S3E3pjn7w89VC83U7GefLPjUFAF2kVNQ8Wr
         RM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793285403; x=1793890203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YiS+ZqM4N0etxzK3IEm5q4W24jW4pgB2WCqd/8bzfrM=;
        b=BnKyB6O2m/jrjy8NJkgnT5I5h0cjJ+IRgsA8Wv59Y+26MqO+EyGVbFDsw5faahotZT
         wUJybS/lfcNEXK+FW8MKEpGlU9u4bYQ4PVmVO6nMSkDu68ghXb9YBfDOjJGWKc4PJAyl
         3jt6ECgjsPe1aUNQGhv7T38Su2lqyuwquDvPI+FFqfl+1Ly9ICTyTZqWm/2Ukn+cpU2S
         cutVUZ3L/0r54OwaNRaaaETQVa5/x83jscihxi0YadINr9jZNkj7vaG+jiTVxFMgu/sF
         kzJmcHfu8natb1cKP5exCuokdnxR9EXj+CWSygUUE0XIcPOVdgBo/CyYP83yiS5nQyM8
         OFNA==
X-Gm-Message-State: AFq9FYK3IqbTyRj9DZyUEFpD1/6QVwCek/XfFth3nlzhNwM3XmZSxhzt
	VO2+0UTr8hhquF1wBmzCy/MtLIgBsGZsQnlC58WfJnKvlRbnSvkNNSMR
X-Gm-Gg: AYBFou14eYzhvvzkkfMbXbGnrY/k9u2HMXdrLh1fqtjENnynbgB4scH4dVxmS2jO4xO
	ZKfbOd+5sc/CpCgqPdco6ZfEEhyMGFiVW92xNy/uyJ/1yUgDcTjUJzcEL+TghkUxrmzR+iQbVFd
	oEUXrgHj4c7RqRIxndxwAWZaU8CO3dZeRZISchWjEMJ4uJis2/aTrm8Shn8byaSU3re4ozmWsaJ
	SEFpGwgvZ84Hd4HCWj40de0zxouwACfxsBtBFuLYLY+EvVETHPWWeZDVK7BHcg39GZ0xvXZ2Ya9
	dU9NHtJ4Yy/OSeiMVzkYTeDOS3ywio60ugYoUCsjR8bH4PUEj/PZElX/EnIOOIDBAxDCZgaa4lH
	RR4SqS1p3Rp4qXOX3iulCIJklWjLt7A5cps4vS7zblII8J1BkYNE5WMBoJmOKf6Mo7VqfloXf5t
	A1UckVG2FuFZ+26dBkYm5hUTdYKkd6SQ7ufbsBcfLD/QrrF7Dz4SHuM5qtWaYPtDGQmeoS00mRl
	lc/4p+q/81qADwUwY2O+MquAY4Wpi+cJUggrAAY0bN1p1I6gbnlHfmu8u/f8IbiRGu2Eru7/o2l
	4NsE0DB6XqA5Lm3E0Uw6rgVIog3ok7FnNbto41alpndgiv7RqfUv
X-Received: by 2002:a05:600c:3b11:b0:4a1:dade:f049 with SMTP id 5b1f17b1804b1-4a966c41007mr131784155e9.15.1793285402509;
        Thu, 29 Oct 2026 07:50:02 -0700 (PDT)
Received: from LAPTOP-AVI.taile24b5.ts.net ([213.137.73.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f4188f4sm67280775e9.4.2026.10.29.07.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:50:02 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	Hans Verkuil <hverkuil@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Javier Martin <javier.martin@vista-silicon.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] media: mx2-emmaprp: return failed buffers on bus errors
Date: Thu, 29 Oct 2026 16:49:57 +0200
Message-ID: <20261029144956.1632798-2-thnkslprpt@gmail.com>
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

emmaprp_irq() resets the PrP engine on a read or channel-2 write
bus error but leaves the source and destination buffers queued.
v4l2_m2m_job_finish() releases the job without returning either
buffer, allowing the same pair to be scheduled again.

Complete both buffers with VB2_BUF_STATE_ERROR before finishing
the job so userspace can dequeue the failed pair.

Fixes: 8091cb7d9ce6 ("[media] MEM2MEM: Add support for eMMa-PrP mem2mem operations")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---

 drivers/media/platform/nxp/mx2_emmaprp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/nxp/mx2_emmaprp.c b/drivers/media/platform/nxp/mx2_emmaprp.c
index d51a621007788..f957383e8df55 100644
--- a/drivers/media/platform/nxp/mx2_emmaprp.c
+++ b/drivers/media/platform/nxp/mx2_emmaprp.c
@@ -354,6 +354,10 @@ static irqreturn_t emmaprp_irq(int irq_emma, void *data)
 		(irqst & PRP_INTR_ST_CH2WERR)) {
 			pr_err("PrP bus error occurred, this transfer is probably corrupted\n");
 			writel(PRP_CNTL_SWRST, pcdev->base_emma + PRP_CNTL);
+			v4l2_m2m_buf_done_and_job_finish(pcdev->m2m_dev,
+							 curr_ctx->fh.m2m_ctx,
+							 VB2_BUF_STATE_ERROR);
+			return IRQ_HANDLED;
 		} else if (irqst & PRP_INTR_ST_CH2B1CI) { /* buffer ready */
 			src_vb = v4l2_m2m_src_buf_remove(curr_ctx->fh.m2m_ctx);
 			dst_vb = v4l2_m2m_dst_buf_remove(curr_ctx->fh.m2m_ctx);

base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
-- 
2.43.0

