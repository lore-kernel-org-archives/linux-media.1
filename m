Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795619666;
	b=tDO1lESP1isAbXgYtZjlmhZV13GIYnMvS2b8DIQzy7XzHtL6lfbuv+57j8iuj1Lj/xDN
	 DSH+xYf44Kl67SG7SHfbXDz5xibKE2MKmXbTIMF9kwubr9b1o8tVuKXIbfJTFut8TszlX
	 BUIjpLkn0+duvS7hqHnq7C0ICH4//8kD73zE2GlYc6MYoXbFzZLGF4PErzujXX09Mhlnq
	 vKLv+AiRpT2DMP8r4uMKANT2FcLorauiCwZ0XYfc/kehcUBJhKmcFXJM9KnLf9ln2/Ly9
	 zfYrlmtxFDUShOEDvrHCvgHiEsr4RdGRm39eU9aztmLca0GYF0RgItmYtdBMoWKpgJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795619666;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=qKStgZwQURkYirvMcrFHgwHoDBXf4cbgorTNw0h/b4k=;
	b=zmp+BUqnNT/xOLVyaStoJ41X43bsxpt2RJjnACtx5gOJGAc0jvdbd5j4JBmb2uBjf9f0
	 MFUS9qEOtj8evYMPWtp8C9CmxJ8NQDVZMT0WuLi0jygZtBIsu7nei1y6ulejdQ02kb+FC
	 wlaXZEKyUM9GeRfgQ37bbChZeJFAqX6LvlUfz9C/14l9VG83INWq1ZuQIbnRXaFv4V9h0
	 v6aJsKPf0SAcLM8YywyJ8xLRHs7xLj3ttSIpktyjdIwApx2IeFrEuE3SnxB8t0rraV9sQ
	 8hzwUi6B2QMsWIORPDsYLINcQi0GVH7WLxS6DZLjRrSh/NOSlXOcjMjBwSs0J8gjWCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=aj9wkuf9;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CD8606A331;
	Wed, 25 Nov 2026 15:14:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30CD8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=aj9wkuf9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795619664;
	bh=5g72xFrgHxlQSNw1j1WuF55/AYxuBWjsHHYjMfQDYv8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aj9wkuf9lqKu+f5419u812EMh28XnoNsfGJvUFwP8/PyrXU8UHlROx8S8P5AOkZLD
	 qjF2ChkzEV7tKkOa3soEGl7V8pCpXjUNGDlYYEIxzWUgtlEf/fjH34Fs+GjM3B3Rlk
	 PpMEstdzBNygwlwnP1ZR5QShTT8ZjZhPkQE7tjQ5NSgLyw6q1aIoiCukU+15TCXs4O
	 d2f220Ixri0oQB86PWbRas5C0EOMe1K8JG3IejK2mLPmXyGVyDZmXCZfo5jJYNVdRV
	 D8vDBebXZ1ie3VLfs5Z/y+AwJnXmI0dmviKUdvcdnYRMPwQvswrxVExHIAUE9tx2wh
	 kQdUkM8D7g/Bw==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2480D17E130C;
	Wed, 25 Nov 2026 16:14:23 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Wed, 25 Nov 2026 10:12:02 -0500
Subject: [PATCH v4 5/5] media: rkvdec: Add per-context fdinfo usage metrics
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-v4l2-add-fdinfo-v4-5-2dc73fad9932@collabora.com>
References: <20261125-v4l2-add-fdinfo-v4-0-2dc73fad9932@collabora.com>
In-Reply-To: <20261125-v4l2-add-fdinfo-v4-0-2dc73fad9932@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, kernel@collabora.com, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2

Add hardware utilization tracking to the rkvdec stateless codec driver,
exposed via v4l2_metrics.

Update the v4l2_metrics instance each time a job completes with the
time it took in ns.

This enables userspace monitoring tools to compute per-process decoder
and encoder utilization. The current and max frequency keys report the
same value today since the driver lacks devfreq support, but will
diverge once DVFS is added, allowing userspace to approximate true
capacity utilization without any fdinfo code changes.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 19 +++++++++++++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec.h |  1 +
 2 files changed, 20 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 5250dd59df2e..4c9c80ac591e 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -25,6 +25,7 @@
 #include <linux/workqueue.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
+#include <media/v4l2-metrics.h>
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-vmalloc.h>
 
@@ -1094,6 +1095,9 @@ static void rkvdec_job_finish(struct rkvdec_ctx *ctx,
 {
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
+	v4l2_metrics_update_hw_time(&ctx->fh.metrics,
+				    ktime_to_ns(ktime_sub(ktime_get(), ctx->start_time)));
+
 	pm_runtime_put_autosuspend(rkvdec->dev);
 	rkvdec_job_finish_no_pm(ctx, result);
 }
@@ -1174,6 +1178,8 @@ static void rkvdec_device_run(void *priv)
 		return;
 	}
 
+	ctx->start_time = ktime_get();
+
 	ret = desc->ops->run(ctx);
 	if (ret)
 		rkvdec_job_finish(ctx, VB2_BUF_STATE_ERROR);
@@ -1304,6 +1310,8 @@ static int rkvdec_open(struct file *filp)
 
 	v4l2_fh_add(&ctx->fh, filp);
 
+	v4l2_metrics_set_driver_type(&ctx->fh.metrics, V4L2_DRIVER_TYPE_STATELESS_DECODER);
+
 	return 0;
 
 err_cleanup_m2m_ctx:
@@ -1327,10 +1335,21 @@ static int rkvdec_release(struct file *filp)
 	return 0;
 }
 
+static void rkvdec_show_fdinfo(struct seq_file *m, struct file *file)
+{
+	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
+	struct rkvdec_dev *rkvdec = ctx->dev;
+
+	v4l2_metrics_show(&ctx->fh.metrics, m, 0);
+
+	v4l2_metrics_show_clock(m, rkvdec->axi_clk, 0);
+}
+
 static const struct v4l2_file_operations rkvdec_fops = {
 	.owner = THIS_MODULE,
 	.open = rkvdec_open,
 	.release = rkvdec_release,
+	.show_fdinfo = rkvdec_show_fdinfo,
 	.poll = v4l2_m2m_fop_poll,
 	.unlocked_ioctl = video_ioctl2,
 	.mmap = v4l2_m2m_fop_mmap,
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index a24be6638b6b..590e213bd800 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -157,6 +157,7 @@ struct rkvdec_ctx {
 	void *priv;
 	u8 has_sps_st_rps: 1;
 	u8 has_sps_lt_rps: 1;
+	ktime_t start_time;
 };
 
 static inline struct rkvdec_ctx *file_to_rkvdec_ctx(struct file *filp)

-- 
2.56.1

