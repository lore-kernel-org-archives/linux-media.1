Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46B83FA5C8
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 06:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789107765; cv=none; b=IYC+5+JVoj32Cjp2MQnCxup7nSQwvWmqG5dPYf2UuAmoqXkg5vJvbK80fL34o85LEMteDeb43IHfcQMQJpZpJyaYUPo9e9ZjZXexWUPJgKa3R9bL4QNKcaPGxiX2Ir/6YIrSW1CNYQcWMAl64+HM9ideCGg7V+kApoqR1C8qByE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789107765; c=relaxed/simple;
	bh=P4yejfQoXWEs5WCIo/uSBIMrvzn27wZhAYZfF4/HElo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CeJjcYFLTDxyfRnboc+C6GjPiu+fpKL829/hfARXSCitw6jQxIXEsMsxMs1FBYE1ILNJxiXS8odwakxDlCM4VxArJIAUZ3FHSqmdltYl8Bfa8ijKyrXWkR3Qc0YoJmy+EfePzvXNF8N33woP0B5Jgv6XAdB2HlDr7Y8gKppjYCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lx/aQ248 reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lx/aQ248"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B4vG0i2422200
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 06:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PfojdtiyVIg
	osMA6X+iHeGMye0+VmyZKBg4VC9xW9VE=; b=lx/aQ2483xB8JntsTK70Vs6ZrBC
	Ho7PlKVSau9VG6ZB5ObLmWTvREKVo7fqxc5wwNr17ViJA/HTwOKMIwAWek7IPZrX
	CzbBk18RbINJmHKM9HoqFDegr7b/4gAtkvh3d2Dg+6d/uEyPEQbgdLwlF5Qkew1y
	Ojh9md1zwZRU06fDNyuRAsMMTMKfmS2n3OzYL1MbDClbunUbltPudVXN4dDtnwau
	/l+bP1PFp+070JNGcLT4zvS6GdU9gEq4f3VjDVAHajRoWsXndaq5Lqfi4+OC4P9U
	braS7XiYZZkuB59ZYJRwamjWzo5sEXFIdZN54aqKP1Cgy7pOA4dh8aEGygg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm729h58y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 06:22:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5e38fbc5so96345185a.2
        for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 23:22:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789107751; x=1789712551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PfojdtiyVIgosMA6X+iHeGMye0+VmyZKBg4VC9xW9VE=;
        b=g+7HioYWWkMkPb0XAIL7+wlGPUTKLicHmT+2kl+FrzDiJ8/4x70DyFplBMxkJPihsb
         r7skfL9mphOD7DXOc0zn1jw+46hUV3dkCydWSmRsVhoZCn7bYIVYRH3kTGthl4+t+NoY
         1xEKh/lnkg20JfhAjUz0KraZb62ochYXdOTFJYKB80WkcxiDHXYXKbPZ3vDDnviVVjo/
         WtLvf9bD4aYqvye/Deg5H3cM8vqfg0BRctHW/BoJFtkaHHnzqMcKAJl41cX9v8NBc2th
         ezy0hWr019I4YzDlPa1az/le337EAIsNs4kJo67fRIt5QP41WgLYQK5lpRU/7H73vyw/
         O4IQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlSV1hbhSHQIlQ3l0xm1kQL3yFwDvtd3pt/wPR5cLc6UNbzmOM+9rz4aE/30sIdYAVbaL+yfjCtBQrYw==@vger.kernel.org
X-Gm-Message-State: AFuF++kyko/gUvHtLPahlScscDnNIC8fWnpZGDPuOFIMXpePO9mXC63O
	6lcFKU+gBLCuG+P4uDd/rvGQVfTY1BQ9H+u/7TFbz8N4RsJqP2YjZeDpJgvmR4ovisQkC0e+vGM
	Ypx0QXtbBy7DeInI+iXy0FsvF5CIdY3DUz8DjaQgJuytkWfPUJvQbUR2wMoY4v+c83Q==
