Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393093D9DB4
	for <linux-media@vger.kernel.org>; Sun, 18 Oct 2026 22:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792364086; cv=none; b=mCa88GpuWcAOEoBtXKhk7vgMKgf1SHXcYJHahb6s+WXBdaJ+ZGC7OvnrOa9589jRxhkd5jZ0G6te7+KU71OhS2Yi7O826TIWuEVlk1mv02Ei3UOlxPCa2QiDSbBdtpmgMLXebsrzTekdZpmWXzcpqXZuAZU2JBxI527DtktgiK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792364086; c=relaxed/simple;
	bh=shS/TSAUSNZgZFv/tt5i8sgh58BoIorLEH1w73xfFIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CppK5bOmcxJJGfAjx806pWMtN5cf72qqMwAbQhwXOJ1MfrZtPOuZnY5rGFjzEm/gxZ0lXxWzJbxsZDxIVlmbDyx2Lw0698OdnpBYE+4Q8nlsYOpaU74aDC/qoV7ZpTvmrxjCHSVDMKvvnM2IXdZkS4/qeeRzRVxRXkIS7wvVPLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iyJqh3Ht; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iyJqh3Ht"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49e73611928so14937175e9.1
        for <linux-media@vger.kernel.org>; Sun, 18 Oct 2026 15:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792364081; x=1792968881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HdnS6jJ+HWOjTYJzZVT+srPkMgBGEUBcpFnCAxSY30U=;
        b=iyJqh3HtVLN/JmrJbNJCnRK/Th2aF220EnY3746QupEgxPL3R7i9U6hMrA+QblFW/I
         RygZBY20FkmzCSInuQFl1YqcWSyijx9xyS5yqvmI9W3GgtDlC/16TsTys8/ODZGqBKlR
         Sbx/sW4gNDkcUJe863Mm34uDdAjlrqIcKsUy8wb+gqkkmAbwhhFJZ/ehUB7BEgNRv/lQ
         Ng1yKAJ1CkPYtdd8IK8y7QbuJtaYkCXBu62ogY1kMTMzPQ8IY2pS22eJhS9wubJ8WGh7
         YOsxjggXtbSwyUseR2iOpYin9LSqhBoYrOwYiAWASI7PtySOFhvHCPubhJiTWKSbOa53
         bhMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792364081; x=1792968881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HdnS6jJ+HWOjTYJzZVT+srPkMgBGEUBcpFnCAxSY30U=;
        b=xr+OirXy4z7o4GfbkRA+2uvZPaFVjKDcF6Pq7yMNooGan8cYwEsWs2XJdFad+GtsAV
         PtGF+YjbldHJGzedMbXqEjseQF7HjookJl8S7LIXyXic6K4ncsk2g4my/kgCZXD3Syho
         1N1J1y1PKKQHAbACmFhz89kaYRQpOF+a/CocNzLmVuuj7WOUMdrkcCqXMG4R1CbGr0R9
         LLq1mj1W+9VIJ0POR0P8R5HkC7pUk/a93hqrkbmRPrmM25UZJa4P+yUni+EPCJjIl8tf
         vbSdDgoCRw/+ysvm/gLuLRGwrTom722CnMapXlbMc2SP546pSn9m5HAFEVvSpwhhFljX
         qZHw==
X-Gm-Message-State: AFq9FYJP3NgXq6P4pRxsMogDsRPUKTREZz31HzEQMggTQnH3u63V0f79
	Q4rXKWBuMWCU7YXYfPEK4n/IZbaH+vPa/EyKPC9UPdTB+ngU24/72TA=
X-Gm-Gg: AYBFou2+Oc+bfMTAFJ8VeKq68W9UI2f0/lNy7Adq/JvY7xJoHfq20o+2yHpw0NL5Qbx
	Gu2/XnUFxMt5SgyGJgtpRSYCFJT+U+SaDIfpHtWhMUI3ogEsrMMT34ctnuk9CheuMOGnbIfLaeZ
	5EzzeKWZnl8Y2mK5ZYFrWoTK6hh1tY1o2STLE5qoGdOstQd/DTyzZ/pkaNWzS3qq7a2YtHcduiR
	RNT0u1MYuCd4AotO9y8owKHFznznniTKgD/JWfpKuObTyzrSwQMY+wVJnpISPIjb2si3wY4fcca
	OP5nXKbXmLmLPjJIfKdkNtE+ImAPIkMqk6UsEnMkgxZf2GnLMbr0/YhcPoxxRfslXLFfFsWRWGI
	6xGuUhsAIWvSTvCObwAMJ0D9sh6oPO95o9Nv/rTUHMb62o6HGcLaimCmhNT2m/oFtUFk9gaEUTm
	hS8GSOJeuvrFrslx/BuTd0JaTTi0rWmKtlHYIW5zaawMfnmlK7QA==
X-Received: by 2002:a05:600c:a48:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4a1d7612bf4mr127226165e9.17.1792364081099;
        Sun, 18 Oct 2026 15:54:41 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e19ad17esm42257355e9.3.2026.10.18.15.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 15:54:40 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH 2/3] media: cx231xx: require minimum VBI transfer length
Date: Sun, 18 Oct 2026 22:54:36 +0000
Message-ID: <20261018225437.2655311-3-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261018225437.2655311-1-tristmd@gmail.com>
References: <20261018225437.2655311-1-tristmd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tristan Madani <tristan@talencesecurity.com>

cx231xx_isoc_vbi_copy() enters its processing loop when
buffer_size > 0 but then executes memcpy(dma_q->partial_buf,
p_buffer + buffer_size - 4, 4) which needs at least 4 bytes.
When buffer_size is 1-3, the subtraction wraps and the memcpy
reads from an unintended offset.

Raise the minimum from > 0 to >= 4.

Fixes: e0d3bafd0258 ("V4L/DVB (10954): Add cx231xx USB driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/media/usb/cx231xx/cx231xx-vbi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-vbi.c b/drivers/media/usb/cx231xx/cx231xx-vbi.c
index 338e101484653..c019649c62210 100644
--- a/drivers/media/usb/cx231xx/cx231xx-vbi.c
+++ b/drivers/media/usb/cx231xx/cx231xx-vbi.c
@@ -92,7 +92,7 @@ static inline int cx231xx_isoc_vbi_copy(struct cx231xx *dev, struct urb *urb)
 	p_buffer = urb->transfer_buffer;
 	buffer_size = urb->actual_length;
 
-	if (buffer_size > 0) {
+	if (buffer_size >= 4) {
 		bytes_parsed = 0;
 
 		if (dma_q->is_partial_line) {
-- 
2.47.3

