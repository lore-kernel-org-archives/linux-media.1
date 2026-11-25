Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594113;
	b=jGpjyrSHGx6xsjuJdqWaASVd4loAhBsPyhPnTvEtxwIvOLmWKzjzwxJ80ovGYhJnawhG
	 08QWF5r43uMAYCGsu4IMHFfAmDkIGyP3+mbR2czaKfU6y7oPZJMwIbfGB0lGUCRzerxg9
	 TAJavZNAJ7wrEeTGgHHBLU3WRgCjzcHHVRImzZNT88uUk2vVsyR0uG6a2NeeZzRbIPCkA
	 paQATJIVSUe5kqpBst38cHV+OERZ2m7/rPY5TQNda89JngL84ab/nuCgdLQAt3VSWlphR
	 PVuEu9iqAK3TvQIoRrgN4ABqQ56E5RpYjUqNB3PPJ2ZxSRJHEQ/F7v4qajyuNouXlHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594113;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=L//rJ27NYEGRNl9DwAU81I8HdLBTfl2e192CabOszjA=;
	b=syRA43sNjWe39z8H+DEmBIdw4mUWmJtpmCz+6UOKBd+k5taFgFqWaHd1D0Lawo6ySLIJ
	 DYWqfig4VhaWqQktmH0BtrQGZ4u/C7Enrutrg3dNmynVPXI1/tIlNbI4hcduY8yJDZkK9
	 tBdRDMkPXdGOtY/+VUXF9SZRZklJhb4gNSiqBMm5XkpLyub782DBT6lWg6AZbggINYsDk
	 hXoR+28rSar3R7vcgklGbmyP95LA7LMXuTV/3PnnkgNMKugigQyc6Vd0wTkYfwUcGa9Bw
	 pxsntB1MQhGndQVVoQhdRyqrwDKoMQ3uUc/H4TNstoTZITkpDo8JRAYSuuYNnuKyP1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=fail reason="signature verification failed" header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SEC0NXLt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43ADE606A31E
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43ADE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SEC0NXLt
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68TvK3534189
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:08:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=L//rJ27NYEG
	RNl9DwAU81I8HdLBTfl2e192CabOszjA=; b=SEC0NXLtc6yoKbBMoLrovlZxJNV
	SVd7q2QiEKS2AdZes5SLqDaaGgiQW5yt7yhcg+ZA8hJz7rPgSgi+i6M4QnCICPKS
	e5YcCUIl3ACdbrlRhdPdTj/qVDtobbCPn9xmJ7SZz4Dzwh4kTD+5fMm1NVBl0A/s
	Dj0b9zTdEM+nN0hglqqt0DLDZAYMoK3nlPwZyKHMT2wCkTCmqreVqFk40gsl5Lsm
	4wWZsDGtMSog9Qc7k3OFivLS3CTdM/fl8XoCrXtrBQ7e3JPBc0ORvk7hIY6EWAjY
	FaE93WMyOh19QavRZUpbNNev/eKlRqHMClbe03Tg5KZLfZD3J43mKi3hfDA==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbhk2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:08:32 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-45a07949855so6111432fac.2
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 00:08:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594111; x=1796198911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L//rJ27NYEGRNl9DwAU81I8HdLBTfl2e192CabOszjA=;
        b=prIK8VAT7t31CIX1/b8qBL/EfCk9QViBh8pD+cOVf1mv//Tj45GZmYFlLiBOkynqjQ
         dxagJwpVD0ziuJQlBtvpTqSRJiVMh1Q/sWFmIa7Jg4KvtrGniutN7L3KGDtgxZ9T8i5M
         +aKpI59VsGzOsgXR8MoznMSZqFzZZZ3E8ocAIKaPaZvFSZzODvlV/ryC5cXm0tRoRFwL
         Tr0ToQmi7sbglJsJFHfQ77PszOHUflZNVz0PXkaC7Aim6bLH2sJ0j78vBxaxlT1mQrNR
         9JhPmOxvGp6BR2KHg/GKNc4xNTrfKlgNGd3C4yyUZZuyzVqXVHsgFa0x2ctIgCL57w/7
         8wtQ==
X-Forwarded-Encrypted: i=1; AL+hErHhUJmpyIfI81KliKiKxzf78cmqGPaCuuNYepSGEJCF9cDSGCrwtk3eUUk8avqLlaDJlSgwxL/LL1n0mQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+XIiYGKkdfNY8Gjph3K4VXSXTz1LIXZO9JkeExjhrjWw55KA+A
	UhCPTgNcSdKdpmQ+7zFV7oqDqj/7Svsr/mhUARRdCoDOPnmks6X/jtKSK968sV4qTEcjInEmjMw
	qNRvH6ykOxOhcmau9GvCws9vK/wThnirV1Yb5zC4j5QjsaQoYFC4NsLnlLHb0t2Fcz5u5GR84bh
	ty
