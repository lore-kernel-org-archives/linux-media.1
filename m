Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788F327281D;
	Sun,  1 Mar 2026 01:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329778; cv=none; b=N32ISYpYGLH+IRLo5IwhRzD5vuqqWH4M1mAFJ9x5uW/G2QBqiu4BrIB/vBz0WEfbn+paWMRsTtUiFsgcpBlDMqnWPNWnRZ21HPK+WKeJuiz8UZ26KqwgtV1UTFtoh/A+eJKitbaHFxRPq/9mrMsbXZcL7aak7B+ajVa3B5WqoNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329778; c=relaxed/simple;
	bh=re0IQyuJ4aBlYlGdlqT/CpehxkwJ3AE/y0VywT8EeRA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IZk4Ym2PbLAmVFMiFUFjrUJMF5Ei6I4xn5gNzyL8kCr4waw2eECW0DZAEboZj885U95MP0Aqg6y6Z2vmw3NeglYHmdS6TlvlOvru8PNeqA9y7i+FvbuX13hmr0iuRg2lSfNAhAxfJmvgLUWdJ2wli/e5Mw2AxXvqZEWxMAk9CuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CZ6W0mIh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CZ6W0mIh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98DE9C19421;
	Sun,  1 Mar 2026 01:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329778;
	bh=re0IQyuJ4aBlYlGdlqT/CpehxkwJ3AE/y0VywT8EeRA=;
	h=From:To:Cc:Subject:Date:From;
	b=CZ6W0mIhd/Z+RIfY5kRvKn3xFAiZmBxAZ1xFlFYlNFPHHZ1Qhcweng/CSYNByzayp
	 VYl0f7MVmpYJTJVRu2Yhe5q0YXxsUTy/hXp44bN5FKJM2xJoiUtCzZxk1JTliGohTg
	 7Tt2Gk8GoSYig7ARRIr8ANmonabmpvmkQfjQKQM/DmC4Wqk1X07UQjiyF9EWWsx4Is
	 QbHvFsYLbJx7QhSTQxpR2ndaPaVE8Tl1ts9sE210pfw6Sf+ImB+t6/eJVMxub6o6CG
	 YTDilgYc5PfzM1JHYUqvflFoqlGvCgN0lPyUGO3k5zIF1k/W1aQO9PKRiXCA76nQJ2
	 /egG0ZP1EcI4Q==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	lihaoxiang@isrc.iscas.ac.cn
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: cx23885: Add missing unmap in snd_cx23885_hw_params()" failed to apply to 5.15-stable tree
Date: Sat, 28 Feb 2026 20:49:36 -0500
Message-ID: <20260301014936.1714163-1-sashal@kernel.org>
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

The patch below does not apply to the 5.15-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 141c81849fab2ad4d6e3fdaff7cbaa873e8b5eb2 Mon Sep 17 00:00:00 2001
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Date: Wed, 10 Dec 2025 11:02:17 +0800
Subject: [PATCH] media: cx23885: Add missing unmap in snd_cx23885_hw_params()

In error path, add cx23885_alsa_dma_unmap() to release the
resource acquired by cx23885_alsa_dma_map().

Fixes: 9529a4b0cf49 ("[media] cx23885: drop videobuf abuse in cx23885-alsa")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/pci/cx23885/cx23885-alsa.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/cx23885/cx23885-alsa.c b/drivers/media/pci/cx23885/cx23885-alsa.c
index 25dc8d4dc5b73..717fc6c9ef21f 100644
--- a/drivers/media/pci/cx23885/cx23885-alsa.c
+++ b/drivers/media/pci/cx23885/cx23885-alsa.c
@@ -392,8 +392,10 @@ static int snd_cx23885_hw_params(struct snd_pcm_substream *substream,
 
 	ret = cx23885_risc_databuffer(chip->pci, &buf->risc, buf->sglist,
 				   chip->period_size, chip->num_periods, 1);
-	if (ret < 0)
+	if (ret < 0) {
+		cx23885_alsa_dma_unmap(chip);
 		goto error;
+	}
 
 	/* Loop back to start of program */
 	buf->risc.jmp[0] = cpu_to_le32(RISC_JUMP|RISC_IRQ1|RISC_CNT_INC);
-- 
2.51.0




