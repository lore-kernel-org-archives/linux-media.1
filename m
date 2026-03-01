Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA842E541E;
	Sun,  1 Mar 2026 02:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772330402; cv=none; b=EPQx1rwxW+R9Ms4AJq0uR0UXiPfo2D7lYjZDqwxghGkyPbXV3cfVnJecLVUGazYl46NwbA6tg8W5intlpFXtyEEwGTi0SR/txCved5hRkjJPtaE2ICRgUW7gChB/qyzNSFPb4z/PwGwR5RU1MgvDyIJRH85pWu5il9y4c3DWzVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772330402; c=relaxed/simple;
	bh=EJkB55+oD/HVc2gEpWd20k2zP0v8o5RtcmIZM7FcGJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EmVZbO9NRkwhGsGa3Lm8STmlDaeBfxOixK6O1osNBaFcvhrMcrI71hCl0ISty2T1JtSXO103b2N2AGFpEVxHrzk9AU6N8c5jwQm34XApcHkQbt4KLm4lAKgM8fZWbQk67f/7dLv81It60Ril+uUmXVdLg9LRgaZimo/DSo1Uj0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dGIYd8UT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dGIYd8UT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01529C19421;
	Sun,  1 Mar 2026 02:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772330402;
	bh=EJkB55+oD/HVc2gEpWd20k2zP0v8o5RtcmIZM7FcGJM=;
	h=From:To:Cc:Subject:Date:From;
	b=dGIYd8UTLSQq0AOUY6auU85Z+7ywyCZmlk9Q83W/MyU+gZNXVWrKCzRJTfb0WvYiV
	 5tTfMdjjYyhe8G/aFXjj675c4sPuSpEtMWBKDPUzSKPFIURSfYps32ee6NOCWU+C6n
	 lbU7qvLZLxXEX/lXFFYskjRON9dYsaKAOeLBLsqdBl0qzkfPVTq4Thnt90Beeq71qe
	 wMlMBSLXSInCo21JdLFqOHMvY74e/ThWQsohq4ZfvRmBUfmcDZwBf6XErroEpKnCyR
	 yBw0eTJ/n+i5BVoJopmnK/haQ+mxqn2Rw6fZfKFAaJqBRcdGsotFpavy9AAI0RKbWH
	 EQkFaL858/2bw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	lihaoxiang@isrc.iscas.ac.cn
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: cx88: Add missing unmap in snd_cx88_hw_params()" failed to apply to 5.10-stable tree
Date: Sat, 28 Feb 2026 21:00:00 -0500
Message-ID: <20260301020000.1725952-1-sashal@kernel.org>
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

The patch below does not apply to the 5.10-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From dbc527d980f7ba8559de38f8c1e4158c71a78915 Mon Sep 17 00:00:00 2001
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Date: Wed, 10 Dec 2025 10:53:48 +0800
Subject: [PATCH] media: cx88: Add missing unmap in snd_cx88_hw_params()

In error path, add cx88_alsa_dma_unmap() to release
resource acquired by cx88_alsa_dma_map().

Fixes: b2c75abde0de ("[media] cx88: drop videobuf abuse in cx88-alsa")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/pci/cx88/cx88-alsa.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/cx88/cx88-alsa.c b/drivers/media/pci/cx88/cx88-alsa.c
index 29fb1311e4434..4e574d8390b4d 100644
--- a/drivers/media/pci/cx88/cx88-alsa.c
+++ b/drivers/media/pci/cx88/cx88-alsa.c
@@ -483,8 +483,10 @@ static int snd_cx88_hw_params(struct snd_pcm_substream *substream,
 
 	ret = cx88_risc_databuffer(chip->pci, &buf->risc, buf->sglist,
 				   chip->period_size, chip->num_periods, 1);
-	if (ret < 0)
+	if (ret < 0) {
+		cx88_alsa_dma_unmap(chip);
 		goto error;
+	}
 
 	/* Loop back to start of program */
 	buf->risc.jmp[0] = cpu_to_le32(RISC_JUMP | RISC_IRQ1 | RISC_CNT_INC);
-- 
2.51.0




