Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F892BD0B;
	Sun,  1 Mar 2026 01:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328085; cv=none; b=uLqTG2ZraAOwHfwNoEteiefEKKDg5mi7/EE0tb4s2RzIIybNm8jH0HEps8KwM3n3YmcHHwQUS2Tep2SruHRDyB9AVDbthqqieUWagAYq3knyPHBfTNqHR3SGVyQItOojxk39zvAoF0OeNx75ZbmDmD018SRhRhnx4zIbhTo5Uyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328085; c=relaxed/simple;
	bh=cStXjZw7ZuEYg6hpY1Da/79s+sXlHNHkAc0ebc5k6So=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PlYx89xBjZHbiDXh7hDChtWs14ru4zgj4p673Xwtqm0IEh37G5kmeFjbbywTGYr86W/cqDpX9GlCZmEwnG673gDGvTWms6tbMb4DGzZzVnexWGKgItZ06tT97DmoWVRwKbdBnw2f6l/wjArHcOmhJ+TCvfRF1+ja8D4Xkr75r4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qqewTdWi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qqewTdWi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D37B2C2BC87;
	Sun,  1 Mar 2026 01:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328085;
	bh=cStXjZw7ZuEYg6hpY1Da/79s+sXlHNHkAc0ebc5k6So=;
	h=From:To:Cc:Subject:Date:From;
	b=qqewTdWiS+TWTom0KgacxrEk1idMHYNuBz3yUGUsMxsFM3HP4CrKyO19Ob0WOiCHP
	 KZvIAWf3MIK3xnsWX+yIkpLwOkDjj02YtkCO/n+YGYOAR6EmyLoZL1EA865GWPxrxz
	 YqkHvm8UAVeek6kUffIRy9iuUHMGcvRBbc/yTZEB+5VDIdxT0rDJrUhSQcJQvQfBOQ
	 MlGWo2B/NUB6lZoNuRni5l9zAVJ7leh0tRJco6Pn87zuQ2FHpk1FnLef8FgcUmG6oT
	 2iaqrgzvVFMmmffbDMV9wDGi7ATUusyBeSPTF2bqTN/OeE5lTEpEFod1g1dnuNYNGY
	 rNL9eXJHHI3sQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	alain.volmat@foss.st.com
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: FAILED: Patch "media: stm32: dcmipp: bytecap: clear all interrupts upon stream stop" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:21:23 -0500
Message-ID: <20260301012123.1677297-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 222f1279edd9008ee35b62de156ddac84e31443c Mon Sep 17 00:00:00 2001
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 19 Dec 2025 15:30:35 +0100
Subject: [PATCH] media: stm32: dcmipp: bytecap: clear all interrupts upon
 stream stop

Ensure that there are no pending interrupts after we have stopped the
pipeline. Indeed, it could happen that new interrupt has been generated
during the stop_streaming processing hence clear them in order to avoid
getting a new interrupt right from the start of a next start_streaming.

Fixes: 28e0f3772296 ("media: stm32-dcmipp: STM32 DCMIPP camera interface driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
index 1c1b6b48918ee..b18e273ef4a3e 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -512,6 +512,9 @@ static void dcmipp_bytecap_stop_streaming(struct vb2_queue *vq)
 	/* Disable pipe */
 	reg_clear(vcap, DCMIPP_P0FSCR, DCMIPP_P0FSCR_PIPEN);
 
+	/* Clear any pending interrupts */
+	reg_write(vcap, DCMIPP_CMFCR, DCMIPP_CMIER_P0ALL);
+
 	spin_lock_irq(&vcap->irqlock);
 
 	/* Return all queued buffers to vb2 in ERROR state */
-- 
2.51.0




