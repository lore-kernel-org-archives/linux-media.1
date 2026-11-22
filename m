Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795354567;
	b=RD+Zd37mN6R/zOmHdIqih0zk1D+9rngxpj7aqfa+K++9fTh6LIe3Oue6iIcu2Gu7u9K1
	 JUNVZ5udZmIdrvsFU+X8QD8+z/LQMKYw8/LklkrOI3NqbyQT5pbHuUhKHRp3uIMi8K8Ni
	 fqRmZhFYsc55TBffE+miMerBzR2EbtK/xv8yu+GwBWp6dJEOxSv6MFtVHPHLsDB5bRQnN
	 vzAn5uJWg0LWHqNIHyZ1SMoEOK0UxBEEoflQJuvxSkmbPw47WQhbE7vsFEuo/h1zUBO/6
	 0uHj+Bw94Nz1SQk4HirtADOTASSHTiRX2WOwh467O9fjl0j34eWq5P31mlNM+hkMMtA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795354567;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dJFF4Yaf51Mhkzgv7RkpItcN7NzQP2ca5nmx3B87ruw=;
	b=02MpTH1AhJFen/CMI3YmbMyPi0IfyxnAhNSSxIOW/KyisHNTrynAwocq2eG3fYvTQ/jH
	 lCkT/Um/TiiFw+/ghkWqEVkGXllsSSGkj7zQCVShxNzxu/OBGKLXoiNkfvtx2A1u3SylI
	 +22A2tDuRCRuZjLa5qtaT/rPHOc9hBCw40KFkU2bXK1Owu1b2S/Ia8zB7U3fPAM7428pI
	 XSwQM12urighu8fbm6hDIA/gL6H99Y/TUNbygV2RF6LAf4i7QeYRudcySG1dpzpYrS6s6
	 PqcCYxgFEWMQ6w1S0unX+MPU6JA5/ea3j4dehWQr3dqF0Hp6JhCxU+kUeDDZo50EvDw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SVesHI5R;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29000606A330;
	Sun, 22 Nov 2026 13:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SVesHI5R
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795354566;
	b=YteH2FLXeQObUo2nGHC34seXbsG0a6J79ixwOJ+Cu00NFqXYRRUXl5ZaVXqxAcKNpLmI
	 hXldRvNau4qK+Es+/TvwwR3LTTsBptVxscPg98fKOTcnx44NyvvaXyuiQLzBAUe+zru7K
	 vPQt8iFbSjqTECghFScU26PBBh0ID7Wwr9wulXFdd3tZzruW1fagMY9duHW/yo2mvfJpM
	 /AFohRH24ObqG9l7wplGOCvfN5f/MZYqZwN+ENw2xOkMJKrG+/bun4yao1ZpA6oryTrJA
	 JnpM7zaHbFTxt3Km+v8/eTQ9HTuq82VIGSb53wqJ2NH+dMaRVpaJPw5J6WSCX5WTKZw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795354566;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dJFF4Yaf51Mhkzgv7RkpItcN7NzQP2ca5nmx3B87ruw=;
	b=2gHcgXpdEZE+GbJCNF2qFo8odCyhu/nnPmxrlCo81WOTdsRloHx1OH/TVqT5FrdAiHTH
	 MDAYmzyKZORnnr4YtS9Fv0RWAnqU5FUr5ArJK6Z0rKReOHkGoIQEz8SKARlTxK9dyiVBZ
	 +kYgdeN+vHctpVNdrTSdr9f4lbCBJse6OyRGQL1chx8p9mql+B2nb+3u0u3kfGNAeYumo
	 cM520Lf+nnzWm+TgvPuAIaoaFw+LigpXCZVfMDHprQ4ua1YxzbeZEfLxYLHFK6N1Df6T1
	 2N/4TOBQTT13ut7op8kumqwkF5HeTB/TOCAb2yaMh/hUqhxv49K2ZtZOcqSWaWrmRWw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 183B41F000EF;
	Sun, 22 Nov 2026 13:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795354566;
	bh=dJFF4Yaf51Mhkzgv7RkpItcN7NzQP2ca5nmx3B87ruw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=SVesHI5RoNSYS41hxm/slmyg0eVVra7VNFKJawgyRdK+YJdrhKNTxwfxUmOuYgCSc
	 O8msoO1ayXYrzdTNhX+RSU+dvW8YB97Xc60zqrvqOBnWRHcPJm3TIFEYSz6/MgwNGC
	 gi+X5cckg1gHrkVntKgRZ3VHigI+e/4Uq08Z76u5MEkonib5M2jQtbciZ7Bn7/S3qx
	 V9nmZP7JRc6YIj+A7frS0TGa8ZFgc5MlS4Hgw/sfP/FvhPF/uL0qbBr6YuMxP+sp8j
	 VKkAwDnjkdfIRO7q+t/MCvr0DCwoUPA/8PMG8FqhaaNV4VrT6g5FsEcWM3RyYckCCG
	 /VcC9/onQaclg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B58AE4C0B5;
	Sun, 22 Nov 2026 13:35:51 +0000 (UTC)
