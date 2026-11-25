Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631039;
	b=QAwwZV8X5aEwgTNPPKNNvaWvSM4XH/ycVGApq8EGYnjc2IQ97jcUz/p4HNL4Jc4aeJwG
	 CsTTFydw90MO13LLH2Q4WnJ5VkGuo6cWO2xC0bQWQ8b15EVpBcDhpx0HK+0ofpxM852Dp
	 Qd7NkXLN8ETi2Ej5EJlUHHDQ1F/CqyYmsP8mOkqHzSt2DKoJbld4Rv13BYbP6hwaskg0M
	 662A5Fv1h1H1gfaq4HBHuNf0kRwBWAtko2jNpSCVNHuIglRv2AHvjiorEus1QRPyElaI/
	 C3Gp2x4pmgRoW77DFYVoNhIZDBnPGIFlMemIhaqnkGI+24lERAv4icn6gr36C0wWdcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631039;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iBl3ztGie3scC2+QPz/6CcWsyfMw4xdKCUkFMvo4SHE=;
	b=1v/I/jLBLeVtFFZ65m+oMCeleCozItTFVlMHrsug+TLiSfaG9UZNys9ASFvXSwNIWDTm
	 7oAxo5ZrWcgNXCKImAq/Im+pcmIoWiBCtb+y4D+XMPKexacfXJAC6tVPTAEbkJY+DnQA/
	 2tVe3vlUaHX/PeZwIvWr1U+qKtnDQsB6Fc90hvkPUj/G23hMixYe6U1RsnsNHdoK8jkrs
	 LEXA7OE+iLM/isI/DbOOCfB3ryzQ6bgumrpG6VBRuOVSFvAAUOdZ/RMEfTTj0kYoyUHKF
	 kY9BKsA/3NmeLR8f13NUdgkf4vRGzOl8YIfgW0OTBcmJF1rcHq4JMHhY30PgSxjeibQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L8EX9VIE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GNsjF4MT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BA2606A6AD
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 18:23:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40BA2606A6AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L8EX9VIE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GNsjF4MT
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQH9S3007927
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 18:23:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iBl3ztGie3s
	cC2+QPz/6CcWsyfMw4xdKCUkFMvo4SHE=; b=L8EX9VIEamhHga1wDYGfXKO1tDR
	uo9Gm0tAiok0DKT24f/GrPcopVnhZq+vPJGXwuXs1GH9uJj/cXd+9obNKP8g8NCy
	r7uPAbbKjaHexEKDga94X/EzDAmmJgv5jzlDr3dF6tZ1XBUFeNRgeKO6pdgeqvhB
	wN1QBQCuCwgvzX+4tyboQYpX7F6U5LI3ee14c9k6xhc6nNZYS3JHwEhB2nJaS3/d
	xpSZqbU4/8oyhVfBEyfrO5asYNE/ZzbHZap3wS/Wkn+eudxyRZzGK7icKXrKPzr6
	oQLOt80rpZKZ8im12XJpkEE/gewTh17dPET7L7umEmD8AsO12z0N6cxaDdw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vukt8rd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 18:23:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f20addba1so937609385a.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795631037; x=1796235837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iBl3ztGie3scC2+QPz/6CcWsyfMw4xdKCUkFMvo4SHE=;
        b=GNsjF4MT3qZEQOSkltZGoby/OkYyCgcRcT0B6i2AKXA1zNzB158TWNUos7s2gD245J
         aHsC/creuwsUq3ltqDt5hrFvJyYongrgFqzo39AuZ3rd05oTleHM70TyCywfnFDw0rrY
         5h+tr+088jaa/YqSDyX8hpmJS/Cxv424Ikr0cgOnqgJTeHn1MZpeCn2yVhED5QXIyX7y
         jFxabyVrhGxCxLu7VTuoLHAy8wFe2Vil5r07bXJPMkVPB0oSmIZb/MygbvQ+Bl8wpj4p
         23qlXj2NkeyluxEvRSV/Ssl69mzYQBNNEXG0KHYKg4rIiuw9jj71c9YvysdO7BFIudD2
         uAHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631037; x=1796235837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iBl3ztGie3scC2+QPz/6CcWsyfMw4xdKCUkFMvo4SHE=;
        b=vMLjAtsj6jimPP2Sk+0xBG5bhRgJL8vxFEg5flGxVfZ5IQKV+migx/sdDGFNFC9BaX
         gW6it8YKUEne6jgfIxTfsGfWABx8rs513WnLU/xCAmgqB05T3k6uP1buNmQZpWHquO6l
         gEskNx86IDBDuPj+Wps8eBT2nzczPkMCe/aIdtlB2wyxKGh4QrIAXLSH3B3XZZiuRnyR
         2E+Ggi1Vqf8Yf40I13S+wBKRC4ArwE6Uh+38OODg89G/aBXPzhE5VYi6hNZiGuhRLaun
         bp9QGduoGoI78NwtA5o0udiaK7Efi+kjL4TqOtPH05D78IbQBZbaTP2hVSvv3ZPrKiIs
         kwvg==
