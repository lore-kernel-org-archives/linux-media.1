Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD04190664;
	Sun,  1 Mar 2026 01:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329271; cv=none; b=SelihEe/pcJF0JqtyovHcKeePOma4b/juUuwZeUtTBHWEYmxc6zMUHiJw6oOQjoEdY2Wf2R6ad6d6i/xyf3ZLhazp59GU5CdHiIFE0JIPpdncjq1CHXaL59P3nsTv6XoTlLyDR4SKn84NKnrFJlDxN62UEi3iNFeSdKKReJ4zuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329271; c=relaxed/simple;
	bh=isQvSzoDFKhPehd6IiGm7dZ9hna45SYsFpdhtIRB9/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CUZw6SMhO6OZMqJfirxDjBPMv31NapRcMsXmxZMXeerKHngotme09a1ptA4nleb+hwrmvK5od6ROMr8rit2g58At12kyjyQ5581Sfjd+IuqWrJrm75iWZb3T912V5Pr+4RVJbTPqM6LyO7Zc/wdf9TWhEu8OAEZJG4yiUQ/9JDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T4vPU/8U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T4vPU/8U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 110DFC19425;
	Sun,  1 Mar 2026 01:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329271;
	bh=isQvSzoDFKhPehd6IiGm7dZ9hna45SYsFpdhtIRB9/g=;
	h=From:To:Cc:Subject:Date:From;
	b=T4vPU/8UjPwrB1H/e1jc59qjVrX7dKhgk4Ruop+FbYnIeGPw+kJBWxJFxfziiprFj
	 sLpKROtnrZCBUK4OFv0mhQ57sGxRRUr2tNz5pqcDqvkWEYWFV6wwooGS1TH4Ai2JqL
	 MnKbopGtT5UBADKk4xyhsJAgO4axDp8InumFKutT+86LzZ+1DMuJH5+yfcUctlPkOs
	 lJ822Q1HfWcG7PXFk+aAQmRVM+uuYFhI+6NDv6uCMdVlz5SaPtiEhAXOXYz1LM4AH0
	 6u3TzeG8A6NrbDr8Gl1cBjXAxTOGe5kZYOcelVq7omfiSMss9G8skRen1UGpSXjGPO
	 JBPcZD8IcsjOQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	lihaoxiang@isrc.iscas.ac.cn
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: cx23885: Add missing unmap in snd_cx23885_hw_params()" failed to apply to 6.1-stable tree
Date: Sat, 28 Feb 2026 20:41:09 -0500
Message-ID: <20260301014109.1702673-1-sashal@kernel.org>
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

The patch below does not apply to the 6.1-stable tree.
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




