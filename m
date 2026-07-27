Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D06411F8A
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 13:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785158126; cv=none; b=NioWpEA7aK6VSjA+dpCClUY5Zj5Jxd/0UUAU9+2U6k6aWRVrOMU80LlbUjR1yXJpqT3VVktaR36Szm3dc/YZ7Luct1JlYarRV8857yJXUcOGxNxDDysi6c01ErpSsHCLbXqt0X0Oc4L+GMUDBTDNm1IRJ+Vdkc6hGTZuNXXNz+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785158126; c=relaxed/simple;
	bh=gUaeHvChtir4EUno9Ta7ZJdHyfwDft6HGyc7UjaqVho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BgPPkKcsviMqRx6ZP2auflqYYElzUATp9CFaMvtvT64ARLX+PYxi3W/wzqnI5dSBVtV5kouGaVDklcknfyBUYhvOAIV6NPfB/O77Trr8lf9vLM5p/cFC3z+VERBFviIQ35rS1ESXynrChNN0T5cKTNauFwEMLGmi5vyyyIRnRCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HBzuj9jf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HBzuj9jf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C1E81F000E9;
	Mon, 27 Jul 2026 13:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785158124;
	bh=gkevLGKd2h6Yp3BLlUXn6SBALt3SmrpXCA0iZaHJsoU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HBzuj9jf6ZHsLssFeuF3vWP4Ga2Od4kGOKPcmfK42m4EwiJlgBH2YmrO7UIG6o5FD
	 +JOxeRsxK6bZq/cMcN/Ke3tqc386rzkXV+Cmgghypqz1tT1zUVO1tfxQq7B5+Punw5
	 92GtAuAK2UHmzGQbe+a7lOplcWd4ox5BJAWbR1EMyFZ7K+/LJw30jErCMIizLc07Dl
	 DMX/GFEnQSCirYLzn92PHNTWB4PoCPD8bPOQMLwyzDi8YXw1t5wCppeeNkS/19RcYG
	 1OQRq5XxB5foYSN51jQeVLLUzsFDHNyFI/JaOPXuJN93cFmxi6UqgsXgOmui47S0NZ
	 022cZpxnOY63Q==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCHv2 08/19] media: arm: mali-c55: drop unnecessary vb2_queue_release calls
Date: Mon, 27 Jul 2026 15:12:55 +0200
Message-ID: <e0eef6d4de3bdec45977dde2813151dcb6f0ac5a.1785157986.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1785157986.git.hverkuil+cisco@kernel.org>
References: <cover.1785157986.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vb2_queue_release() function should not be called directly from a
driver. Leave that to the helper functions.

There is no need to call vb2_queue_release if the video device
has not been registered, or if vb2_video_unregister_device was
called since that already calls vb2_queue_release internally.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-capture.c | 4 +---
 drivers/media/platform/arm/mali-c55/mali-c55-params.c  | 4 +---
 drivers/media/platform/arm/mali-c55/mali-c55-stats.c   | 4 +---
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-capture.c b/drivers/media/platform/arm/mali-c55/mali-c55-capture.c
index 7aaa5c3f7354..37412e33f825 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-capture.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-capture.c
@@ -904,13 +904,11 @@ static int mali_c55_register_cap_dev(struct mali_c55 *mali_c55,
 		dev_err(mali_c55->dev,
 			"%s failed to register video device\n",
 			cap_dev->vdev.name);
-		goto err_release_vb2q;
+		goto err_cleanup_media_entity;
 	}
 
 	return 0;
 
-err_release_vb2q:
-	vb2_queue_release(vb2q);
 err_cleanup_media_entity:
 	media_entity_cleanup(&cap_dev->vdev.entity);
 err_destroy_mutex:
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
index de0e9d898db7..93664791e2c9 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
@@ -922,15 +922,13 @@ int mali_c55_register_params(struct mali_c55 *mali_c55)
 	if (ret) {
 		dev_err(mali_c55->dev,
 			"failed to register params video device\n");
-		goto err_release_vb2q;
+		goto err_cleanup_entity;
 	}
 
 	params->mali_c55 = mali_c55;
 
 	return 0;
 
-err_release_vb2q:
-	vb2_queue_release(vb2q);
 err_cleanup_entity:
 	media_entity_cleanup(&params->vdev.entity);
 err_destroy_mutex:
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-stats.c b/drivers/media/platform/arm/mali-c55/mali-c55-stats.c
index 655e52a5f288..aaeb361b2be2 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-stats.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-stats.c
@@ -304,15 +304,13 @@ int mali_c55_register_stats(struct mali_c55 *mali_c55)
 	if (ret) {
 		dev_err(mali_c55->dev,
 			"failed to register stats video device\n");
-		goto err_release_vb2q;
+		goto err_cleanup_entity;
 	}
 
 	stats->mali_c55 = mali_c55;
 
 	return 0;
 
-err_release_vb2q:
-	vb2_queue_release(vb2q);
 err_cleanup_entity:
 	media_entity_cleanup(&stats->vdev.entity);
 err_destroy_mutex:
-- 
2.53.0