X-Gm-Gg: AZFdTZdI66bdp6s5jHJB0mqbfgRucpUB0BuCQWmSc+u27mD69s3pGyJwtHOu/Ec3Hub
	GsYGBr0fvkbMJev2uZ6TW/HmqPMrVL/LBR/e6GtFfFdNb8LE9lHzfa2PMq6D8SlgKNnzyrlxLN3
	blLN9q8/6f4e7F28wpFoLfoNEBaps7EJybQLyMuUENZZYM8RUF4HX9G4XVPAVS4oqvI9eLIvaZ/
	iRUODGBAQbaoowM7u0g0ofnI/LdQB0GF7A5NeL49o4axdIX6qzcgUMfGTY2v0a5f/eFjvMVtMB3
	ahfK+NzkVWQg1rZ01zCQOi9q1ApjJ4JhxxJakqYPQ8Ylc/QwGSI16FTCOXsi5wBdv+e0NG2x77+
	0qdmLuR6Bat8uYoCyz1837dC+8WADSM8F
X-Received: by 2002:a05:6870:be92:b0:49e:4895:2366 with SMTP id 586e51a60fabf-4bc8208f78dmr16081577fac.36.1795594111472;
        Wed, 25 Nov 2026 00:08:31 -0800 (PST)
X-Received: by 2002:a05:620a:46a9:b0:949:730b:53e9 with SMTP id af79cd13be357-949ba98d292mr2980035485a.31.1795593622230;
        Wed, 25 Nov 2026 00:00:22 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm585912015e9.11.2026.11.25.00.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:00:21 -0800 (PST)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH v2 09/12] media: qcom: camss: Add streams API support in camss-video
Date: Wed, 25 Nov 2026 09:59:58 +0200
Message-Id: <20261125080001.2540101-10-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMiBTYWx0ZWRfXxp2rDstt1+vL
 V4N2Cm2F/X+MjqEMyHniK6BLStujuJeNflWH4Esmi+/zYMt12/7mKSooPombtiFQUwI1s6OFpxT
 lbMZY5LSnI290UceQK0t8lX9MMR1OUo=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b069780 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=ZovgdgjKAAAA:8
 a=KYIyY8g0vu4ecJsuFiIA:9 a=1zu1i0D7hVQfj8NKfPKu:22 a=VOxKbm1zgHvARWIDjr3b:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMiBTYWx0ZWRfXwXd8KOSiv67w
 VGqvG2PRcFWQGA/lKP/NO/RK/LWTP+L1+h85cAb0i5P6o9TexjHwvHZL1e7lAixav6cRYF5s77P
 UCpavdyssrbcHa/1yiPAdIsi8Fa1ymhiOp9tJBBng8d/ETahMmV83hUNNjvj/T26bWNxzoPXB5q
 mpJsPLn782nEF8cgzGuW3OL8f+8HMiqfYu88KSk//EN9PmPJ/Uwv9UvEucV7l9QpnQzes58f8MZ
 eY2ftZrYgcA/O3zZKvO8ar5fgXQxFbBFqOZxNLUF6NeHMaou2JS8mdNws4zpCI8ki7lpti3QQx5
 OJjMvyTO7qsDfkfE2S1i2hWwmEaHKGtriMjasnRPOJzNtKPJ2m2qhWII/BDCAOFb1eNeL+05gHG
 BrSyL3UxpyXOgYYB4TV47HcKgNfGzLAphA7lQy+lxByHOKUW2yaQQhGWWGP6LZQYPjuXY87sn8m
 nAXtIoGM6P8ac5gItfQ==
X-Proofpoint-ORIG-GUID: 8C6EXTkB0L1fGQSzcB-7j9Ffpt_YYTM6
X-Proofpoint-GUID: 8C6EXTkB0L1fGQSzcB-7j9Ffpt_YYTM6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250032

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Prefer the streams API when starting/stopping the capture pipeline:
if the subdev directly connected to the video device's pad supports
.enable_streams/.disable_streams, use it instead of walking the whole
subdev chain and calling .s_stream() on each one.

The legacy walk is kept as a fallback (video_start/stop_streaming_legacy())
for subdevs that do not implement the streams API, so platforms that
have not opted in keep working unchanged.

Co-developed-by: Hitesh Patel <hitesh@ebytelogic.com>
Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-video.c   | 119 ++++++++++++++----
 1 file changed, 94 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 0852eb6f1315..7f7212996c4a 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -249,26 +249,27 @@ static int video_prepare_streaming(struct vb2_queue *q)
 	return ret;
 }
 
