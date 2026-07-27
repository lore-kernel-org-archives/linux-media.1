Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7AE4156E8
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 13:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785158141; cv=none; b=urAnRelaNqivHVxpFRFoV4wYVLGuuQVeG77qdELdMBdI/gsl6r0V38kOPBy432QwsyurXQnd4U8fEIOY9f7Ao5G6579xhHRIHgPoWV8BMErz4ZI41U9NNAOwh0y2Q9qETr4XORSM6NgMxvq2b7i5gXdzrL2IIjtprDmjbIdxm64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785158141; c=relaxed/simple;
	bh=hAbguEN9dDHM77MUOJeFBx226+84orrJl4KHHyPctL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rfpsJ2THRk7md1VJ5kuVTWLF1EFXAVib4p+o+4qTlU1ssZl7Y6NI75pOfA9d/USCWto9P2HVjE6lDeKrEnGgWoKJSeV0vuR7nxNf+Y2LAjr7JN6tJXEj2jkBMbzLPJvlP740wH+lJO90jNqzaNpnxrRIOyZobrVe4Hetaxx+Xrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LEMcLfci; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LEMcLfci"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63EDE1F000E9;
	Mon, 27 Jul 2026 13:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785158140;
	bh=rg+wq22/znWG8clcfN2XRW6PQoVLkVwWSTq1EiCsKAE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LEMcLfci4cVZ/asBDM9MPgVyt4wdLz0wq6fCADAXJ4eE0aHkEarUmOIuxt3WlKXG+
	 k4NHeKIdXl48ohTO9vjFAS4BtgSb4BTh0zORfzduKo85Vz92tN1fahxJiASfSqpMai
	 mVxXgyL5xGXdBU38mm8LKL2kFY5lvQsdXLUIl4z8Mj/vnQz9QBMgfN2zwtKofEGVDV
	 afzQ7GrQEOrN8azigG5hiYxJ8uKhRq1LMHMHgi6o6+apR6gGHzCQ5xROMhwzI5SnC7
	 +zZ/bJiLqc+5waD1MD2rCRcNuN6tgZgZ5q8yuVGgZ5e+ZKn7m4leQSGfD/vBijRhI9
	 uOfwGeyByvAtw==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCHv2 18/19] staging: media: ipu7: drop unnecessary cleanup calls
Date: Mon, 27 Jul 2026 15:13:05 +0200
Message-ID: <01d99d4e6f3fb3b156c0b8deeb4e67eb6aa38c50.1785157986.git.hverkuil+cisco@kernel.org>
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

If the video device isn't registered, then there is no
need to call vb2_video_unregister_device or vb2_queue_release.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/staging/media/ipu7/ipu7-isys-video.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/media/ipu7/ipu7-isys-video.c b/drivers/staging/media/ipu7/ipu7-isys-video.c
index 8c6730833f24..5f3f091aabb5 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-video.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-video.c
@@ -1035,7 +1035,7 @@ int ipu7_isys_video_init(struct ipu7_isys_video *av)
 	av->pad.flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT;
 	ret = media_entity_pads_init(&av->vdev.entity, 1, &av->pad);
 	if (ret)
-		goto out_vb2_queue_cleanup;
+		goto out_mutex_destroy;
 
 	av->vdev.entity.ops = &entity_ops;
 	av->vdev.release = video_device_release_empty;
@@ -1058,12 +1058,8 @@ int ipu7_isys_video_init(struct ipu7_isys_video *av)
 	return ret;
 
 out_media_entity_cleanup:
-	vb2_video_unregister_device(&av->vdev);
 	media_entity_cleanup(&av->vdev.entity);
 
-out_vb2_queue_cleanup:
-	vb2_queue_release(&av->aq.vbq);
-
 out_mutex_destroy:
 	mutex_destroy(&av->mutex);
 
-- 
2.53.0

