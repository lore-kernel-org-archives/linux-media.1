Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B993EFD3D
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 10:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785149380; cv=none; b=X25lFI/S/Fgx8ZbM6zEt72Ad6nj8yu/4CCjatYPr3kKLz3C7KJJEHjlbn4N//6mNzYNrOAazz8g4Xx4k5Jn0wCkETZEQs2gFC6urp33MbL/eJBHOs5tgRj6raBTfPI4pFWsFqzH9eu0YJJfCOv+KiOZipNApMSjv/1qoWI5rtXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785149380; c=relaxed/simple;
	bh=jStPYMXmFPqwTl0vq7UVe0m+/5Eqz8DD2z/KI52ZQo0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TFdKr2Uy62GQpAhJJBZ6jqSNuReMvkIF05+tpS5UJsvAJCQPWm+bxFUau2YBL0jfzULjlFVyeWInuOUww9jHFPybUFaIwndyUN32Jy0R+d/oQZK3AmxtIWg8BGA0IoaX3qLq02tIFZ0H1MEkmjCzPoHnU3eM+1x9EnuLfWU39lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ngHNFA3D; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ngHNFA3D"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso3599485a91.1
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 03:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785149378; x=1785754178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=duRNht6et+Fl8R8XCxDZOkDs1DxWvcJnqfifU+vvHvo=;
        b=ngHNFA3Dlde19NpT3KzwyCeQgkM79XEj2IjLfnbeKdmjwWDB/TNfXbt7kHQISoIrU0
         6MCRoUTtwu+6m8zUb4GU55+K3BnOwGH+6OHTqjvaqAKtgN5d/xySaWe63Ctb5iR6cqGh
         4OLDHVPrwKMPx6B0aZFw9LRQ2MS8dIII159t2zpJlkKhdtUAAndWQhbtfaH2jOTsytl2
         K5EAsJPKgoA02FWJ7hnqyzC22NYk5vozNiDGHLzS7DPHEzUWZAWknO3jq9bIzzl//VFr
         LwYzJUcxGgNkDV+7jMx6TSxnJhP1hZtliKMttIKEKGnIOezS5NDgXCD4sC3nckyDsudI
         5qBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785149378; x=1785754178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=duRNht6et+Fl8R8XCxDZOkDs1DxWvcJnqfifU+vvHvo=;
        b=qsF0D+v/JSM6vKaoXJM/JsnIvhID6ZSJciBhINR7idyA2E1M78Pc7wj1TxYkOci6mK
         9cuD4y8olF5YHFbr52HuEhRxx84zdi2+jV1Eqw1hAdH9b9TwjtQ6okwRhexbUCzgadRl
         HDjPZ8ZOat8V4NPnhjeGawb5p2TRF3zwgW1JbZDu5QaT8K91al7VFT65NadmAa9bHJ8E
         Z1E5ITLMI1KtWSEJMSvWllZIZq42VlVsVmMfiLVSCgvrFgX9CkmZNFsjeCGFtjEcWikq
         qjueJcfxLVm0GGwUcRhRQXZGrSOEbe9ggIZO18tabEUQSgowegPtiedHd72nTSXiwhfi
         gu7Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqt8HVEx4avsq/uRmz2AcfqC1k+mchnhH7g1MAN7ND9H3WfPg+eMp7klhpxsTNlYykE5Po3IFH+F/vfxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxD/HIxmWbyqn/YFDWc8ec7eYljpeHK+8EeTCFU01sgBjJbo6Bm
	1ZDf9wxnv9CCsQk4ECZye71pHm62rGISEZ9c2l96SpstygCaaqFMqWxJ
X-Gm-Gg: AR+sD13+wo0M8DkB+I1D+O2tuQhBacoaYOPZl4XeuG6EkKUilr3fhJnQAYPcJpoxZzi
	90PvbAWvKOternsvj6Z1QgUkB/UTPYkUljfdwjMD7jbHtC4O19PNSakKLIu3Tr/tiWbOMTX9Cmb
	yToaPLiSliED5VbZNCOu8xcnQp1dlbdsCQzogb1SgrnNjX0DMrKYnYF3WOBWOFteSSD1qP2PHdk
	ECOJWJzkqoCLdh/24kLC8y8jvmkOV+kHpV4GnK6sz/ltNrbLPIsJ+xqhSa4K56AKZ/aucpdmCe5
	lag4LR0AuheXbb6+Jb3fw79cUFLCZjeZof7/3AgHJccVUO9FhHDmVNEmQ1/Nhb+mEgAx3m9joIv
	FEhLWer4hmPKl0T9rMkRoW8ma0jzAQfILtRR43j8gxCU6Ebv7It+uKDhEcq1ojFAUn3WNwsxwu3
	i11V6fxKe8rPpGkoX3wek=
X-Received: by 2002:a17:90b:554d:b0:38e:4f41:83df with SMTP id 98e67ed59e1d1-38f294ea1e4mr7649628a91.15.1785149378420;
        Mon, 27 Jul 2026 03:49:38 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc548e63sm31716481eec.19.2026.07.27.03.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 03:49:38 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Frank Li <Frank.Li@nxp.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>
Subject: [PATCH] staging: media: imx: csc-scaler: fix ipu_image_convert_run leak on queue error
Date: Mon, 27 Jul 2026 17:49:27 +0700
Message-Id: <20260727104927.520546-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

device_run() allocates an ipu_image_convert_run object and, on the
success path, hands it to the IPU image conversion core via
ipu_image_convert_queue(); the run object is then freed asynchronously
by the completion callback ipu_ic_pp_complete().

However, if ipu_image_convert_queue() fails, the core never takes
ownership of the run object and the completion callback is never
invoked. The "err" label finishes the mem2mem job and reports the
buffers as errored, but never frees the run object that was just
allocated, leaking it on every queue failure.

Free the run object in the error path. There is no risk of a double
free: the completion callback only runs after the object was
successfully queued, which is mutually exclusive with reaching the
error path. It is also safe for the earlier "goto err" on allocation
failure, since run is NULL there and kfree(NULL) is a no-op.

Fixes: a8ef0488cc59 ("media: imx: add csc/scaler mem2mem device")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/staging/media/imx/imx-media-csc-scaler.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/staging/media/imx/imx-media-csc-scaler.c
index 00fcdd4d0487..359d973d297f 100644
--- a/drivers/staging/media/imx/imx-media-csc-scaler.c
+++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
@@ -147,6 +147,7 @@ static void device_run(void *_ctx)
 	v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
 	v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
 	v4l2_m2m_job_finish(priv->m2m_dev, ctx->fh.m2m_ctx);
+	kfree(run);
 }
 
 /*
-- 
2.25.1