-static int video_start_streaming(struct vb2_queue *q, unsigned int count)
+/*
+ * video_start_streaming_legacy - Walk the whole subdev chain and enable
+ *                                streaming via .s_stream()
+ * @video: Video device
+ * @sink_pad: Video device's own (single) pad
+ *
+ * Fallback used when the subdev directly connected to @sink_pad has no
+ * .enable_streams op. Mirrors the pre-streams-API pipeline walk: each
+ * subdev's pad 0 is assumed to be its sink pad, and streaming is started
+ * one subdev at a time via .s_stream() rather than the streams API.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int video_start_streaming_legacy(struct camss_video *video,
+					struct media_pad *sink_pad)
 {
-	struct camss_video *video = vb2_get_drv_priv(q);
-	struct video_device *vdev = &video->vdev;
-	struct media_entity *entity;
+	struct media_entity *entity = sink_pad->entity;
 	struct media_pad *pad;
 	struct v4l2_subdev *subdev;
 	int ret;
 
-	ret = video_device_pipeline_alloc_start(vdev);
-	if (ret < 0) {
-		dev_err(video->camss->dev, "Failed to start media pipeline: %d\n", ret);
-		goto flush_buffers;
-	}
-
-	ret = video_check_format(video);
-	if (ret < 0)
-		goto error;
-
-	entity = &vdev->entity;
 	while (1) {
 		pad = &entity->pads[0];
 		if (!(pad->flags & MEDIA_PAD_FL_SINK))
@@ -283,6 +284,42 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 
 		ret = v4l2_subdev_call(subdev, video, s_stream, 1);
 		if (ret < 0 && ret != -ENOIOCTLCMD)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int video_start_streaming(struct vb2_queue *q, unsigned int count)
+{
+	struct camss_video *video = vb2_get_drv_priv(q);
+	struct video_device *vdev = &video->vdev;
+	struct media_pad *sink_pad = &vdev->entity.pads[0];
+	struct media_pad *src_pad;
+	struct v4l2_subdev *subdev = NULL;
+	int ret;
+
+	ret = video_device_pipeline_alloc_start(vdev);
+	if (ret < 0) {
+		dev_err(video->camss->dev, "Failed to start media pipeline: %d\n", ret);
+		goto flush_buffers;
+	}
+
+	ret = video_check_format(video);
+	if (ret < 0)
+		goto error;
+
+	src_pad = media_pad_remote_pad_first(sink_pad);
+	if (src_pad && is_media_entity_v4l2_subdev(src_pad->entity))
+		subdev = media_entity_to_v4l2_subdev(src_pad->entity);
+
+	if (subdev && v4l2_subdev_has_op(subdev, pad, enable_streams)) {
+		ret = v4l2_subdev_enable_streams(subdev, src_pad->index, BIT_ULL(0));
+		if (ret < 0)
+			goto error;
+	} else {
+		ret = video_start_streaming_legacy(video, sink_pad);
+		if (ret < 0)
 			goto error;
 	}
 
@@ -297,16 +334,27 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 	return ret;
 }
 
-static void video_stop_streaming(struct vb2_queue *q)
+/*
+ * video_stop_streaming_legacy - Walk the whole subdev chain and disable
+ *                               streaming via .s_stream()
+ * @video: Video device
+ * @sink_pad: Video device's own (single) pad
+ *
+ * Fallback used when the subdev directly connected to @sink_pad has no
+ * .disable_streams op. Mirrors the pre-streams-API pipeline walk: each
+ * subdev's pad 0 is assumed to be its sink pad, and streaming is stopped
+ * one subdev at a time via .s_stream() rather than the streams API.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int video_stop_streaming_legacy(struct camss_video *video,
+				       struct media_pad *sink_pad)
 {
-	struct camss_video *video = vb2_get_drv_priv(q);
-	struct video_device *vdev = &video->vdev;
-	struct media_entity *entity;
+	struct media_entity *entity = sink_pad->entity;
 	struct media_pad *pad;
 	struct v4l2_subdev *subdev;
 	int ret;
 
-	entity = &vdev->entity;
 	while (1) {
 		pad = &entity->pads[0];
 		if (!(pad->flags & MEDIA_PAD_FL_SINK))
@@ -320,13 +368,34 @@ static void video_stop_streaming(struct vb2_queue *q)
 		subdev = media_entity_to_v4l2_subdev(entity);
 
 		ret = v4l2_subdev_call(subdev, video, s_stream, 0);
-
-		if (ret) {
-			dev_err(video->camss->dev, "Video pipeline stop failed: %d\n", ret);
-			return;
-		}
+		if (ret)
+			return ret;
 	}
 
+	return 0;
+}
+
+static void video_stop_streaming(struct vb2_queue *q)
+{
+	struct camss_video *video = vb2_get_drv_priv(q);
+	struct video_device *vdev = &video->vdev;
+	struct media_pad *sink_pad = &vdev->entity.pads[0];
+	struct media_pad *src_pad;
+	struct v4l2_subdev *subdev = NULL;
+	int ret;
+
+	src_pad = media_pad_remote_pad_first(sink_pad);
+	if (src_pad && is_media_entity_v4l2_subdev(src_pad->entity))
+		subdev = media_entity_to_v4l2_subdev(src_pad->entity);
+
+	if (subdev && v4l2_subdev_has_op(subdev, pad, disable_streams))
+		ret = v4l2_subdev_disable_streams(subdev, src_pad->index, BIT_ULL(0));
+	else
+		ret = video_stop_streaming_legacy(video, sink_pad);
+
+	if (ret)
+		dev_err(video->camss->dev, "Video pipeline stop failed: %d\n", ret);
+
 	video_device_pipeline_stop(vdev);
 
 	video->ops->flush_buffers(video, VB2_BUF_STATE_ERROR);
-- 
2.34.1

