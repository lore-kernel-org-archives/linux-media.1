Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FB6405F7;
	Thu, 25 Jun 2026 00:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782347516; cv=none; b=XWO/x5wy0i9x5yxRhZzrQvCZhzMB0M0H3WuCCGi50ZP+n/ZrcdwZUY2leoZ2PGhbPsBqPWrEfdo76DF5CBw5zVCRDDRFvfBPNIkf4togAgRv37Hee32QPEqiVS6c0a1r9IEL21Lx4z1jfIvJGvDUvtQ95x6fgfttrcVqxNsZVk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782347516; c=relaxed/simple;
	bh=N2M1g2vNY3/jb+YR1Dv5YUHD8HeW9Rvi52ndd2L7v5o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ERVnse7ap907gcg8cIco/TUf2RWkYBNly7eCidemhmGwEfKNgbf6DPoVQjI9tQ6w6gSWUlOxG2YE1uyCsAmbAy14WuJdj68hLs9AzXY1arF8vnIwG6zDSFhcUEsK/OC/n+EOOp8/SanWkVH08imLfFXNEBAHk1SEO07ZesFtod4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowAD3FNzwdjxq38vCFQ--.4340S2;
	Thu, 25 Jun 2026 08:31:44 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Bin Liu <bin.liu@mediatek.com>
Cc: pengpeng@iscas.ac.cn,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] media: mediatek: jpeg: retry HW selection after successful wait
Date: Thu, 25 Jun 2026 08:31:42 +0800
Message-ID: <20260625003142.99598-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAD3FNzwdjxq38vCFQ--.4340S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw45KF43tr48tFykGrWxWFg_yoW8XrW8pr
	ZxK3sFyrW8Krs0gr48A3W7ZFy5Aw1rCF4xWr13uw10yw1aqF47GryYka4SvFWxAr42ka43
	JF4Fv3yxArWjyFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
	xVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
	6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbGQ6J
	UUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

wait_event_interruptible_timeout() returns a positive value when the
condition becomes true before the timeout expires.

mtk_jpegdec_worker() treats every non-zero return value as a failure and
finishes the mem2mem job with an error.  A normal wakeup that indicates
that a decode engine is ready can therefore be handled as if all hardware
remained busy.

Only fail immediately on interrupted waits.  Keep the existing retry limit
for real timeouts, and retry hardware selection after a successful wait.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index d147ec483..391db77a6 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1697,7 +1697,7 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 		ret = wait_event_interruptible_timeout(jpeg->hw_wq,
 						       atomic_read(&jpeg->hw_rdy) > 0,
 						       MTK_JPEG_HW_TIMEOUT_MSEC);
-		if (ret != 0 || (i++ > MTK_JPEG_MAX_RETRY_TIME)) {
+		if (ret < 0 || (!ret && i++ > MTK_JPEG_MAX_RETRY_TIME)) {
 			dev_err(jpeg->dev, "%s : %d, all HW are busy\n",
 				__func__, __LINE__);
 			v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
-- 
2.50.1 (Apple Git-155)

