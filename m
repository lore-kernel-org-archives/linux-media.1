Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D152C175A74;
	Sun,  1 Mar 2026 01:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328004; cv=none; b=S68+adaL3+OIKpQI0ZrcmgoybpyGm2s8UMTGCYvbhRCz0emzQYL5KaJGOInUueqjGmqgNAgq/3+2k3EFMzuYzE47BxYboRO3slZBoV9yqfKjqLhGAVPM5i4kqBHOmoeKarecXkZlM+wGpDN31N03Aaf7PdjxiJHvK5R7YZ7kVDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328004; c=relaxed/simple;
	bh=s/Qt4b/Jw36h4vsbTTX5uvRhT5n2WTQ3PA7E6n/y53s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VglM4zSp7WYh2zzujdj6yzFw4qh0mS/xucEWp5d9FYOc2w7D790al05shTwvYQzJYtPvgJWDiZmXXrUIQvTASxthDZ3iwjQyuntIhSVzT7zt2yVAfZa9roF0LeBG4TWp4Va2w9Oo/KXKQkxUmAy4IX5G0gAUE8CrP87n79W7pBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=be06jI7M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="be06jI7M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40006C19425;
	Sun,  1 Mar 2026 01:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328004;
	bh=s/Qt4b/Jw36h4vsbTTX5uvRhT5n2WTQ3PA7E6n/y53s=;
	h=From:To:Cc:Subject:Date:From;
	b=be06jI7M9r9eTx2BVrJJRdMktwY3Qi7V51CA3IDiptH0E7QJKR6rYPtR5j7zAh2wJ
	 bis9fRZKvzjuTTeazNYf64Nn3zw7JKIiYisRSQPEFr52TZ/rSY95Z+OAjdaHtbuQzZ
	 m4H4pJaxmkqHfhNS5DRb/vQabnv3qlL2bBC8rxCbl5gwKBh+HG1ZacXAEgTQB81gCn
	 YF5kjpL+G6lNW85DFRx9No5gg69qwwNM2lqdjx+A+Ivg+9/+1j1KWglCEydSd9rJvS
	 uAckYd/ddBNl3xbOqBpxhmTygtRsizvEtl9c9BVK/ALiuUrp8C0XsSZUPPcnQG/NA4
	 R6QQZPHmzCSlQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	lihaoxiang@isrc.iscas.ac.cn
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: cx25821: Add missing unmap in snd_cx25821_hw_params()" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:20:02 -0500
Message-ID: <20260301012003.1675490-1-sashal@kernel.org>
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




