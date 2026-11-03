Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691679;
	b=F/ktgzZP2gz0ucJZkJ5ZgMf4udyE8QfFiJAaGWqXUOxueTqxUnNlJOSESdbHfZO/GzJB
	 ew81sosPWrm/xHrw28EqXZuUbZt7Ale/fp/kQLNrerwNw3Ya5nlLRBR8QjW5BM3q7HVjp
	 g9RuRnOGRbi0+Vj3HK0G+1+q1carNX/dStsU2uE3+XEE+cR4+pLOWq3NUdvIJW1F0ce1n
	 X9xzTFZ60YpmcGm9eFQHDeXXEGbgKniDb1L6nuOlczQ5A9NgsbqkCCBghwBjUUQ22e0fD
	 deas/lez5mEuEPxlW7CrmZrHyKng1TxUoGZv/E4BpJxdQudBajgyT1vITciABad2dSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691679;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=xNFKXoOVsmsKy+sB+7ysMJUwVLtyKRyR+8DLggWM008=;
	b=KrmgNgsezc3u05dD1a1btt3DFmlhUV1hVIlmcM012K7nHRuqHiDIGiZ4T72fbkhlD4kk
	 AssoSiHcwd4W1T0nCJqgUjJbihqJBYZJmMl2LCWJ/Kyq9O/b94Zaqkb1iLyo0BxJ4a0AP
	 cmOnHrwJk0XVDo1e84IRJxhrOCwN1JmmOW1TiLeYR3i/8ULHDQIXngkKVj83ouIdnSzmY
	 vnhCgHlU21xfC2TpAPt5alfEglKNYyM5HleAP6L1xhXujCB84cC8XPtzfi1YQX+ToiZX4
	 Ld31KTQthBs5y576SBm9gMSe2IjUcwsG5UsjalEJUx0ZV7lGs+FUAZ4oRlASA1Umdlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=sKjh+tBJ;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42149606D803
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 07:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42149606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=sKjh+tBJ
Received: from [127.0.1.1] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 72F7F287E;
	Tue,  3 Nov 2026 08:38:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793691535;
	bh=XDiOl4SIg1voG8HN0me3SLmpR1aSvPqTIfej/UlGQyE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sKjh+tBJWA0vDVKk6i0poxP4JJ/fk7NYesmhOzfVBX2JOBDmPvWHUgHsJqkXvAV76
	 r4Ayc+2wuui1/9geuVP7Lry5TSot9GNYqKZWS7Qoqc3YMghm+RYcIlETDPzHNytcTT
	 gzvTPdBEjfaQiDcuKu+yW5Qv24F1bI+d4CoAXP2o=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 03 Nov 2026 07:40:44 +0000
Subject: [PATCH 08/16] media: rkisp1: Switch to calling
 .enable/disable_streams() in CSI subdev
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
Message-Id: <20261103-rkisp1-suspend-and-resume-v1-8-08f863b6fdc5@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3040;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=XDiOl4SIg1voG8HN0me3SLmpR1aSvPqTIfej/UlGQyE=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBq6ZAQAd6xd3iNRylSmYnCTrRc6PElOb8mpiKJZ
 UP4fctOU12JAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaumQEAAKCRDISVd6bEV1
 MkxaD/94XgAuMBNtuFVwDl1wJphjJj3DwOZwEws2YKsYxwK8k6OfWF+Kk2NzZMM0fGeDmsM2z84
 nmXe3J+iXZ5EqX88Wgz/sbvnna0sHx09TDrdhRAIEd72YzgY5MPU0pZi+2xxIBjxKAlRI84/VKI
 tHxFFTFiCtlQ0KrNFNwUKQ8UuUbwRUSnHF94D4aQ44eVSzDi1wdUv5kkKKMhFyL1cufaLYkkQM7
 qNy6+voPWFh+oeGMZUOEFzQGkap6is2aVqKm3KjlLYaJ6t3JN3QPvbjgbRR3pWkUFFnnrJh7EBl
 RcJGQSfvcspVgu+u2VNyFtWgkuknMjpG8sel9/KEiby530r5S/4Q3owIkuYPZKhnDCrCR7S1x5K
 K15Z3ZuCPOzUnsJexDoGMlvUc6dtqSt1C+tpkXAM2q4MjKn8QgpMPvm/Gv6O99B1rtHcjiRX4BP
 FY7iFt0p3bKDctRwYeJXnzXjsO5FF+bltqyWOW8TQZXv/mGA66anluNrY9DAs+eOs6jjBHnqkQc
 VAUJyn9DkaMLsdqblEqDwMqYXqLBa3D8gHROLMxxyg8rxVNw3U8K6tJJu6LxOcCliUTmoEV4+k9
 /OTnhRX7U0JrCql8/Kq9wPobd/xecvYrZDnuNlXdAb7nKsOSklCwKdH3u7txFasuyJ6ZyCT84XM
 uAkH90R27ay8FpQ==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Switch to calling .enable_streams() and .disable_streams() for the
