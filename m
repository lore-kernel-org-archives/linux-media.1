Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E851047F3C0
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 09:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363788; cv=none; b=rVJJzlppj8dUv2Y/ls1FrjfUnNsg9p/jfgoCrJQ9PY04rHJ64YKJ7Xny+XUN8s+0/XoXS4HqCP5SsKiAHQ2Sv0nulj02InGyO2iFYqmoy9In1XJVY6QAGHHhEhfZj4judujZtsvGLPi986E7p/3tWwtEcLNYuyWh4EqUn5uuvE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363788; c=relaxed/simple;
	bh=7ig8RKzME4Tg23U2NT0cmp9t9Bqv3O5xWJzNztTvKZg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eYj0XoYEiv054uECMpZ2BjOLy7JDUYIlBOZATF5ZwwjzR0M1RfFE2j/IGMI9XaL1R2EL22qMgxS0VJNZ1EmerxW9OAWgIy90cR/b+aUNg0NvZgXMEvcfQfLxdyCfM9zEeo/4IJXwHU+1NlkCc8FjsQDWDZZc7ADg2d6resyQkgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ekexX+I3 reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ekexX+I3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jmYB3334818
	for <linux-media@vger.kernel.org>; Wed, 7 Oct 2026 09:01:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UoErLMLnc44
	hB2Tr7ICKukvAM52COTfpqVXrz+zrfqE=; b=ekexX+I3YysZfBBk6zOG1uO8NJz
	iPI1H54t6JdM4dFwlDaQALHvTbzL9tEahcrJg3mAapNZYCThy5JbeoYqMZnVugIw
	SYIyA2Rw/3ynzO02VbsA5TXb+U+kjrYA/XTyL8N00PWdMqTnX1f5/iavqHuyHKZY
	RvGvpJ0F1IMgk6ExmtGsos8BEZqBxvVfjmAZwBylL0ZEE+xePYFtAHh8w9fta6tC
	kuz8S/Pz+pTUMBRKC9Ir/xIPsOPZ0IxSIIN//LQuhwGLG2B0exeBhRQRdZ57TZId
	EH2jRHJLdE6gIjjdopXXX0/acO/RErA66Kec/7eGqjysRv72XBaj3+9tGUg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h54623ara-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 09:01:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cbf2fd504so720680585a.2
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 02:01:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363695; x=1791968495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UoErLMLnc44hB2Tr7ICKukvAM52COTfpqVXrz+zrfqE=;
        b=1WH+7xFP/ulTS3C5O+Ux6KpEMx9Cd/k0KZQ82Z3aIDHnYyQpSklONh7TTy7+nmp8tc
         GOwoVrt8oCcj8HcVUMj0C0XKRpt5v974Q4f/cHCXxAf9r9n55mpluoTkHdbuAQK1Qci8
         Mz6d64+inwEDhW+twzo8jAlN2gtFrkipNZRjfM25IAY8ovtuvCG81JhQ/rXgfzC1iagi
         R589NqGIF+gc/VHvGQPFizYbauHN+jCFMYxl6lBsdQP2UTQSkBS1//U+E4hGXlMryg9u
         ZUDv7ABCTNNB/wtudTRTynOeOe5wWJqYRGC8cBm4mHooO7zLfLZltnlwcNJTclQ9lxwv
         M8FQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEK+X6tGBdVpXntOuz0jADcvTLTbyBbNMRgsY4+zp0uXs+X9LnMZO+dGqIsdBIME/Mo/OCjFXLfg9icg==@vger.kernel.org
X-Gm-Message-State: AFuF++lPD/zVMYu45BsVt8l8arrjl472x2eZu7XRdX7AAflQaJ5fpUXN
	zli1eOrzYSZSMkveanX4/sBIJ0LqAC2oEbxadsIrDpZcwj1w4NTWDrihFezFuD/dRs2FE4Y6cOl
	85ykt56KKJjBwiSPIcwoPsVkhZoEIlgR7sNXWEf3boSSvBLYGiD74AmEtDKNhmGQnrw==
