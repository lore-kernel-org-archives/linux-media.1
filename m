Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73D637CD2C
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 02:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790131137; cv=none; b=UQGn8/TyyhogCwkn4UIYWC1jhT/y4ydNWKkLlMlKBSxj8eu+wJoqRnQ5x62OsRYMlQPzbC7SHTZSBr88Bb0LSwjDPTqS0GOcFkfSySuOSUHLZ6NMs4zw8lXGBKdZcORvUHpWS5V4tCnxiVVVeg4iWIumNkHPEj7By/jHRFkPy7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790131137; c=relaxed/simple;
	bh=ll5avslSmYy+OO8aLrM+AiRPQkXsLQ65mSo61Ur6kgc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VeQZY17JYayzdWXyF9BiC7MzPdJYrpQKcCkc5q4J5tnOncpxvYF/GpngNufvITse7N5nxDFSZjVS459ydxKdcEc+jCunLsTveSNJbnbSVh1PzQNfD3mfuNVTYZCAStbSGUaihl1/3nffJg9n51Gv/c4P4ZVtU22F5/Dk8l71yLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tvlabs.ai; spf=pass smtp.mailfrom=tvlabs.ai; dkim=pass (2048-bit key) header.d=tvlabs.ai header.i=@tvlabs.ai header.b=S3Twq6Hu; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tvlabs.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tvlabs.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tvlabs.ai header.i=@tvlabs.ai header.b="S3Twq6Hu"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5309a20a55bso4768401cf.1
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 19:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tvlabs.ai; s=google; t=1790131134; x=1790735934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jGIcn5MmM7VHD1AXdXAsCEBvP7+aWce1RQjXCPJI2x0=;
        b=S3Twq6HunFV9WobCyDsNIkBbkTRdeDCEWmYAbUcaO+39vR7LbM/uxxICwhzOkutxn9
         7q7dA+FXNL9cYcMSOKkwEWaCgv8w3mtVe+84AAAZdkyzFOF5ryj0iSxYjwVoz5ElDSIV
         ET/r1Nbo0hXfn4q0KGz/Bd6gQ5VaQrCz/NG7iU+cmCdtGQ4Z7uaTYa+c04ZcNIxveuNj
         SBgJSea0jWLFQV2EXPN8EbsqQmyGCwcfvOJupivgMdEFeVzVKaAeVqngZKy6ZiKHCECX
         NmDNugIcI/F0fu4YrJt902hq5D6RuRhpKpTz69w6EcwsTZsw+/LWFddsN8nPn5O4ErY1
         Rhew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790131134; x=1790735934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jGIcn5MmM7VHD1AXdXAsCEBvP7+aWce1RQjXCPJI2x0=;
        b=nGqVuR+F+2D08xOo6kEZNiLF2xmeeFSsAUHk3zx/nnzhM/qVGamXBDjh7QLCf6E7Aa
         maJDxfUywrKOBn4bq2YLtk+t5UZJBfAwfTHPscxFXtup4uv5fowOgF11byERN9Gf+4nj
         TcfT94d/7RQlpO8sk5RRDhl4vvXGI6+GZ9/UwiI7ZPVE1o3pzedVtP7Z7M3/RbkapvRu
         /T6mb2ehgKFhESKju9yY9/1s7DiP03WO0ZCpvGwcX4dqMGUQc6J27a/NO4cKjdSqZywT
         zIefo9c/dWKb8tPlXSR+1Hgbnno7WMpWhc8b9ijH+S3yBttWHA1TXW7a70aPbic7cM1g
         jw4A==
X-Gm-Message-State: AFuF++nOEMaEDGPJAQZs4KC/+BrcXVKIlKwNkZ/ZVayqYPYAywHFGPRd
	dWh0Fj+lX0Bxa3i5DSuw3uYk8dCX1qml/2U3nQHKaVML9uSBf2dXNjuo/DQlZ7FpHrw=
