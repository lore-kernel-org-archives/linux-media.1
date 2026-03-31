Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912E53F0A85;
	Tue, 31 Mar 2026 10:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774952885; cv=none; b=FO4Dh1vQBCODS8vZuXZkk+ocdXKWccDG2L1yLLGA7076IdkLEpiZS0AcCVM/Je7HqJFLNaxL7+gtOAc9hqte4bz9GV+etctm9/VmadSuWdMNf7VsB1iAiWEQy3EbRZRG4Pxt9zFkFySGE2PQl6BiOBWFxWGwPwLPyijHb3QTQ2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774952885; c=relaxed/simple;
	bh=9+DkOdmPSrP4JYMm1m74gDbtMNLLMgFNuSUFBiWA0U8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nTZz1vQQUvzq1RM1FKCAyXdL9juvZkhFFeF0LMVvCAA9ROs5vYjWwFBsiOvcCg9qpH4HfG8Nh69SDIhSX/AeUnU9Asglo0odPfdXTLiD7BiHW8M/BWUUyidqm2ZTdvwsR/CHJ7wjtyQ+F/6VrY4w+8XtbFbR+MqRA0dnbRu4XKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FKOI3QE2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FKOI3QE2"
Received: from [100.93.44.16] (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 12FB423B9;
	Tue, 31 Mar 2026 12:26:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774952796;
	bh=9+DkOdmPSrP4JYMm1m74gDbtMNLLMgFNuSUFBiWA0U8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FKOI3QE2cEao1N+upbhcZinZ5peIDKmoX0AuxqFmMMYk0Dl0bU8sgZLSlA9drHY7j
	 NmUVnVA8YD1zyq9x9pmwKZF5jGR1HNgTd4GYW3syxl98VW18XPUiNNjSLFTBx9/nHj
	 i7V4iblAtbCTmjpIiIj6D+gUWkmc1/sEoX94GiTg=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 31 Mar 2026 12:27:36 +0200
Subject: [PATCH v2 06/15] media: rzg2l-cru: Do not use irqsave when not
 needed
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-b4-cru-rework-v2-6-f94b238b35d4@ideasonboard.com>
References: <20260331-b4-cru-rework-v2-0-f94b238b35d4@ideasonboard.com>
In-Reply-To: <20260331-b4-cru-rework-v2-0-f94b238b35d4@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
 =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1586;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=fvrKTvFhlxX/fsq2GGPQYdxvVmmQtfy/A5/fGBE/O/Y=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBpy6GogViIbL9f/0ktxfsvsLoU2Q99rl2pDrWWo
 6T2PTZnzJ2JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCacuhqAAKCRByNAaPFqFW
 PBjPD/0aBGgtwiwTZTXhSSrFspwpSqpw+sGk6KctamJf0WA6wa6ioaBF9WNkuhilZLBU+kNM6Bx
 wj1d+NDP2RcqUq8q51YuCp//YRQlbFfro+eiLzq7du928dqIibMkQv1heKnJr0MUajU7WFEZnjS
 tMMjhF2YDS2O6/S6R9GyfCcaHc7WYh7Iw3LW1m+ZXu23aP1jvkjtRpLqZrX8hzkfxPcZ31J/ulq
 GDlovtK3zOJl29SepeocRhjo7nWMnCH4IiYyZsrACFPC7O/eq5hqbOWSI4ecOs5iyYqkDQOzo2z
 IBqXFErMd3zVel3qu+ZWmmgBLyvwgm198QeetJh9y2JXLHwLlND5OK/N2kvUAGQpYRYGx9ZYm00
 OYndWcKNTgTWWgZHgXY78bYW89UbkPjZTa2xNTUdpaZF6o46dJTOUjJ1LGgnWzgXumYcLzfZAmr
 cAcy6QBQISAsMgM8IuCadLW729StkdYk12mU+IJBkORVwU7fxsPIptUPalTPc/Fdq35UQBeUxRb
 7tTOV5l/Vl516VOa/29s58Da5wHEnMOFL+yc/j/bZR24bHWcJYmqnIwsUA9I50aMObUkoDxHeql
 QEWVsdeRjrpNW1OFcP/U6zyrCdIbZIQkI3x4g1mewfuy18O69D5eY13H2OjlZ7TzwNksZ6+QkqZ
 ke/by4j56wOPsqQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

The return_unused_buffers() and rzg2l_cru_buffer_queue() functions
are never called from an interrupt context, hence they do not need to
use the irqsave version of the spinlock primitives.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 96c71f1357f8..b2d1b6a4aaaa 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -112,7 +112,7 @@ static void return_unused_buffers(struct rzg2l_cru_dev *cru,
 	struct rzg2l_cru_buffer *buf, *node;
 	unsigned int i;
 
-	guard(spinlock_irqsave)(&cru->qlock);
+	guard(spinlock_irq)(&cru->qlock);
 
 	for (i = 0; i < cru->num_buf; i++) {
 		if (cru->queue_buf[i]) {
@@ -165,7 +165,7 @@ static void rzg2l_cru_buffer_queue(struct vb2_buffer *vb)
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct rzg2l_cru_dev *cru = vb2_get_drv_priv(vb->vb2_queue);
 
-	guard(spinlock_irqsave)(&cru->qlock);
+	guard(spinlock_irq)(&cru->qlock);
 	list_add_tail(to_buf_list(vbuf), &cru->buf_list);
 }
 

-- 
2.53.0