X-Gm-Gg: AYBFou0Bb9yeGMCiL8dX5S1vg5i2Xs8iyjk523binKWDmSs8bDxbG50UVjz71/sZQti
	eS9k0L4hTXmPi3S7o4NaV8rn7gCEOKAOzBCGD9UDjRMFqXAZ9McPWzEPlyV3raLeEXQJTF8EwdL
	KQqYj4zKNWvTDohMH3SBnUzpvKsY8oL/z5D38yAW2TXGAYjMoOuyMcWKXX1dw9MKNqe+CErThNm
	ayX7kSBbXqSlDoO1eu5tCrwGMyi+FMzZl37HPeg7Xg8j51o4oeU1doHOfn6lFgS2fDB4RpwKt7X
	IiCD0djoBKiOKKJnTMT3kL9qGygK5LW1GhdLsnFYlMEIgmyp5ZzRzRTMrV0=
X-Received: by 2002:a05:620a:404e:b0:93b:d7ed:ff66 with SMTP id af79cd13be357-93e9b835e0cmr317184585a.58.1791363695142;
        Wed, 07 Oct 2026 02:01:35 -0700 (PDT)
X-Received: by 2002:a05:620a:404e:b0:93b:d7ed:ff66 with SMTP id af79cd13be357-93e9b835e0cmr317178585a.58.1791363694627;
        Wed, 07 Oct 2026 02:01:34 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:01:33 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 13/45] media: qcom: camss: video: use helpers for line-based formats
Date: Wed,  7 Oct 2026 12:00:09 +0300
Message-Id: <20261007090041.3732717-14-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bFZBJcGGsIz-sjZrC_JhjizGWYhr1H3g
X-Authority-Analysis: v=2.4 cv=ZZiIpcVA c=1 sm=1 tr=0 ts=6ac60a70 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=qbJzVsoXupL-68DMvHcA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfXx6RGbkCWhAO+
 8ChGMB4kiyLnYWEEwv4e7vFfopKkijFEZb8TAaHFIJ64jHVrtPaHHQlv0GwZZ8rF+DEpf7Lk7EN
 ec1qQ/B1jzMtKuupxWLFXsF+NQ2tMkE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfXyXlloSCKmipR
 fGJrzmsqjl2ZMKvbUOjCdxoMC31kkdIpnpUjnzmWGIcVRpTKSRjIiZXxL+UKX8AuGl1iFQAPfrE
 mIYRtMMlw8O8DglY4sYFKJZZZPYnW5+SvVIjgG6DEfApAmZcqvsvCMkQy6oQ+dybzCiptpv6aqC
 N0d4uBo01JQHdtZlkXTa/MVg09V67KuUf4DU/gPK/5CcUJ7hir+RdUXzMnvrURV+t3ZX0+PqbXF
 1h0kAc8M8ez6joJYMfZ97cnwCmfNHnBsKCL50WzX4wdHHMcUPyZE0IGkIrizg9bJ0djAqdp8DH0
 SrNiivbjLt+l1gLDYcR7eT0NBEz1ibQLb7NZtdLg6I9OxBKJ/v3Nps8B5Wq12Ncc43oFuP7lRf+
 0ez9vT79eg6AKLLxo6qZg6v5qSHADsWUAXE4vreADxP2MLlJiZu0NnzdZI+s71HNc+Z0lDCfBJe
 6m1p3A7x9OvXksYsBDw==
X-Proofpoint-ORIG-GUID: bFZBJcGGsIz-sjZrC_JhjizGWYhr1H3g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Use the V4L2 format helpers to calculate line-based plane sizes from
the selected format.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-video.c   | 76 +++++++++++--------
 1 file changed, 44 insertions(+), 32 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index c570d7f9258c..803e5ce9b9fd 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -7,7 +7,9 @@
  * Copyright (c) 2013-2015, The Linux Foundation. All rights reserved.
  * Copyright (C) 2015-2018 Linaro Ltd.
  */
+#include <linux/align.h>
 #include <linux/slab.h>
+
 #include <media/media-entity.h>
 #include <media/v4l2-dev.h>
 #include <media/v4l2-device.h>
@@ -513,29 +515,59 @@ static int video_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
 	return 0;
 }
 
