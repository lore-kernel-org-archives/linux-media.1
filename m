Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9423DD50D
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 08:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784276719; cv=none; b=Vu8TlK8EitXpe5JkqO6oXycU5Cf3FbzLucrGO1IrMKWbxYSYc8v6z4WXdl/8MtljFBmneiBEZyeyrRujVbQ+OgyC3OnudvIRnsG6znjnswIsP2O1i0tOWgLIiQaUn1j8R/sTehjW/RMiPiTE9qQ5+CeDhtqx1mdyKLIItl4gl7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784276719; c=relaxed/simple;
	bh=tMNobsGDoveVT5sn5PfmixJxXn/nkTgfoVb3+FaoMwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=olFvmayVsJ+Ypp5QM5mh1CLNcF4vHnn8L/VS9ZSHy3JdeeJ72hrTCq8eTUTMsBm6MLB9G+pd+tyaF3uhoTioySuD/pAhTSxUtieFm2DDSpiEhkpft4nUNHDil90N6FM6Y7CUG2AP2k0W/d1/HR1fm3gJPgvz4mfmpwoc9nsR8Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jjAxqeMc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jjAxqeMc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B29921F00A3A;
	Fri, 17 Jul 2026 08:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784276718;
	bh=mG3ATbmvZ2Cr+ARGKJrzCR92YtulnlZZIzVNBbEk1vQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jjAxqeMcYxgsI6WrQPZ7+niWXVZ3VTBA4hroNX2lmQm6M8G0y2NM8ITzfqLSQoCnD
	 OyIXxuY7LKcQWR4injAMhZqr00Egx2lMKa16Xx8Lv6H0sUoOlNfnor7EamGfedbvjB
	 /ZHUBkiCL6goHP+5H5VDs+CoT9MSXXw6+c/O5kiis5i8SP5Q/m8zEPgTV7vQI2bR5G
	 jMI3hveSbLh2wO49B1MUgmxwyofU2FvMDxJwCehSf4clwUWy/QsQ/TeL6Ic19h7+Ow
	 TRrZsZ6WxPD1DZ1D7RI+DbX5PsTyLwERiIl7nFSDC6aCGYDlfEgmqDaCxQFVP5dFOF
	 Qh8hXK9dBgyoQ==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH 08/19] media: arm: mali-c55: drop unnecessary vb2_queue_release calls
Date: Fri, 17 Jul 2026 10:19:31 +0200
Message-ID: <ff487dafa3973426588900056849f341a090d4d2.1784276382.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1784276382.git.hverkuil+cisco@kernel.org>
References: <cover.1784276382.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

