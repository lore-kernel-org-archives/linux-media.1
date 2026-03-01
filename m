Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65ADD2C158A;
	Sun,  1 Mar 2026 01:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328717; cv=none; b=M9mm+p3wXiQ9sHDLhJcqkx+4epYXTE2kLQVQ9tvPy0Pl3MHkt7WAGp2f9VgW02ToWKWxiQ0E7+i+2eQIYaYySA6sqW7A9N0fbt3JLYAz3VNJgOmZt3pEIuk/lau23HE2ypkgWiZtHr9BeniLdxcpVZ6xKgJ2wQ24ju6At2bApqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328717; c=relaxed/simple;
	bh=BFfoRRcB2ga15niLMhiME3ZpksJa22GqBuTmmIZwG/A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LpT5qBdlAmdbo7HmsO4PVqOXiMajKXYSPOqBzIeWL1RdcRNCmuO+QtyLRYjc2ulcui7QREujdGCXTMjsPtaCfPXpW2zK0cy2q6S6y2ASIDb2p68nWTdISlBPyZDZYHW1AL5GzwVougzBAMFL47nkewRvmJzHJpWVJzri/3VaxIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OEWCTrnJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OEWCTrnJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6C71C19421;
	Sun,  1 Mar 2026 01:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328717;
	bh=BFfoRRcB2ga15niLMhiME3ZpksJa22GqBuTmmIZwG/A=;
	h=From:To:Cc:Subject:Date:From;
	b=OEWCTrnJIDeETPndQXC+WDi8qqLCYccoGcxx+zJcl4Xo5OKJidCU942kX2UBEQEVC
	 xzhmjaA/oXlBhPQBqptRM+2IHbQ5gAruM7Ylh/iz67t9duSwPhQ3RPLL1P9DbBT0Wx
	 AHO0SzDSVnV0FleVBm54e16EcE/UY/c2d2Uv/QYw/Pi00kQ2ynUk4C0x3QKw+/zatV
	 dkDExfmlKkxLHU5mygYozrKPfWH7fX0rsxz1ipbvX3iR9+3PFfUUagT/RwJtojfgW/
	 3d9sPH4NP0PGvZkJsz3VHdtDmnpLTwioLfeMNCykKmcDDpH1ZL8yDrEZuk7rhuu9vY
	 W+iMrqT+zAizw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	lihaoxiang@isrc.iscas.ac.cn
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: cx25821: Add missing unmap in snd_cx25821_hw_params()" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:31:55 -0500
Message-ID: <20260301013155.1690651-1-sashal@kernel.org>
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

The patch below does not apply to the 6.6-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 863f50d583445c3c8b28a0fc4bb9c18fd9656f41 Mon Sep 17 00:00:00 2001
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Date: Wed, 10 Dec 2025 16:52:30 +0800
Subject: [PATCH] media: cx25821: Add missing unmap in snd_cx25821_hw_params()

In error path, add cx25821_alsa_dma_unmap() to release the
resource acquired by cx25821_alsa_dma_map()

Fixes: 8d8e6d6005de ("[media] cx28521: drop videobuf abuse in cx25821-alsa")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/pci/cx25821/cx25821-alsa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/pci/cx25821/cx25821-alsa.c b/drivers/media/pci/cx25821/cx25821-alsa.c
index a42f0c03a7ca8..f463365163b7e 100644
--- a/drivers/media/pci/cx25821/cx25821-alsa.c
+++ b/drivers/media/pci/cx25821/cx25821-alsa.c
@@ -535,6 +535,7 @@ static int snd_cx25821_hw_params(struct snd_pcm_substream *substream,
 			chip->period_size, chip->num_periods, 1);
 	if (ret < 0) {
 		pr_info("DEBUG: ERROR after cx25821_risc_databuffer_audio()\n");
+		cx25821_alsa_dma_unmap(chip);
 		goto error;
 	}
 
-- 
2.51.0