+static int video_try_line_based(struct camss_video *video, struct v4l2_format *f)
+{
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+	const struct v4l2_format_info *info;
+	unsigned int i;
+	u32 alignment = video->bpl_alignment ?: 1;
+
+	for (i = 0; i < video->nformats; i++) {
+		if (pix_mp->pixelformat == video->formats[i].pixelformat)
+			break;
+	}
+
+	if (i == video->nformats)
+		pix_mp->pixelformat = video->formats[0].pixelformat;
+
+	info = v4l2_format_info(pix_mp->pixelformat);
+	if (!info) {
+		dev_err(video->camss->dev, "No V4L2 info for requested format\n");
+		return -EINVAL;
+	}
+
+	pix_mp->width = clamp_t(u32, pix_mp->width, 1, CAMSS_FRAME_MAX_WIDTH);
+	pix_mp->height = clamp_t(u32, pix_mp->height, 1, CAMSS_FRAME_MAX_HEIGHT_PIX);
+
+	pix_mp->width = max_t(u32, round_down(pix_mp->width, info->hdiv), info->hdiv);
+	pix_mp->height = max_t(u32, round_down(pix_mp->height, info->vdiv), info->vdiv);
+
+	pix_mp->field = V4L2_FIELD_NONE;
+	pix_mp->colorspace = V4L2_COLORSPACE_SRGB;
+	pix_mp->flags = 0;
+	pix_mp->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(pix_mp->colorspace);
+	pix_mp->quantization =
+		V4L2_MAP_QUANTIZATION_DEFAULT(true, pix_mp->colorspace,
+					      pix_mp->ycbcr_enc);
+	pix_mp->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(pix_mp->colorspace);
+
+	return v4l2_fill_pixfmt_mp_aligned(pix_mp, pix_mp->pixelformat,
+					   pix_mp->width, pix_mp->height, alignment);
+}
+
 static int __video_try_fmt(struct camss_video *video, struct v4l2_format *f)
 {
 	unsigned int alignment = video->bpl_alignment;
 	struct v4l2_pix_format_mplane *pix_mp;
 	const struct camss_format_info *fi;
-	struct v4l2_plane_pix_format *p;
-	u32 bytesperline[3] = { 0 };
-	u32 sizeimage[3] = { 0 };
 	u32 width, height;
-	u32 bpl, lines;
+	u32 bpl;
 	int i, j;
 
 	pix_mp = &f->fmt.pix_mp;
 
 	if (video->line_based)
-		for (i = 0; i < pix_mp->num_planes && i < 3; i++) {
-			p = &pix_mp->plane_fmt[i];
-			bytesperline[i] = clamp_t(u32, p->bytesperline,
-						  1, 65528);
-			sizeimage[i] = clamp_t(u32, p->sizeimage,
-					       bytesperline[i],
-					       bytesperline[i] * CAMSS_FRAME_MAX_HEIGHT_PIX);
-		}
+		return video_try_line_based(video, f);
 
 	for (j = 0; j < video->nformats; j++)
 		if (pix_mp->pixelformat == video->formats[j].pixelformat)
@@ -574,26 +606,6 @@ static int __video_try_fmt(struct camss_video *video, struct v4l2_format *f)
 					pix_mp->colorspace, pix_mp->ycbcr_enc);
 	pix_mp->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(pix_mp->colorspace);
 
-	if (video->line_based)
-		for (i = 0; i < pix_mp->num_planes; i++) {
-			p = &pix_mp->plane_fmt[i];
-			p->bytesperline = clamp_t(u32, p->bytesperline,
-						  1, 65528);
-			p->sizeimage = clamp_t(u32, p->sizeimage,
-					       p->bytesperline,
-					       p->bytesperline * CAMSS_FRAME_MAX_HEIGHT_PIX);
-			lines = p->sizeimage / p->bytesperline;
-
-			if (p->bytesperline < bytesperline[i])
-				p->bytesperline = roundup(bytesperline[i], alignment);
-
-			if (p->sizeimage < p->bytesperline * lines)
-				p->sizeimage = p->bytesperline * lines;
-
-			if (p->sizeimage < sizeimage[i])
-				p->sizeimage = sizeimage[i];
-		}
-
 	return 0;
 }
 
-- 
2.34.1

