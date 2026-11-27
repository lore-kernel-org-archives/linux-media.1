Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792840;
	b=arPEA65YBryFpppA49/4tEagU+JaRhKR6/SPqNuCaLMXuBwZgbFeXGMekQp2kkgAoOiR
	 m2xYegz+m+qt4fJNwAajtbt/aBgs9Oah8DVTdFbIt49MpkVCB3cS3X6GxSp8D+/0PckW+
	 Y/ek3yrrSpiXaG1w38V5bFl90lJOXbSEALqbvojNjWrmNdg8v4RLsTvOVkfaNrJTdYNOC
	 1/ETN20XerG7S+1NdHLqWgxZrRF1grKYnZPJnmfr/9G/Z1IJrOE9E8cW3K2sPAWaE0GBR
	 c46XWNPwgWZviEinnoWdJ25yUJJRVr7R5nTXgKqYiMSfJvcPtVOJun/eHvga3BVsWyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792840;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=2RvOvHeeOrCTjfQHXhosaTxRY6j72mnCuAK7MgOgoIU=;
	b=0K802hWQAhfDB9ITGEDbKvvJqm4Ndyxc+Or4zDgsWC5FqWrJgtJO2BH+MKZuQSMxa7N5
	 udewHii4jpA9hySPytlHpBI70F35EzgsIdICpxaU2HNLQni98Q6GRLj/811bGrf/0OOAO
	 xAAVmelqRiIUeUvJWcwaeP6UPGOb5JYdkNnhD5JRzevSz6RQZRy6Mr0lI5tNjuhLQ8C3Q
	 dY5vxPgTiXwHhOsYZKVOxi8LHSVoOKfMRtiwVIluyb95V7ioy0QoCQJPGzeR1ZiSWVJlH
	 lKhtpY5EH+UlPXRyReZLT1nCrRybHVsS73LJBSPLY4FfVruhUjCKKvySb+aUDRhR3+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=iihmbFg0;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B18D606A324;
	Fri, 27 Nov 2026 15:20:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B18D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=iihmbFg0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=2RvOvHeeOrCTjfQHXhosaTxRY6j72mnCuA
	K7MgOgoIU=; b=iihmbFg0I5Bz36s/gAdckXR47qHXjOLVqopWfFyVR3jKmEapVb
	x4Ayeft7xN1145qtijBb9Yyuan8gX36qcOor5DaSpofK+hySwUylvcYy3NohNXSP
	ZizVyptHRGsOHzTOp39U793ueTCj4LaVQBaBOf0qbiP6XspqtGWYnDrko=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.180.66])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgCnMke4nwlrB1EDAQ--.2959S5;
	Fri, 27 Nov 2026 23:20:26 +0800 (CST)
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
Subject: [PATCH 3/3] media: iris: seed the crop rectangle when only CAPTURE is formatted
Date: Fri, 27 Nov 2026 23:20:24 +0800
Message-ID: <20261127152024.2149804-4-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgCnMke4nwlrB1EDAQ--.2959S5
X-Coremail-Antispam: 1UD129KBjvJXoWxGFyxtFWUKry5tr45Kry5twb_yoW5Xry5pF
	y7Ca9xCF4UGw48Z3WUXw48CFnxJrWFqrWYgrs7W3y2yF1Uuw1ruryrKFykJF48Xw4Sgry5
	uw15GrWDArs5WrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBqb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUWwA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82
	IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
	0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMI
	IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
	0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87
	Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU8AgA5UUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREDB2sHyZtdggAvsa

After the source-change rework iris_vdec_s_fmt() keeps inst->crop as the
visible rectangle of the stream and clamps it against the CAPTURE size:

	inst->crop.width = min(inst->crop.width, fmt->width - inst->crop.left);

inst->crop is zero-initialised and only seeded by S_FMT(OUTPUT). A client
that formats only the CAPTURE queue (which v4l2-compliance does) therefore
keeps a 0x0 crop and G_SELECTION reports width/height 0:

  fail: v4l2-test-formats.cpp(1617): !sel_crop.r.width || !sel_crop.r.height
  fail: v4l2-test-formats.cpp(1769): !sel_compose.r.width || !sel_compose.r.height

Fall back to the CAPTURE dimensions when the rectangle has not been seeded
yet, preserving the clamp for the normal OUTPUT-then-CAPTURE order.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 drivers/media/platform/qcom/iris/iris_vdec.c | 24 ++++++++++++++------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 32d4368..65e7550 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -318,13 +318,23 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
 		inst->buffers[BUF_OUTPUT].size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
 
-		/* inst->crop is the visible rectangle of the stream */
-		inst->crop.left = min(inst->crop.left, fmt->fmt.pix_mp.width);
-		inst->crop.top = min(inst->crop.top, fmt->fmt.pix_mp.height);
-		inst->crop.width = min(inst->crop.width,
-				       fmt->fmt.pix_mp.width - inst->crop.left);
-		inst->crop.height = min(inst->crop.height,
-					fmt->fmt.pix_mp.height - inst->crop.top);
+		/* inst->crop is the visible rectangle of the stream. Until an OUTPUT
+		 * format has seeded it, fall back to the CAPTURE dimensions so a
+		 * standalone S_FMT(CAPTURE) still reports a usable crop.
+		 */
+		if (!inst->crop.width || !inst->crop.height) {
+			inst->crop.left = 0;
+			inst->crop.top = 0;
+			inst->crop.width = fmt->fmt.pix_mp.width;
+			inst->crop.height = fmt->fmt.pix_mp.height;
+		} else {
+			inst->crop.left = min(inst->crop.left, fmt->fmt.pix_mp.width);
+			inst->crop.top = min(inst->crop.top, fmt->fmt.pix_mp.height);
+			inst->crop.width = min(inst->crop.width,
+					       fmt->fmt.pix_mp.width - inst->crop.left);
+			inst->crop.height = min(inst->crop.height,
+						fmt->fmt.pix_mp.height - inst->crop.top);
+		}
 		break;
 	default:
 		return -EINVAL;
-- 
2.53.0