X-Gm-Gg: AYBFou2qPjxEyUUVzeHLqXC5UbD8jb+BCAdeXq/VwDRYMyv4ibzudpKPahCm7suLDZP
	mdgYepxku1xWQ/ato/n49h6KED3xgNUbFPGdvrYT8Kc2oXJIcgFAgp06zS9lreQ3B8L/62WsGYX
	xoWo+2nShTYjmW3p9mYhF/D0tcFoAePPYcGuYIEylPtF80j6La35ZXf1z5rlVnuVHQG5uVO7Fyt
	J5x6+WiJFZB/YYjlFTArxxZSl73yxTxPSznonM3N8nAh83uq98BHG8PRGXD2hroVpIOXppgw7G4
	Vmxurwbdud1rLKM6qk5Atg55s99TkMKZknfOCBwKjSXxqFbcmyZN4Qfvut6k/IakugCF5XfzwEz
	3nVKao3yymYozt2w6TNIAx8pWa6cSndH+8amBf6COEDp9G9GQhyYWMzRv26xHciWwXX7KZY6WA+
	8RiPwt6/GbRamANQ41XFSzpNVdMkklsgjwp7EOTMVwGZkxGwp38LXNNadcjrsTFLsew6UQEQ==
X-Received: by 2002:ac8:7d4e:0:b0:530:f5b6:f007 with SMTP id d75a77b69052e-532eab2e5f6mr21879581cf.0.1790131134419;
        Tue, 22 Sep 2026 19:38:54 -0700 (PDT)
Received: from Mac.net ([67.244.80.237])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9140c45d3a7sm11250096d6.37.2026.09.22.19.38.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 19:38:54 -0700 (PDT)
From: Thomas Weustenfeld <tw@tvlabs.ai>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: linux-media@vger.kernel.org,
	kernel@collabora.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: synopsys: hdmirx: report DMA error interrupts
Date: Tue, 22 Sep 2026 22:38:46 -0400
Message-ID: <20260923023846.21166-1-tw@tvlabs.ai>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hdmirx_start_streaming() enables FIFO_OVERFLOW_INT_EN,
FIFO_UNDERFLOW_INT_EN, HDMIRX_AXI_ERROR_INT_EN and
LAST_FRAME_AXI_UNFINISH_INT_EN in DMA_CONFIG4, but
hdmirx_dma_irq_handler() only decodes HDMIRX_DMA_IDLE_INT and
LINE_FLAG_INT_EN. Any of the four error interrupts therefore falls
through the handler with handled still false and is discarded: no
counter, no message at default verbosity, and nothing reported to
userspace. The only trace is a v4l2_dbg level 3 line saying the irq was
not handled, printing the raw status word.

The practical effect is that a capture FIFO overflow -- the DMA failing
to drain incoming pixels to memory, which loses whole runs of lines from
the frame -- is completely silent. Frame cadence, DMA idle interrupts and
buffer delivery all continue to look healthy while the delivered buffers
contain unwritten lines. On affected boards this reads as unexplained
video corruption with every normal indicator nominal.

Measured on RK3588 with a 900 frame capture: a board writing a
semi-planar format reported 907 DMA idle and 907 line flag interrupts as
expected, plus 702 FIFO overflow interrupts, all of them dropped. An
otherwise identical capture on a board writing a packed format at the
same data rate reported none.

Decode the four error bits, count them per stream, warn once per stream
on the first occurrence of each, and log the totals when streaming stops.
No functional change to the capture path.