From: Robert Ijtsma via B4 Relay <devnull+robertijtsma.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 14:35:53 +0100
Subject: [PATCH 5/5] media: qcom: camss: video: stop started subdevs on
 start_streaming failure
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
Message-Id: <20261122-camss-fixes-v1-5-9df4deb87ea2@gmail.com>
References: <20261122-camss-fixes-v1-0-9df4deb87ea2@gmail.com>
In-Reply-To: <20261122-camss-fixes-v1-0-9df4deb87ea2@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Robert Ijtsma <robertijtsma@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795354550; l=2265;
 i=robertijtsma@gmail.com; s=20261122; h=from:subject:message-id;
 bh=zjyMBn6isM42TnzTEXtc7218B+PYUv1D1B/tQpAVb48=;
 b=WK0zgaho3jzMyUm75TRBIphefHd5XIXgDPDwglBrpJG4eGbOUZsBgj+nfpDpPrcLIR5nRz9cA
 pnhHrqHJPWzBxmqWfils8z3Pu33//w29tBvdMy6IxM1fT81VWSOiEaZ
X-Developer-Key: i=robertijtsma@gmail.com; a=ed25519;
 pk=qiDyKVqFicxFIR5sB5m+p9SWPKL2/+mMoiQnUx0C9P0=
X-Endpoint-Received: by B4 Relay for robertijtsma@gmail.com/20261122 with
 auth_id=1604
X-Original-From: Robert Ijtsma <robertijtsma@gmail.com>
Reply-To: robertijtsma@gmail.com
Content-Transfer-Encoding: 7bit

From: Robert Ijtsma <robertijtsma@gmail.com>

If a subdevice fails s_stream(1) partway through video_start_streaming(),
previously started subdevices earlier in the pipeline (such as the VFE
and CSID) are never stopped. This leaks VFE stream counts and write
master reservations, leaving the pipeline stuck on subsequent stream
attempts.

Walk the pipeline from the video device up to the failing entity and
call s_stream(0) on each already-started subdevice before stopping the
media pipeline and flushing buffers.

Fixes: 0ac2586c410f ("media: camss: Add files which handle the video device nodes")
Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
---
 drivers/media/platform/qcom/camss/camss-video.c | 27 ++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 0852eb6..6f7b9f3 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -253,7 +253,7 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct camss_video *video = vb2_get_drv_priv(q);
 	struct video_device *vdev = &video->vdev;
-	struct media_entity *entity;
+	struct media_entity *entity, *failed_entity;
 	struct media_pad *pad;
 	struct v4l2_subdev *subdev;
 	int ret;
@@ -282,12 +282,33 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 		subdev = media_entity_to_v4l2_subdev(entity);
 
 		ret = v4l2_subdev_call(subdev, video, s_stream, 1);
-		if (ret < 0 && ret != -ENOIOCTLCMD)
-			goto error;
+		if (ret < 0 && ret != -ENOIOCTLCMD) {
+			failed_entity = entity;
+			goto error_stop_subdevs;
+		}
 	}
 
 	return 0;
 
+error_stop_subdevs:
+	entity = &vdev->entity;
+	while (1) {
+		pad = &entity->pads[0];
+		if (!(pad->flags & MEDIA_PAD_FL_SINK))
+			break;
+
+		pad = media_pad_remote_pad_first(pad);
+		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
+			break;
+
+		entity = pad->entity;
+		if (entity == failed_entity)
+			break;
+
+		subdev = media_entity_to_v4l2_subdev(entity);
+		v4l2_subdev_call(subdev, video, s_stream, 0);
+	}
+
 error:
 	video_device_pipeline_stop(vdev);
 

-- 
2.56.0


