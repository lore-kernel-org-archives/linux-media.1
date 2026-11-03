Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691688;
	b=PZh2+hmCdj4znjaat+O9jiYumPv1tJ2RzgA+kx/nJGs1tGqr26VV0oZRHiYTAmge4hxJ
	 kqTZ7U52MS9i4Ahf/4+0sUPyI//6c/3qe1mMhRFDcSzfr/bDuvYkZHL5tumXtt5rZ3byh
	 ZD/4O1bmf2Pbgi2+bK/6/6jl6ax4X1RW5xaX9uBWYbOhMTDQZUSO72rUQ/Qz5AkgFstMl
	 HE14Ys9qDK0zmf7NKxZNyuiEzcTeJC1tElvORdkF6tudvvf9UWYqZc/X4FGSOg6C+96MF
	 UHOOKu9/WjBFumgCIcRcUCDGlqJfJYSL4DD3iJHvoHGz/Rp/ZwqLTpQLOQUATrzqN6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691688;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=1Sb+kHP0UG8zxBjJay5N1gzr2+bx1UpSKchrGVymdto=;
	b=JWJQzP9utulfGIme6ysQnpJ1dQlEzJsbm0otugDVr4v1q21SObyAvi2w5lHuOW7J8KN6
	 f1ZdrUtyJYvl7R6OHqomHjhjjQRIQruC6BNp/WuhvToUs9I5k3tbFh6KqZNemXSv0KTpf
	 mo5160niKi3ES+shBXsyL9aNB8RcLXrRxnY1eOTEDfD7eott+MT5mdf+YFMEgiOtGI+uI
	 kw7D/YZkC73/4YNwMtpAoB+PWwyiS/LstfrwJJ5ghhSeY4OkVdlu1fbsUqIP770vaNfp5
	 WWHotGyCxBot8cFPfmAxJhil6u0J/P0CayKYHvK6d7Gil/mMKBUpMWCRwuAMQ0+SqyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=VWo3XZ5g;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7276A606A339
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 07:41:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7276A606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=VWo3XZ5g
Received: from [127.0.1.1] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 482424F0B;
	Tue,  3 Nov 2026 08:38:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793691538;
	bh=5k+Go9iWV1PMuxjHaEI6NhcCmIiXPI7Oy1Ru6A51bOk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VWo3XZ5gbYeIB+9swj2UwNzykDpDTzRMaWcYQx69ewSPCQG2NEis95zyIQZihM/uX
	 bvaiam8NvA1tjvZP7Wi+ZLU594b7CEqravyl7z8eM3LwPMmHJ+34p/Bq0aBqBZAqqI
	 AXh8TRfu8SejchJorjxaamLnTilZL64daOYgNQcg=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 03 Nov 2026 07:40:49 +0000
Subject: [PATCH 13/16] media: rkisp1: Control ISP streams from resizer ops
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
Message-Id: <20261103-rkisp1-suspend-and-resume-v1-13-08f863b6fdc5@ideasonboard.com>
References: <20261103-rkisp1-suspend-and-resume-v1-0-08f863b6fdc5@ideasonboard.com>
In-Reply-To: <20261103-rkisp1-suspend-and-resume-v1-0-08f863b6fdc5@ideasonboard.com>
To: Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3705;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=5k+Go9iWV1PMuxjHaEI6NhcCmIiXPI7Oy1Ru6A51bOk=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBq6ZARMACNr3Xj3bExJwVDIBAITNQJ3AZYsnAJV
 X9AdbYFP+mJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaumQEQAKCRDISVd6bEV1
 MuD5D/9e30LGFIUf1vlWSLf7iOexIkxWC+GNTDPvTzCnezwIOOQYc9v4/edpiXzrVPHh7WdieiL
 MzHyXmyYhR+w/dvsvHiTTA9sI8cG4MFPpdL2dbYqi9s2Jr2aTZ2aQkyBoYc8G+EXswHeYw4IDUd
 0tOtou3GSKG/fOv8A4RpCLZV+jqn42wsXKnW7Wn1wRibPLp/9ksjLhCI5QvHBPeqhQQ7GXeABgk
 jbu+/uWDojaq4vU1LMHV7FRg06CkOXja6OGGWuTmCt1TEfMrsvu6jzusQsgWo3bFJvqBX+OpCuT
 v4Iy0GC890Gj53SeUtpBMxlP+GG6skJa1BEFivqRKMUA0N2KavGQOjGbXl4BhFs2Kx5leaHn0dn
 3rjDywFQkmarnmao4Mzog9eZzSlNAnbKcSzr0ibEoUHZykiXRt6ReE3Q9ux0s1RSWLYcY4h9m+8
 FYLsEii9EHcOKgXZrMsGIx2b3jn2kHPo3kcqojwAtPRZUkCF7OVEXvm4LMF0fC8Lny66CwCyQW6
 SSwZ+/N4MusZrIhFtK07KFQ4pb61nEbzi44AsxDqs3w8CnTsgfdGxEMYC4lp2FBcqtREQz+oC+g
 fn+iottvu278E79ciXetdPsNWgxpJMcmgowV0TEKsYvlut+adQonQfLronE4bSNAUl7lA+oLdly
 DeFr79VxLOCf8hA==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Currently the rkisp1 driver enables or disables streams for both the
