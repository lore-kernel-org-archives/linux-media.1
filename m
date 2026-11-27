Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792840;
	b=QcggH6Vj4IZkZqhAt3YDEDz51I2SB4i/J7/yIhiwjednRGChkyKkxKoUDGMTT1428MA+
	 qQr4gUdhYCgN73GJey55alv+6RhoejYJPiHj/ui99OHOp2wqD1Ww7gJPUt38oHMRn7iT2
	 J5ya1QhTQwCcgTWMnDpsEg6W3UQYaV55Nj/Eldx8RzIRG0cqF8W2mkZJVJGsEvuz2U/XF
	 JZkuAdKOYk8VOGqLbiXGZf4RC1YEntw3ggYLc6h5OawJJBlrzDFPKUgu93z/qqDDh7Pvp
	 SKNd1tQEINrzsysjaFij8c4JkrtkauUDG8B8kbvxbDUOv0uARUSo7xFV12OjtMMijeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792840;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=6gfcEI0d1iDPQQPAeSbZ7xfrsCIN10+HJASAbCPe2HE=;
	b=iiHIs1IbAtvSbmK9ZTm/0Bz3EaH6PbLXtB9CPX2UjJ4VRypHHrl4q2JdoGz6eDGvrCLW
	 PaAMjKWJp8wRkY7xRULXbq3XxHN7fd0NRDuxSIfUw952JWjW0vexIRt0T+yuNbl3UJ17b
	 da5jkD0n8VAoKv4M5wx7OTp0Rqr0mlxn3KzbwpErizlaQNoORmv2dYNgx2RKaMEHQ5Z96
	 yJ9IX0Fj96cfK/rw9XgnWWFyU+GDL8QyQXnb2nrL8syLL67gAlfv46hkkt8W9dNgi7bwK
	 H8FJx2NWMzCzhXYdjxFhMYKHxoLTB4adHd2QTq5Zw3qNq9oNVc5fQyctMv0bp10wFrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=fd4se8+m;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AE99606A321;
	Fri, 27 Nov 2026 15:20:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AE99606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=fd4se8+m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=6gfcEI0d1iDPQQPAeSbZ7xfrsCIN10+HJA
	SAbCPe2HE=; b=fd4se8+mEOcXB1FpaBVH/vFgYbTopAO3cQlfiCjwEUHlYLkJ2D
	TADsW2aWqxOej/E6s5fTYNCR8rANpdCUdTOahGCiIWuncnnoAbVPNrt93fClJ/Oe
	Tkxp0SaEbNFzyaOHGFiYq0Wzw7tHPnMYCm/kwFR11eFz1WdWo6Emb+UOI=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.180.66])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgCnMke4nwlrB1EDAQ--.2959S4;
	Fri, 27 Nov 2026 23:20:25 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Stefan Schmidt <stefan.schmidt@linaro.org>
Subject: [PATCH 2/3] media: iris: fill in a default colorspace for decoded formats
Date: Fri, 27 Nov 2026 23:20:23 +0800
Message-ID: <20261127152024.2149804-3-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127152024.2149804-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261127152024.2149804-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgCnMke4nwlrB1EDAQ--.2959S4
X-Coremail-Antispam: 1UD129KBjvJXoWxCw18Zr1ftr1xGryUWFWDtwb_yoW5Kr4xpF
	1rCrs8ZF4UXrnxJFsrJ3yFganxXay8XryY9FZxGrW7CFs8C3WfWrWvkF13GayUJrsxA345
	Cr1UAFZ8Can8Cr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBqb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82
	IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
	0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMI
	IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
	0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87
	Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU0BHq5UUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREDB2sHyZtdggAusb

v4l2-compliance fails the format ioctls because the capture and output
pix_mp colour fields are left at V4L2_COLORSPACE_DEFAULT:

  fail: v4l2-test-formats.cpp(414): !colorspace
  fail: v4l2-test-formats.cpp(537): testColorspace(...)

A decoder cannot know the stream's colours before it parses a frame, but
the format still has to round-trip a valid, self-consistent set. Default
to BT.709 limited range and keep the value when the client passes
V4L2_COLORSPACE_DEFAULT back on S_FMT, so G_FMT -> S_FMT stays idempotent.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 drivers/media/platform/qcom/iris/iris_vdec.c | 26 +++++++++++++++++---
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index e702e6b..32d4368 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -36,6 +36,10 @@ int iris_vdec_inst_init(struct iris_inst *inst)
 	f->fmt.pix_mp.plane_fmt[0].bytesperline = 0;
 	f->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_INPUT);
 	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
+	f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_REC709;
+	f->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_709;
+	f->fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_709;
+	f->fmt.pix_mp.quantization = V4L2_QUANTIZATION_LIM_RANGE;
 	inst->buffers[BUF_INPUT].min_count = iris_vpu_buf_count(inst, BUF_INPUT);
 	inst->buffers[BUF_INPUT].size = f->fmt.pix_mp.plane_fmt[0].sizeimage;
 
@@ -48,10 +52,10 @@ int iris_vdec_inst_init(struct iris_inst *inst)
 	f->fmt.pix_mp.plane_fmt[0].bytesperline = ALIGN(DEFAULT_WIDTH, 128);
 	f->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
 	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
-	f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_DEFAULT;
-	f->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
-	f->fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
-	f->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
+	f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_REC709;
+	f->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_709;
+	f->fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_709;
+	f->fmt.pix_mp.quantization = V4L2_QUANTIZATION_LIM_RANGE;
 	inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
 	inst->buffers[BUF_OUTPUT].size = f->fmt.pix_mp.plane_fmt[0].sizeimage;
 	inst->frame_rate = MAXIMUM_FPS;
@@ -325,6 +329,20 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 	default:
 		return -EINVAL;
 	}
+
+	if (fmt->fmt.pix_mp.colorspace == V4L2_COLORSPACE_DEFAULT) {
+		fmt->fmt.pix_mp.colorspace = V4L2_COLORSPACE_REC709;
+		fmt->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_709;
+		fmt->fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_709;
+		fmt->fmt.pix_mp.quantization = V4L2_QUANTIZATION_LIM_RANGE;
+	}
+	if (inst->domain == DECODER &&
+	    inst->fmt_dst->fmt.pix_mp.colorspace == V4L2_COLORSPACE_DEFAULT) {
+		inst->fmt_dst->fmt.pix_mp.colorspace = V4L2_COLORSPACE_REC709;
+		inst->fmt_dst->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_709;
+		inst->fmt_dst->fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_709;
+		inst->fmt_dst->fmt.pix_mp.quantization = V4L2_QUANTIZATION_LIM_RANGE;
+	}
 	memcpy(f, fmt, sizeof(*fmt));
 
 	return 0;
-- 
2.53.0