X-Forwarded-Encrypted: i=1; AL+hErEfK1t2stJsRVoDmynaeSRhx47V0nbgQdTVS4nzGssj3Bk1bq2+Ud+9HFYXFU/a4QZdzvoRsOb62gsO9A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8BRugpnW1ftMAVHq7ZRJqzaazgEa0RTbTjtJNKke5IRr4aE76k
	SGpsOiIXMDArBODnyvL+UgNKLS61Gv9In5koVfJloAdWa66nZJnNOgNfwcRhy5M4tbYWRKK+aC1
	p7pNM4YpRRrCkz1gDaHwI3tSCu+faTUJI+Wj5ZMI0xh2MemObxdy/9g5cSnSFN495cg==
X-Gm-Gg: AZFdTZc/SxaOxherGrChajMaV8Oyxu+PPa4eFlLvUvvIdQDaVGi+nYIHks3EoRsY4Ch
	doUSHcBg/IgdlTfJldbXWRoSJrDZP8kdKH5ksHprkPTIO/quGHvcBoVaLZzisWE7mDihrYa2uBd
	nrWRRJT4rIU6/8LJgmg3wN8ygLA4htZZYd5GWMFszwk8ubQ6CmNgFfpcvos3DuyGta46AbD5tJg
	axJzyrImrmZHP+Scf53XkpVPX/UPQBt8SblIa0LLk23MevXR1BzIss7J7/pLqf7LunlFHuBmuAm
	lFsdltGBCHitAFfJfU2hug/OXyEaLJrfGkCqOs6hTaiQEzm/1Y5+D7cerObLSrKpg1MeOKQ5vA5
	usI6nOeHWe2i03Ic1OQLaXSj7pbxo66mfCAJN5kurVAPUp8dwgKDl95lU8Ay2VzxT2cbFufrsUP
	wLfNBI
X-Received: by 2002:a05:620a:6603:b0:949:8d0d:6f66 with SMTP id af79cd13be357-949baa15529mr2853757785a.68.1795631037558;
        Wed, 25 Nov 2026 10:23:57 -0800 (PST)
X-Received: by 2002:a05:620a:6603:b0:949:8d0d:6f66 with SMTP id af79cd13be357-949baa15529mr2853753585a.68.1795631037101;
        Wed, 25 Nov 2026 10:23:57 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm37185609f8f.1.2026.11.25.10.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:23:56 -0800 (PST)
From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH RESEND v2 09/12] media: qcom: camss: Add streams API support in camss-video
Date: Wed, 25 Nov 2026 20:23:23 +0200
Message-Id: <20261125182326.2767771-10-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125182326.2767771-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261125182326.2767771-1-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=KfVHIgYD c=1 sm=1 tr=0 ts=6b0727be cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=ZovgdgjKAAAA:8
 a=EUspDBNiAAAA:8 a=KYIyY8g0vu4ecJsuFiIA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=VOxKbm1zgHvARWIDjr3b:22
X-Proofpoint-ORIG-GUID: 2guBn1ifuWj6vCZ7WdiY2lziyxxhKfJI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfXxY9bSCb/AbT+
 Q+zvdyNopg5DsV8bj7HH03tRyZDrFbxsy3v+Ly7GPJAwjMGJ18Wp/Flw9AWCP0KKV0d+UWqn27R
 ODt8vkt79I3HuvZ2NDRQx77gBZUs9KM=
X-Proofpoint-GUID: 2guBn1ifuWj6vCZ7WdiY2lziyxxhKfJI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfX2b4kcKJh9GMI
 JgkIf9rW21qKEbMcYw8st5n/+A0hYPtRfjHsLsL1zo5D0SFlLuU70JWynK6JnGnuQBe5wYASUT4
 u29JfgBfhzZCEYGttVdpGFjA1zosPEeCHkbAsDv2WnQh0hMGtDQJRD742596r64j7B/+XB9jJ1H
 cWua6y77GGoQxRwjUFY00jzVgsQJtH70IJLXugqjEaf9uO51AT0CdUuLLcXKJavZU4y6XgV+Fku
 6AfxuKxc5c+cu1WDXX77efaB0GJKirshaS5/WmWXVvxTBFGugFoZRWfv9RGWz0GpaQ94MDaoc9l
 P9gZ1P3L226sPrPS60dNO4HX95CtpjivDL1OgNl6wrX4rgrViz1X6bfzSOeVv65R6RbK4Slt7cu
 A88Vm+MgdyCwhzawnZhAKlDugi9ga2eXov+q7xNixJzM61NUONEabJ56bvyw9izOKSuL9L1e7tw
 g+3z6/I6znv6p2c0v/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250073

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

