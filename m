Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B4432D7F1;
	Wed, 27 May 2026 02:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779848649; cv=none; b=Bsc/DipmJ6z/fHndm5na+xKXbVgWqtSffr0WAgsh/ITkDRPV9xvWa6UuUu1NfcC6SyVjM8Ln3gxeXUFxtw1GYvEgQdijddT2brEQtEucz9fEX0osomCRdw/vweL7E6YZXKQExPWtFCkOFSWGHdKvaznVrGxrn8QavzmJP2138sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779848649; c=relaxed/simple;
	bh=T+YnW2GWxrjOFRHp7zajPkbikAV165zb5SodWyKFO+A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=omznSHOWz9NuD1V2cxGUgW6LY5wWdhZbGlUJ/vFJ3Y3giPe3CrUR2BuE1MtIMR+lM3hqx21rgZ4Ii/fe6rQywXyCjGSH12hWf+ndtJLw4tEZDeabk2J2k8yr5fTq2B/WNy8QhkU3vk0KDR/A1Cwt6ZreEUAjCIe8YnWa6YZjX2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from localhost.localdomain (unknown [36.112.3.223])
	by APP-05 (Coremail) with SMTP id zQCowAD3XOC7VRZqJveEEQ--.11828S2;
	Wed, 27 May 2026 10:23:55 +0800 (CST)
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
To: p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Subject: [PATCH] media: coda: destroy vdoa context on coda_open() error paths
Date: Wed, 27 May 2026 10:23:53 +0800
Message-Id: <20260527022353.2069271-1-lihaoxiang@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAD3XOC7VRZqJveEEQ--.11828S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jr1fCFWrAr4kGF4rCw45Wrg_yoWfXFc_ua
	109FsrZFy0y3s3Cr12yF1ru348ArZ5urs5Ja4Sgry3A34DJw45Xr1jvFZ8Zw4UXF42yF9F
	9398W34UCFnrujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbckFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_
	Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Jr0_Gr
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_JF0_
	Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUSNtxUUUUU=
X-CM-SenderInfo: 5olkt0x0ld0ww6lv2u4olvutnvoduhdfq/1tbiCREAE2oWPLld2AAAs3

vdoa context is not released in the error path. Call
vdoa_context_destroy() to do the cleanup.

Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
---
 drivers/media/platform/chips-media/coda/coda-common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/drivers/media/platform/chips-media/coda/coda-common.c
index 33f712ff8556..bdc597781e6c 100644
--- a/drivers/media/platform/chips-media/coda/coda-common.c
+++ b/drivers/media/platform/chips-media/coda/coda-common.c
@@ -2721,6 +2721,8 @@ static int coda_open(struct file *file)
 err_clk_enable:
 	pm_runtime_put_sync(dev->dev);
 err_pm_get:
+	if (ctx->vdoa)
+		vdoa_context_destroy(ctx->vdoa);
 	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 err_coda_name_init:
-- 
2.25.1