downstream subdevice in the rkisp1 csi subdevice's .s_stream()
operation.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 .../media/platform/rockchip/rkisp1/rkisp1-common.h |  2 +-
 .../media/platform/rockchip/rkisp1/rkisp1-csi.c    | 24 +++++++++++-----------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index 6a017a2077f6fdef3a3fd0998f182baa19bfc5b6..357a6bd8db7da4c881e4cba5b5f54e40fd21c38c 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -209,7 +209,7 @@ struct rkisp1_csi {
 	bool is_dphy_errctrl_disabled;
 	struct v4l2_subdev sd;
 	struct media_pad pads[RKISP1_CSI_PAD_NUM];
-	struct v4l2_subdev *source;
+	struct media_pad *source;
 };
 
 /*
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
index 9fa8a0407c90ec5e379a78da32315a0abf406ea4..1fd122f95f8ad0d6c34384ef647da0a3a57c811b 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
@@ -355,32 +355,34 @@ static int rkisp1_csi_s_stream(struct v4l2_subdev *sd, int enable)
 	struct rkisp1_sensor_async *source_asd;
 	struct v4l2_async_connection *asc;
 	struct v4l2_subdev_state *sd_state;
-	struct media_pad *source_pad;
-	struct v4l2_subdev *source;
+	struct v4l2_subdev *source_sd;
 	int ret;
 
 	if (!enable) {
-		v4l2_subdev_call(csi->source, video, s_stream, false);
+		source_sd = media_entity_to_v4l2_subdev(csi->source->entity);
+		if (!source_sd)
+			return -EPIPE;
 
+		v4l2_subdev_disable_streams(source_sd, csi->source->index, BIT(0));
 		rkisp1_csi_stop(csi);
 
 		return 0;
 	}
 
-	source_pad = media_entity_remote_source_pad_unique(&sd->entity);
-	if (IS_ERR(source_pad)) {
+	csi->source = media_entity_remote_source_pad_unique(&sd->entity);
+	if (IS_ERR(csi->source)) {
 		dev_dbg(rkisp1->dev, "Failed to get source for CSI: %pe\n",
-			source_pad);
+			csi->source);
 		return -EPIPE;
 	}
 
-	source = media_entity_to_v4l2_subdev(source_pad->entity);
-	if (!source) {
+	source_sd = media_entity_to_v4l2_subdev(csi->source->entity);
+	if (!source_sd) {
 		/* This should really not happen, so is not worth a message. */
 		return -EPIPE;
 	}
 
-	asc = v4l2_async_connection_unique(source);
+	asc = v4l2_async_connection_unique(source_sd);
 	if (!asc)
 		return -EPIPE;
 
@@ -397,14 +399,12 @@ static int rkisp1_csi_s_stream(struct v4l2_subdev *sd, int enable)
 	if (ret)
 		return ret;
 
-	ret = v4l2_subdev_call(source, video, s_stream, true);
+	ret = v4l2_subdev_enable_streams(source_sd, csi->source->index, BIT(0));
 	if (ret) {
 		rkisp1_csi_stop(csi);
 		return ret;
 	}
 
-	csi->source = source;
-
 	return 0;
 }
 

-- 
2.43.0

