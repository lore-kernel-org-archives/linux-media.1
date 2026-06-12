Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31255388891;
	Fri, 12 Jun 2026 14:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781274418; cv=none; b=nbJPb0RVX6Cz8kiG2gbh31MkBCJRZFQfJRYkQ/llqob0qKyVJn2Li8IP9svkZ9h527hOHBLLyVz1VRZlAeqY/6jc1n9LLKxLpXOibXG/u/+9KOcUWw/D0dAv4uwjK0nuEXOSBWjQg7rBxr87rDBb0ujj9aqKBu9PLKFIRYc62ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781274418; c=relaxed/simple;
	bh=3/+l66Jby3Ob6b8WDbOFfWQZ2E/2AdQmfG5w8ZRKFUE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OlQF+lYHKhbswgom4CyJ7IBmxUwbcshIrkgrupViaWs5jye0IwHwPAUyEfuz0vTilp9eYlrXDX7W+OGIOfMjm8zNhCX7MTDmRyfyg6Xz+IdjcMDje5miyFFAu488jYz84ufDOBWifPNuKMabVkhtyw2fO2bI6od/E/BeUYUXbz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=epkv2RA9; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="epkv2RA9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781274403;
	bh=3/+l66Jby3Ob6b8WDbOFfWQZ2E/2AdQmfG5w8ZRKFUE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=epkv2RA94Ej8gwlUwI31mpuULnmWD/inam2UUvAtrbqrFI/o4wHM6egg489YpKhnN
	 3EYJvPU/Q9HCg4PqLH9vOvWLQPdB+71rZmNsPOhh/T+OjYbtO/bwC5KVL2DA0D6lUq
	 wyuW0/XJEmS8qsGTwmaUZNppK28p5CWf8O7OOZD6aj+UUwrX3n9JnIzkRk/C4hMUpJ
	 NAVeJ8tR/xfjD5/HZVMMeiVHMbazG3iXX3iEgu8hN/7lJW3vb6AlOcHHussMhWgR/E
	 5O48WQGuKoKBTaPw5UwlCf6559H4fsBRBaIaNL0oC+fJNaPYXIxmyc62ffzepb4vVx
	 lZ+FcmjB1xesQ==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EEE2517E0CD4;
	Fri, 12 Jun 2026 16:26:41 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Fri, 12 Jun 2026 10:26:24 -0400
Subject: [PATCH 3/3] media: hantro: add per-context fdinfo usage stats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-v4l2-add-fdinfo-v1-3-723211abc861@collabora.com>
References: <20260612-v4l2-add-fdinfo-v1-0-723211abc861@collabora.com>
In-Reply-To: <20260612-v4l2-add-fdinfo-v1-0-723211abc861@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, kernel@collabora.com, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Christopher Healy <healych@amazon.com>
X-Mailer: b4 0.15.2

From: Christopher Healy <healych@amazon.com>

Add per-file-descriptor hardware utilization tracking to the Hantro
VPU stateless codec driver, exposed via /proc/<pid>/fdinfo/<fd>.

Record a ktime timestamp when each job is submitted to hardware in
device_run(), and accumulate the elapsed nanoseconds when the job
completes in hantro_job_finish(). Report the accumulated time along
with the current clock frequency through the new V4L2 show_fdinfo
callback.

The output uses a media- key prefix with the following keys:
  media-driver:           driver name
  media-engine-<eng>:     accumulated busy time in nanoseconds
  media-maxfreq-<eng>:    maximum engine frequency in Hz
  media-curfreq-<eng>:    current engine frequency in Hz

Where <eng> is "decoder" or "encoder" depending on the context.

This enables userspace monitoring tools to compute per-process decoder
and encoder utilization. The current and max frequency keys report the
same value today since the driver lacks devfreq support, but will
diverge once DVFS is added, allowing userspace to approximate true
capacity utilization without any fdinfo code changes. A future series
can add hardware cycle counter support (via media-cycles-<eng>) for
exact utilization under DVFS, with no changes to the existing uAPI.

Signed-off-by: Christopher Healy <healych@amazon.com>
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/platform/verisilicon/hantro.h     |  5 +++++
 drivers/media/platform/verisilicon/hantro_drv.c | 22 ++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index 0353de154a1e..10287e5cebac 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -16,6 +16,7 @@
 #include <linux/videodev2.h>
 #include <linux/wait.h>
 #include <linux/clk.h>
+#include <linux/ktime.h>
 #include <linux/reset.h>
 
 #include <media/v4l2-ctrls.h>
@@ -268,6 +269,10 @@ struct hantro_ctx {
 	struct hantro_postproc_ctx postproc;
 	bool need_postproc;
 
+	/* Statistics for debugging and performance measurements. */
+	ktime_t start_time;
+	u64 total_ns;
+
 	/* Specific for particular codec modes. */
 	union {
 		struct hantro_h264_dec_hw_ctx h264_dec;
diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 2e81877f640f..139c2e6a83aa 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -90,6 +90,8 @@ static void hantro_job_finish(struct hantro_dev *vpu,
 			      struct hantro_ctx *ctx,
 			      enum vb2_buffer_state result)
 {
+	ctx->total_ns += ktime_to_ns(ktime_sub(ktime_get(), ctx->start_time));
+
 	pm_runtime_put_autosuspend(vpu->dev);
 
 	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
@@ -186,6 +188,8 @@ static void device_run(void *priv)
 
 	v4l2_m2m_buf_copy_metadata(src, dst);
 
+	ctx->start_time = ktime_get();
+
 	if (ctx->codec_ops->run(ctx))
 		goto err_cancel_job;
 
@@ -701,10 +705,28 @@ static int hantro_release(struct file *filp)
 	return 0;
 }
 
+static void hantro_show_fdinfo(struct seq_file *m, struct file *f)
+{
+	struct hantro_ctx *ctx = file_to_ctx(f);
+	struct hantro_dev *vpu = ctx->dev;
+
+	seq_printf(m, "media-driver:\t%s\n", DRIVER_NAME);
+	seq_printf(m, "media-engine-%s:\t%llu ns\n",
+		   ctx->is_encoder ? "encoder" : "decoder",
+		   ctx->total_ns);
+	seq_printf(m, "media-maxfreq-%s:\t%lu Hz\n",
+		   ctx->is_encoder ? "encoder" : "decoder",
+		   clk_get_rate(vpu->clocks[0].clk));
+	seq_printf(m, "media-curfreq-%s:\t%lu Hz\n",
+		   ctx->is_encoder ? "encoder" : "decoder",
+		   clk_get_rate(vpu->clocks[0].clk));
+}
+
 static const struct v4l2_file_operations hantro_fops = {
 	.owner = THIS_MODULE,
 	.open = hantro_open,
 	.release = hantro_release,
+	.show_fdinfo = hantro_show_fdinfo,
 	.poll = v4l2_m2m_fop_poll,
 	.unlocked_ioctl = video_ioctl2,
 	.mmap = v4l2_m2m_fop_mmap,

-- 
2.54.0