Signed-off-by: Thomas Weustenfeld <tw@tvlabs.ai>
---
 .../platform/synopsys/hdmirx/snps_hdmirx.c    | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index 25f8ca0d6d94..d7ff7aa4ebde 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -117,6 +117,10 @@ struct hdmirx_stream {
 	u32 sequence;
 	u32 line_flag_int_cnt;
 	u32 irq_stat;
+	u32 fifo_overflow_cnt;
+	u32 fifo_underflow_cnt;
+	u32 axi_error_cnt;
+	u32 last_frame_unfinish_cnt;
 };
 
 struct snps_hdmirx_dev {
@@ -1567,6 +1571,15 @@ static void hdmirx_stop_streaming(struct vb2_queue *queue)
 	hdmirx_update_bits(hdmirx_dev, DMA_CONFIG6, HDMIRX_DMA_EN, 0);
 	return_all_buffers(stream, VB2_BUF_STATE_ERROR);
 	mutex_unlock(&hdmirx_dev->stream_lock);
+
+	if (stream->fifo_overflow_cnt || stream->fifo_underflow_cnt ||
+	    stream->axi_error_cnt || stream->last_frame_unfinish_cnt)
+		v4l2_warn(v4l2_dev,
+			  "dma errors over %u frames: fifo_overflow:%u fifo_underflow:%u axi_error:%u last_frame_unfinish:%u\n",
+			  stream->sequence, stream->fifo_overflow_cnt,
+			  stream->fifo_underflow_cnt, stream->axi_error_cnt,
+			  stream->last_frame_unfinish_cnt);
+
 	v4l2_dbg(1, debug, v4l2_dev, "stream stopping finished\n");
 }
 
@@ -1583,6 +1596,10 @@ static int hdmirx_start_streaming(struct vb2_queue *queue, unsigned int count)
 	mutex_lock(&hdmirx_dev->stream_lock);
 	stream->sequence = 0;
 	stream->line_flag_int_cnt = 0;
+	stream->fifo_overflow_cnt = 0;
+	stream->fifo_underflow_cnt = 0;
+	stream->axi_error_cnt = 0;
+	stream->last_frame_unfinish_cnt = 0;
 	stream->curr_buf = NULL;
 	stream->next_buf = NULL;
 	stream->irq_stat = 0;
@@ -2080,6 +2097,31 @@ static void line_flag_int_handler(struct snps_hdmirx_dev *hdmirx_dev,
 	*handled = true;
 }
 
+static void dma_error_int_handler(struct snps_hdmirx_dev *hdmirx_dev,
+				  u32 dma_stat1, bool *handled)
+{
+	struct hdmirx_stream *stream = &hdmirx_dev->stream;
+	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
+
+	if ((dma_stat1 & FIFO_OVERFLOW_INT_EN) && !stream->fifo_overflow_cnt++)
+		v4l2_warn(v4l2_dev,
+			  "dma fifo overflow, captured lines are being dropped\n");
+
+	if ((dma_stat1 & FIFO_UNDERFLOW_INT_EN) &&
+	    !stream->fifo_underflow_cnt++)
+		v4l2_warn(v4l2_dev, "dma fifo underflow\n");
+
+	if ((dma_stat1 & HDMIRX_AXI_ERROR_INT_EN) && !stream->axi_error_cnt++)
+		v4l2_err(v4l2_dev, "dma axi error\n");
+
+	if ((dma_stat1 & LAST_FRAME_AXI_UNFINISH_INT_EN) &&
+	    !stream->last_frame_unfinish_cnt++)
+		v4l2_warn(v4l2_dev,
+			  "dma did not finish writing the last frame\n");
+
+	*handled = true;
+}
+
 static irqreturn_t hdmirx_dma_irq_handler(int irq, void *dev_id)
 {
 	struct snps_hdmirx_dev *hdmirx_dev = dev_id;
@@ -2115,6 +2157,11 @@ static irqreturn_t hdmirx_dma_irq_handler(int irq, void *dev_id)
 	if (dma_stat1 & LINE_FLAG_INT_EN)
 		line_flag_int_handler(hdmirx_dev, &handled);
 
+	if (dma_stat1 & (FIFO_OVERFLOW_INT_EN | FIFO_UNDERFLOW_INT_EN |
+			 HDMIRX_AXI_ERROR_INT_EN |
+			 LAST_FRAME_AXI_UNFINISH_INT_EN))
+		dma_error_int_handler(hdmirx_dev, dma_stat1, &handled);
+
 	if (!handled)
 		v4l2_dbg(3, debug, v4l2_dev,
 			 "%s: dma irq not handled, dma_stat1:%#x\n",
-- 
2.55.0