ISP and resizer subdevices in the call-chain of its VB2 queue start
and stop streaming operations. We generally want to start only the
direct provider's streams, so keep control of the resizer streams in
the VB2 queue operations but move handling of the ISP's streams to
the resizer's .enable_streams() and .disable_streams() operations.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-capture.c      | 24 ----------------------
 .../platform/rockchip/rkisp1/rkisp1-resizer.c      | 18 +++++++++++++++-
 2 files changed, 17 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index fcc6f06437e182c0510fab7df5a50dfe7d0cb48a..84d66da484df7cbc29700efc433b1271d594ff78 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -1067,15 +1067,6 @@ static void rkisp1_pipeline_stream_disable(struct rkisp1_capture *cap)
 	struct rkisp1_device *rkisp1 = cap->rkisp1;
 
 	rkisp1_cap_stream_disable(cap);
-
-	/*
-	 * If the other capture is streaming, isp and sensor nodes shouldn't
-	 * be disabled, skip them.
-	 */
-	if (rkisp1->pipe.start_count < 2)
-		v4l2_subdev_disable_streams(&rkisp1->isp.sd,
-					    RKISP1_ISP_PAD_SOURCE_VIDEO, BIT(0));
-
 	v4l2_subdev_disable_streams(&rkisp1->resizer_devs[cap->id].sd,
 				    RKISP1_RSZ_PAD_SRC, BIT(0));
 }
@@ -1099,23 +1090,8 @@ static int rkisp1_pipeline_stream_enable(struct rkisp1_capture *cap)
 	if (ret)
 		goto err_disable_cap;
 
-	/*
-	 * If the other capture is streaming, isp and sensor nodes are already
-	 * enabled, skip them.
-	 */
-	if (rkisp1->pipe.start_count > 1)
-		return 0;
-
-	ret = v4l2_subdev_enable_streams(&rkisp1->isp.sd,
-					 RKISP1_ISP_PAD_SOURCE_VIDEO, BIT(0));
-	if (ret)
-		goto err_disable_rsz;
-
 	return 0;
 
-err_disable_rsz:
-	v4l2_subdev_disable_streams(&rkisp1->resizer_devs[cap->id].sd,
-				    RKISP1_RSZ_PAD_SRC, BIT(0));
 err_disable_cap:
 	rkisp1_cap_stream_disable(cap);
 
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
index ce0b2c68cf826992ed07c453a611a7cab7dfb96a..cc7695c1267fc75b6e9a9518786e79c82daaa435 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
@@ -633,7 +633,15 @@ static int rkisp1_rsz_enable_streams(struct v4l2_subdev *sd,
 	if (rkisp1_has_feature(rkisp1, DUAL_CROP))
 		rkisp1_dcrop_config(rsz, state);
 
-	return 0;
+	/*
+	 * If the other capture is streaming, isp and sensor nodes are already
+	 * enabled, skip them.
+	 */
+	if (rkisp1->pipe.start_count > 1)
+		return 0;
+
+	return v4l2_subdev_enable_streams(&rkisp1->isp.sd,
+					  RKISP1_ISP_PAD_SOURCE_VIDEO, BIT(0));
 }
 
 static int rkisp1_rsz_disable_streams(struct v4l2_subdev *sd,
@@ -644,6 +652,14 @@ static int rkisp1_rsz_disable_streams(struct v4l2_subdev *sd,
 		container_of(sd, struct rkisp1_resizer, sd);
 	struct rkisp1_device *rkisp1 = rsz->rkisp1;
 
+	/*
+	 * If the other capture is streaming, isp and sensor nodes shouldn't
+	 * be disabled, skip them.
+	 */
+	if (rkisp1->pipe.start_count < 2)
+		v4l2_subdev_disable_streams(&rkisp1->isp.sd,
+					    RKISP1_ISP_PAD_SOURCE_VIDEO, BIT(0));
+
 	if (rkisp1_has_feature(rkisp1, DUAL_CROP))
 		rkisp1_dcrop_disable(rsz, RKISP1_SHADOW_REGS_ASYNC);
 	rkisp1_rsz_disable(rsz, RKISP1_SHADOW_REGS_ASYNC);

-- 
2.43.0

