Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33BA21CC5B;
	Fri, 27 Mar 2026 17:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774631455; cv=none; b=MLGI7Frkpo/gEmgtDYQ5u8ivfEcbFxPVAbIsb9Jw1BN3LhjSaQhYM1wCJJ1iAiT4ONeAt+wtwzAP4p9ThSLG8SeiiuCXUeN0Ydzft/VLqud5I04uWiPYYbcJD7EYifZwZOW9vAPBdNo1X3LZknWjPOB3MBIXBqMHcNCZxGUFuKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774631455; c=relaxed/simple;
	bh=R+2mK3t/QVDAP2+Dgp7a5Zjp2Q6cKFLuzmt0S7JOz0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZDkP659A/ttPHbIpeAUx1EtDySti4mL7i3ogNqvYZFe9t3OR7gwqrZWd2+Fc8ieHsY2fz0lHr6ChFZwq4SBxUCfoebRLf33UhihP/dcyazO8SNJO7L4f0/o/3VtiDNIo9v0XVHtgG5cVYNcBTmR9ICwfAFo2cwGRGiwe2DUzuQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dGQNpZW7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dGQNpZW7"
Received: from [100.93.44.16] (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BD479305F;
	Fri, 27 Mar 2026 18:09:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774631362;
	bh=R+2mK3t/QVDAP2+Dgp7a5Zjp2Q6cKFLuzmt0S7JOz0s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dGQNpZW7FxctYhBHStHsTaBuU7JFGxacgy5gXj79mQi/bBfcz7OBoxX7hNuZyzZEm
	 rLyq0QCrqq3Z3y6EsvcPG6TrCVkplaASuJ1RV3qFMtyH4EbE3jy/vOKmvk/rF9FHFq
	 HUibh44+SLfmY7Az50hxpXbjUAPK0aeLqQN0rNLc=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 27 Mar 2026 18:10:14 +0100
Subject: [PATCH 09/14] media: rzg2l-cru: Split hw locking from buffers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-b4-cru-rework-v1-9-3b7d0430f538@ideasonboard.com>
References: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com>
In-Reply-To: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3029;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=//y9fvbItoS5LDzM9eGoIrQQBvpvCqsMu4nybreAVgc=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBpxroKpW/Z66S6UX1RaW9QRPfOAKuJhk5QZgC+R
 EAq76pknXqJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaca6CgAKCRByNAaPFqFW
 PF4XEACMqTmPziwcgeQyek+QWSp/UlmwZPcvMXBpyd9SZI8y7Eqk+34bVbng/Buk0kXt2xVtCvp
 Y0V2SPSQEyI17arlQHnJbq9iZ9YIzjN5YWT3VY7ITpuQ0qxNNVkPq4faWCJ3BEy4TG5NgvEtc/9
 p9HVW5xTAlMUGh8MEYhSL6ThiJUNpMw9fU920mVgKjPuMwxC+9n0ZZdmdW3sde1xIOKGnQjm8xP
 a4pZjuNo0SDuFelgWMJcSwVujlZFvJAAW24TnVKrNDdicnTq5WmjuL9ZXMsMAm2X2G9a7YFVR9c
 Ia6gMUXJanQkebIuNY2qg1TedCmpH2lILD/4FBXyi2U1FH7neB5BiGHHJKSaeDR9m99q2DBd+h0
 DhGpXfHAthrRjdg0udxFAJkmUuv2ZLtaQT34HaUKPfKTmzO5kPSjtCyB7vNTVeeNGfOipBFqQv0
 mK4/fJ7w2VK25pd6Q3HrBu6PsC/GGMeKHy7OGyPgAYczeECZcZLYXqD6r6XJ0sqn1G+ZRJrW5EV
 sRa6AG+yZ5m7f0wzUZ4FpGnK3pXwBgixn1Y8V/lxyn0EHpmf/35w/bWj7mAOHih0rbfDOlUhjtr
 LQrobi7PBl8RlmHazpX/oN2NoKdxlTGIgDpM2E5tB9sw+Px9A/ly8sO7EfHwL1+UJK698MhbaS6
 3RkfaJ8rJIvjU0A==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

Split the locking between a spinlock dedicated to protect the hardware
slots programming (hw_lock) and one lock (qlock) to protect the queue of
buffers submitted by userspace.

Do not rework the locking strategy yet but start simply by splitting the
locking in two.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 32 +++++++++++++---------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index a79b17e146bf..9406a089ec9f 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -112,19 +112,21 @@ static void return_unused_buffers(struct rzg2l_cru_dev *cru,
 	struct rzg2l_cru_buffer *buf, *node;
 	unsigned int i;
 
-	guard(spinlock_irq)(&cru->qlock);
-
-	for (i = 0; i < cru->num_buf; i++) {
-		if (cru->queue_buf[i]) {
-			vb2_buffer_done(&cru->queue_buf[i]->vb2_buf,
-					state);
-			cru->queue_buf[i] = NULL;
+	scoped_guard(spinlock_irq, &cru->hw_lock) {
+		for (i = 0; i < cru->num_buf; i++) {
+			if (cru->queue_buf[i]) {
+				vb2_buffer_done(&cru->queue_buf[i]->vb2_buf,
+						state);
+				cru->queue_buf[i] = NULL;
+			}
 		}
 	}
 
-	list_for_each_entry_safe(buf, node, &cru->buf_list, list) {
-		vb2_buffer_done(&buf->vb.vb2_buf, state);
-		list_del(&buf->list);
+	scoped_guard(spinlock_irq, &cru->qlock) {
+		list_for_each_entry_safe(buf, node, &cru->buf_list, list) {
+			vb2_buffer_done(&buf->vb.vb2_buf, state);
+			list_del(&buf->list);
+		}
 	}
 }
 
@@ -198,12 +200,16 @@ static void rzg2l_cru_fill_hw_slot(struct rzg2l_cru_dev *cru, int slot)
 	struct rzg2l_cru_buffer *buf;
 	dma_addr_t phys_addr;
 
+	lockdep_assert_held(&cru->hw_lock);
+
 	/* A already populated slot shall never be overwritten. */
 	if (WARN_ON(cru->queue_buf[slot]))
 		return;
 
 	dev_dbg(cru->dev, "Filling HW slot: %d\n", slot);
 
+	guard(spinlock)(&cru->qlock);
+
 	if (list_empty(&cru->buf_list)) {
 		cru->queue_buf[slot] = NULL;
 		phys_addr = cru->scratch_phys;
@@ -342,7 +348,7 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
 	unsigned int retries = 0;
 	u32 icnms;
 
-	scoped_guard(spinlock_irq, &cru->qlock) {
+	scoped_guard(spinlock_irq, &cru->hw_lock) {
 		/* Disable and clear the interrupt */
 		cru->info->disable_interrupts(cru);
 	}
@@ -560,7 +566,7 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
 	u32 amnmbs;
 	int slot;
 
-	guard(spinlock_irqsave)(&cru->qlock);
+	guard(spinlock_irqsave)(&cru->hw_lock);
 
 	irq_status = rzg2l_cru_read(cru, CRUnINTS);
 	if (!irq_status)
@@ -662,7 +668,7 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
 	u32 irq_status;
 	int slot;
 
-	guard(spinlock)(&cru->qlock);
+	guard(spinlock)(&cru->hw_lock);
 
 	irq_status = rzg2l_cru_read(cru, CRUnINTS2);
 	if (!irq_status)

-- 
2.53.0

