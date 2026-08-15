Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D750319F12D;
	Sat, 15 Aug 2026 13:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786801800; cv=none; b=mDyUTgfAxp+duUa8ck0wueX9GlmsokisxcbaJUZNm26f/MUwromCUP9zwq8iq+unwEZtdIfMmaewhrIlezP7G02eVp6yuEdJtrfogooFxvRAe70QIgytislBiZcJ2hDmuH61WQUzGC45b4ZfMNlxnDXqARcYE+JNY+2NgwgieqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786801800; c=relaxed/simple;
	bh=5iVMPfyPIa0PD0vhwArW2LoqYCpaucvot5dTTs/K8kQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XXer1lP+nxQNoUG4Egz5OAVkEfxh9/Ly8BffQJNFfH6IiwNLWue9WZ5V4mO6sMJpnXcVRRXqBtbq2p6ZCJF1dqiiv+yVi71ujED+sdDMaDs7vvO28LCJOlk1+rtSayJqPO/IFM838xv8St2vVid3ki/TZc09GJKg/pjpURQWU/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-05 (Coremail) with SMTP id zQCowADnUDt9boBqQGPRBQ--.3894S2;
	Sat, 15 Aug 2026 21:49:50 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: bin.liu@mediatek.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Irui Wang <irui.wang@mediatek.com>,
	Kyrie Wu <kyrie.wu@mediatek.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3] media: mediatek: jpeg: retry HW selection after successful wait
Date: Sat, 15 Aug 2026 21:49:49 +0800
Message-ID: <20260815134949.49042-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowADnUDt9boBqQGPRBQ--.3894S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw4rWFW8ury5ury8XFykuFg_yoW5JFW5pr
	WYg39I9rW8KrsFgrW8Aa17ZFy5Gr1rCF4xGrn8Zw4xA3yaqF1DJw1UAa40qFWxAr12kay3
	JF1Fg393AFWjyFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r
	4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
	BIdaVFxhVjvjDU0xZFpf9x0JUL0edUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

wait_event_interruptible_timeout() returns a positive value when its
condition becomes true before the timeout. mtk_jpegdec_worker() treats
every nonzero result as a failure, so a normal decoder wakeup finishes
the mem2mem job as though no hardware became available.

Handle interrupted waits and exhausted timeout retries separately, and
retry hardware selection after a successful wakeup. Increment the retry
count only for actual timeouts. The encoder uses
wait_event_interruptible(), whose successful return is zero, so its
existing check is correct; leave that separate no-timeout policy
unchanged.

Fixes: dedc21500334 ("media: mtk-jpegdec: add jpeg decode worker interface")
Assisted-by: Codex:gpt-5
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v2:
https://lore.kernel.org/all/20260720115322.89784-1-pengpeng@iscas.ac.cn/
- add the Fixes tag
- revalidate the decoder-only change against current mainline
- add the required coding-assistant attribution

Changes since v1:
https://lore.kernel.org/all/20260625003142.99598-1-pengpeng@iscas.ac.cn/
- split interrupted waits, timeout exhaustion and successful wakeups
- use distinct diagnostics and explain why the encoder path is unchanged

 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index d147ec483081..9634c95aaada 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1697,9 +1697,15 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 		ret = wait_event_interruptible_timeout(jpeg->hw_wq,
 						       atomic_read(&jpeg->hw_rdy) > 0,
 						       MTK_JPEG_HW_TIMEOUT_MSEC);
-		if (ret != 0 || (i++ > MTK_JPEG_MAX_RETRY_TIME)) {
-			dev_err(jpeg->dev, "%s : %d, all HW are busy\n",
-				__func__, __LINE__);
+		if (ret < 0) {
+			dev_err(jpeg->dev, "decoder HW wait interrupted: %d\n",
+				ret);
+			v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
+			return;
+		}
+
+		if (!ret && i++ > MTK_JPEG_MAX_RETRY_TIME) {
+			dev_err(jpeg->dev, "all decoder HW are busy\n");
 			v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
 			return;
 		}

base-commit: dac3e89a2c90c2feeb471e1f22a2512ad424b792
-- 
2.50.1 (Apple Git-155)

