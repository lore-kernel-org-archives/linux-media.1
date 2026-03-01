Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E902594B9;
	Sun,  1 Mar 2026 02:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772330400; cv=none; b=AMrquaSWdZW39X22KXpxKPNRfRTlmKm83f7p4fF1lR1mVJm+bm0+nTES2rPAHVKgDQNqKYy/CBkndMoxBTDL9v4qPp8kdwgLr6jefTY6bC6QK9CgDPUX0ZccjzcyxjZ/mywcWIRq3lZFuNeivJSp5oZniR/FpVQCgmVUTdPtKyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772330400; c=relaxed/simple;
	bh=FRXnUlfWb578T7UKolXPSe7QPZQb5WkIJgrPvTLeevE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gjjQiurQRrnuGjLfX1oR+Zn8bbb4OzoaVDUl5KnDRwibGU+51i6RNMwMxhSR7NE69V9bgUBsOcTwH+g762oRTX1VOlWaSd6kffaphWa2V7CA2lTJ69wNrq3221TRuPliNih+EGF1Id2QjwPVbsDNYh5EiL30rHXcwGvmWzkpqKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M596Bups; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M596Bups"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6528C19421;
	Sun,  1 Mar 2026 01:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772330400;
	bh=FRXnUlfWb578T7UKolXPSe7QPZQb5WkIJgrPvTLeevE=;
	h=From:To:Cc:Subject:Date:From;
	b=M596BupsTh1a53TtnfLopJbmCUg+yP8RzIPq9LNFG8VcZKORMjO/vzivaUKWttuOU
	 3PROds610V4gA6LKC+kMJEEBdLiFdWKaAkTJ+siKd0l9iZfpeqLLmzSYPliyL/KvO9
	 YtPETZmYMO02NiZMI83ILCUrGM94O9exOQd+J6QAcjDEAmpfJyc8128QK6mAkJq8G+
	 RyFlS458L2hfoNT7oDHjuyC2wRvnfy9cyb4QJpIjxILc5NBUy48DSx1h2ZJZic6TGp
	 oYyjUPwWJwn12UvUhvd56HXBz8riJyY1oXXUmYoWRnn+FWIUvAyygANm6JGXNsmIua
	 mVQDf0dGsJEuA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	lihaoxiang@isrc.iscas.ac.cn
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: cx23885: Add missing unmap in snd_cx23885_hw_params()" failed to apply to 5.10-stable tree
Date: Sat, 28 Feb 2026 20:59:58 -0500
Message-ID: <20260301015958.1725903-1-sashal@kernel.org>
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




