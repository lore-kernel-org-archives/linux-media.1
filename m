Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65283E00BA
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 08:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784276738; cv=none; b=h8/1OyEaW0g+u7EBr5spZfoP+XR8Bncq6hwGtqFN0eD546aPPWja92A2t79n0jH6oJKOjpUd0XEG682bi5g7LSHOetOvFq3+8qo9UvmhXr8SLmQSfK6jncwg/KsOfLql/MCAMVfUTdJSymN2VvYym1r1BHlZ7As4UNMYCNhF3MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784276738; c=relaxed/simple;
	bh=4PjrkH90KgdYNAIdcxAGyl3eOWAzA4ZFvzWvfxYP0m8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ONOARHriso4qyf+yAEgyiTBZdoYNcY+8Rp7rA08ByS2AW30ukbm4t4EktMwI9XKQs/KyVVDS4rARDLzQhBp4B7U/2PhrjT6j5t9JZZ3QS976M14i2hb5KXtSQCN3YOCJsYu73uL6ArixIVknVhpf7KyeYV75CTm6ZQp8MbEeysE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j/8WJflD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j/8WJflD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 631B21F00A3A;
	Fri, 17 Jul 2026 08:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784276736;
	bh=/oorBryDQ5ba/gkKrdTOCWNxMPDAKb7mYndoFfyd5HE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=j/8WJflDJc5AJ1QEJUb/7Og8kDNysErVYat2cCEQRpAPDEMUU2F5C/D8SBBzNLjCC
	 2hgpQRHRq8/avWxRUNvy9vNWE8Z4COaHtOkJV4VbtkpA+TyUgxAasG290xpg9ikq0P
	 xoacKOUoUJtfHsIP/Jt8rQe/f71GeYeX0ego04kdrfhDnB4NzpMFZEDDe9zM1M0FJJ
	 IicxwDwvHsPwImtxRWIJdfjiI/DHlAZKDo7AIfRLsCy9cR3yYjnO6DPnwpMGHT7WPh
	 AqcRX0o4dn8rWRp5y5v0ZKlVfNBJrUgnKP3Bvd69ye0JWcwg+5x08RyTmH1YQuVisd
	 0IUC5z6sxbGHQ==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH 19/19] media: renesas: rzg2l-cru: drop unnecessary vb2_queue_release
Date: Fri, 17 Jul 2026 10:19:42 +0200
Message-ID: <65f9a56df4dc3e3d942ce7bd286872a10da5452b.1784276382.git.hverkuil+cisco@kernel.org>
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

