Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C416D406821;
	Mon, 20 Jul 2026 11:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784548412; cv=none; b=KWkPuKHMiD1GOFtoJdKj5Ev/FeEeVzzdf37pYcF8lHAeX6jkbtCMnE8Xw7whDx5M04sdbpRKErPxCNnDdIYUsSSBDvEDFpzzbe223bJbm4xYTTIMtMmYnfR+IOSoqagjk0U01XFR7MZIqOjE22mJ8u6wNiI77DyrtevmGUSaLjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784548412; c=relaxed/simple;
	bh=+H9sxZgfPoUdVnrA+kHpYFMwzNmVsSsPCq/V5Ez2gs0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=iR8QgkSwnq4U5WXHGOcMCPdU/HpVfaIN/MuHCidNqdj60mhiWTevuTjCTMYctpl7U3peHO28lq7Iek0UJasNqCRvMaAFzkCJ7RyRqkTAJgOUt88ornsZ3rFR9zPfHCUeMf2Ej2yGFKV5jV6EdY1N1LXzoiGZnr/lzcJ6qsj9abg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowADHND8yDF5qtcmIAA--.52459S2;
	Mon, 20 Jul 2026 19:53:22 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Bin Liu <bin.liu@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v2] media: mediatek: jpeg: retry HW selection after successful wait
Date: Mon, 20 Jul 2026 19:53:22 +0800
Message-ID: <20260720115322.89784-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowADHND8yDF5qtcmIAA--.52459S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw4rWFyftryxJF1fXFyftFb_yoW8ZFWxpr
	W5K39IvrW8Gr4qgr48Aa1UAF15Gw1rCa1xWrnxZw48ArsIqF1Dt3WUta48tFyxAFy2ka45
	JF1FvayfCrW2yFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8Jw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjfUOuc_DUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

wait_event_interruptible_timeout() returns a positive value when its
condition becomes true before timeout. mtk_jpegdec_worker() treats every
nonzero result as failure, so a normal decoder wakeup can finish the
mem2mem job as though no hardware became available.

Handle an interrupted wait and exhausted timeout retries separately, and
retry hardware selection after a successful wakeup. The encoder uses
wait_event_interruptible(), whose successful return is zero, so this change
does not alter its separate no-timeout waiting policy.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1: https://lore.kernel.org/all/20260625003142.99598-1-pengpeng@iscas.ac.cn/
- split interrupted waits, timeout exhaustion and successful wakeups
- use distinct diagnostics and explain why the encoder path is outside this
  fix
- rebase onto v7.2-rc4

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