X-Gm-Gg: AYBFou12cztZe+jlpd4yMYdUSvo1DOYdBCOr/99ZeExE3nutaoJkhxxd9E09/ekbxpR
	0PiO4mGwkfCBdDEotY5ZJrBgaXjgCq7+Q39vMN+50B0h+nFm2OpV0Nt6EBYEmjb0w58FfCUDXvP
	3WDlD/ngxobwaEtTp8BMHuNgfjcqgkU5yhbB0+eVc18FKT1G7kZ+6mEsiB8sis2RXQ6cGrGSHcs
	eESU/le7/iCnCgneV7t6ZDYqsjp26QN2Fxl8UxogLKcBSn/SdCqqeoLbvdnHalDYzPOZuhve4XY
	wVTiV/HWjU7O8SYWL4MCGLPHLxl25Fzxd1LQPmGKO2dgOg6CA/tYGMPBbzE=
X-Received: by 2002:a05:620a:a0cc:10b0:939:f27c:7433 with SMTP id af79cd13be357-939f27c802bmr47740285a.50.1789107750990;
        Thu, 10 Sep 2026 23:22:30 -0700 (PDT)
X-Received: by 2002:a05:620a:a0cc:10b0:939:f27c:7433 with SMTP id af79cd13be357-939f27c802bmr47738285a.50.1789107750457;
        Thu, 10 Sep 2026 23:22:30 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ea60sm3681969f8f.17.2026.09.10.23.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:22:29 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH 7/8] media: qcom: camss: add streams API support in camss-video
Date: Fri, 11 Sep 2026 09:22:12 +0300
Message-Id: <20260911062213.195007-8-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA4NiBTYWx0ZWRfXy6fKpKJhab7O
 WMStDq8zgoo2cYEMT4vf7qjTOYKbAcBAPRN9IUJrvcGOXJNq2v50w9zeqzU+Pzn7sFOE7Bzp+qt
 x2WBxGR8emSAFxFmz8+fSo+U8UPWj/c=
X-Proofpoint-GUID: bqKcoktYbfmXO8KZLwOpZB7aLs_CksDb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA4NiBTYWx0ZWRfX+CeWfv3j9aeg
 U6jInjOVlXYDtsuIbcWEA0Uxzv5A2zN75GBXMYjbZgsqXAjlWqia7yN8w0IQnWpTBfu5DCudSgu
 1qKA/MOmZL4fGTI/uqPaPO14l2xWeAcFNG3SYvBT4+C+8R0bFUjpdgO7cfekrSe4NGxZX7a/zqK
 lMb6csE2Ok/K1OqSgxbGK4CRCNtLUuLGKAUU0W+qF3DaSgwWz7U4jyyu2n0Hmy5tL1OEEqf9ilx
 8rTzrb0mxk6jS+Q647eWKAFfNDkmxxElPYtun2pnLWX7kPy5rjAIeNP5HTJonQ6Ibwl4By5nuxz
 97rWCGEb0A/X+B2tNpRhKa+aT1XxT6CNXlDuD6+2GU8OW7+M9PIxFj8Lz2mVcIao7s3CGAxXLFB
 mCWhRaJBHMFF22Sitp1xsYo5LjDdkx9Fo2C4hndW6LszueXCnjG4KKReDsfyeaOZoLHuxVLifeQ
 THzQFF6tO4g5WsNcI9g==
X-Proofpoint-ORIG-GUID: bqKcoktYbfmXO8KZLwOpZB7aLs_CksDb
X-Authority-Analysis: v=2.4 cv=AfwkjHXG c=1 sm=1 tr=0 ts=6aa39e28 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=KYIyY8g0vu4ecJsuFiIA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110086

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Generalize the video device pipeline walk to be streams-API-aware:
when a directly-connected subdev supports enable_streams/
disable_streams, use it; otherwise fall back to the existing legacy
start/stop path, which walks the pipeline one subdev at a time via
.s_stream(), unchanged.

video_stop_streaming() must always call video_device_pipeline_stop()
and flush_buffers(), regardless of whether the disable path succeeded:
vb2 requires stop_streaming() to return all buffers, and a successful
pipeline_alloc_start() must always be matched by a pipeline_stop().
Make the legacy fallback branch match the streams-API branch by
logging a failure instead of returning early on it.

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

