Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C806414A09
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 13:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785158143; cv=none; b=ttTJEVx6B1EbbujAdlBX1q9drvGnN11OphqKCTCDMyD1/Mg3Iy+jmGVVyC6BelHUvlAujawSWzCEfkQqKzLHZpQ95glBdJzKXC9LNIYCpab3C9urUxJBOZR7Wor+7RghxjJBWN0sPZuqqZOEuqw3QCPAUxRAfudC8wcG2Xsugho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785158143; c=relaxed/simple;
	bh=4PjrkH90KgdYNAIdcxAGyl3eOWAzA4ZFvzWvfxYP0m8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cOpNVxY7p3ewoPEVmpXc+xMTM14V0XWLxOEA9bTDsqNqytS8jPwgnOUtoSTLZxyDDHk5fOaIeaMr6A0nTbwbYVgItP82J62VBULcrms57bH+2CuMgYoLXG6dCRYdWIl/2NTdJCR/lhlw+/ogl+05BJDqOqh7Y1KnlT/VsH01VGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d55NmqXy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d55NmqXy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE4DF1F00A3A;
	Mon, 27 Jul 2026 13:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785158142;
	bh=/oorBryDQ5ba/gkKrdTOCWNxMPDAKb7mYndoFfyd5HE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=d55NmqXy8LcDZQm7CjUQUq3isl9rznzZLYf6fJuGyeeKDCTfO81YRb2i1hfE7eFyz
	 u0VAMT4F20Zkiqd/yYHjJvI1u51uSfSRXzDutpSOEOXBccZSqmAaGPvjj+i7pu8gXP
	 9lGBNs6dj+UHrFCzC0w2LvIDK46I15jiwQkOc4iWUEpvVLHqhw3FLi+38aV3yz+M/V
	 wyyecFXsZ3PUP913m0lHrjRhDin69yAxyTr3G9mUiZX32iuNG0BOGtjBS++PjcC0m0
	 PyohlNF38Hy355vkgagb4onUoQEfZNFgQqcgVkK2aQ6fQDK0yM37U4K34s5tIaI6YC
	 Kqk4kTlclqnyA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCHv2 19/19] media: renesas: rzg2l-cru: drop unnecessary vb2_queue_release
Date: Mon, 27 Jul 2026 15:13:06 +0200
Message-ID: <44e3e17f6bd0a3bdfc89bfdf5d46dc371c94d825.1785157986.git.hverkuil+cisco@kernel.org>
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

There is no need to call vb2_queue_release if the video device
has not been registered, or if vb2_video_unregister_device was
called since that already calls vb2_queue_release internally.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 2f5ab1e4707e..edca6cfb5839 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -767,7 +767,6 @@ void rzg2l_cru_dma_unregister(struct rzg2l_cru_dev *cru)
 	mutex_destroy(&cru->lock);
 
 	v4l2_device_unregister(&cru->v4l2_dev);
-	vb2_queue_release(&cru->queue);
 }
 
 int rzg2l_cru_dma_register(struct rzg2l_cru_dev *cru)
-- 
2.53.0

