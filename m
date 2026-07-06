Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAA630566A;
	Mon,  6 Jul 2026 09:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330173; cv=none; b=A7FiQplEjnw8CIwpLE+DbAq1ifhOJYFycdKGpo7JkitBIplSrXJEDMaAVKUngjYz9QEwtPDY+VAfWjabNWBDFEaDy3Hp1ltGwXKvPWI0YK2YO9vocgFA1n5AmUynU6jz3nz5h8doUjdWsJrSceNRUwItgLUmqxAncfOPTFawCLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330173; c=relaxed/simple;
	bh=1e22EgFuynAFCghybext3aiNUMj8eZNh4vHSEI80y7w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CTlfw1PznnLIUkpVAzAEyMi4+hyraFDVOMRX5maL7oMzngtaK3EsHLmAC99ulTT4lAqr9uHvWA5jc6tfUhqi9hhXpcBmJqMqhMF6EKErRt8c8/Kt6hEEZCxks0m2gaJrNmlUxpxOFgborgeKECMn74lw0jLUHBbZE/Qnrtwr90Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-01 (Coremail) with SMTP id qwCowABnB9BzdUtqem7xBA--.48785S2;
	Mon, 06 Jul 2026 17:29:23 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: coda: validate firmware payload bounds
Date: Mon,  6 Jul 2026 17:29:22 +0800
Message-ID: <20260706092922.79898-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowABnB9BzdUtqem7xBA--.48785S2
X-Coremail-Antispam: 1UD129KBjvJXoWxur1rtr45WF1xGw13urW3ZFb_yoW5Ar4kpa
	y5Kay2yFW3Wr4FvF18Aw4UGay5Wrn5JFW7KFy7uas7C3sIkr1kXryDta4j9F4xGryIy345
	CFn2qr4UJFsF9FJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkE14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_
	Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU2Q6
	JUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

coda_copy_firmware() accepts firmware images with an optional Freescale
header and then copies or reorders the payload.

Track the payload length after skipping the optional header. Reject
malformed native-order firmware payloads, and propagate the error so
hardware initialization does not continue with an invalid code buffer.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 .../platform/chips-media/coda/coda-common.c   | 43 ++++++++++++++-----
 1 file changed, 33 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/drivers/media/platform/chips-media/coda/coda-common.c
index be37ea568bfe..357bd9cdbfc6 100644
--- a/drivers/media/platform/chips-media/coda/coda-common.c
+++ b/drivers/media/platform/chips-media/coda/coda-common.c
@@ -2927,36 +2927,57 @@ static int coda_register_device(struct coda_dev *dev, int i)
 	return ret;
 }
 
-static void coda_copy_firmware(struct coda_dev *dev, const u8 * const buf,
-			       size_t size)
+static int coda_copy_firmware(struct coda_dev *dev, const u8 * const buf,
+			      size_t size)
 {
-	u32 *src = (u32 *)buf;
+	const u8 *payload = buf;
+	size_t payload_size = size;
+	const u32 *src;
+
+	if (size < sizeof(__le16))
+		return -EINVAL;
 
 	/* Check if the firmware has a 16-byte Freescale header, skip it */
-	if (buf[0] == 'M' && buf[1] == 'X')
-		src += 4;
+	if (buf[0] == 'M' && buf[1] == 'X') {
+		if (size < 16 + sizeof(__le16))
+			return -EINVAL;
+
+		payload += 16;
+		payload_size -= 16;
+	}
+
+	src = (const u32 *)payload;
 	/*
 	 * Check whether the firmware is in native order or pre-reordered for
 	 * memory access. The first instruction opcode always is 0xe40e.
 	 */
-	if (__le16_to_cpup((__le16 *)src) == 0xe40e) {
+	if (__le16_to_cpup((__le16 *)payload) == 0xe40e) {
+		size_t words = payload_size / sizeof(u32);
 		u32 *dst = dev->codebuf.vaddr;
 		int i;
 
+		if (payload_size % sizeof(u32))
+			return -EINVAL;
+
 		/* Firmware in native order, reorder while copying */
 		if (dev->devtype->product == CODA_DX6) {
-			for (i = 0; i < (size - 16) / 4; i++)
+			for (i = 0; i < words; i++)
 				dst[i] = (src[i] << 16) | (src[i] >> 16);
 		} else {
-			for (i = 0; i < (size - 16) / 4; i += 2) {
+			if (words % 2)
+				return -EINVAL;
+
+			for (i = 0; i < words; i += 2) {
 				dst[i] = (src[i + 1] << 16) | (src[i + 1] >> 16);
 				dst[i + 1] = (src[i] << 16) | (src[i] >> 16);
 			}
 		}
 	} else {
 		/* Copy the already reordered firmware image */
-		memcpy(dev->codebuf.vaddr, src, size);
+		memcpy(dev->codebuf.vaddr, payload, payload_size);
 	}
+
+	return 0;
 }
 
 static void coda_fw_callback(const struct firmware *fw, void *context);
@@ -3007,8 +3028,10 @@ static void coda_fw_callback(const struct firmware *fw, void *context)
 	if (ret < 0)
 		goto put_pm;
 
-	coda_copy_firmware(dev, fw->data, fw->size);
+	ret = coda_copy_firmware(dev, fw->data, fw->size);
 	release_firmware(fw);
+	if (ret < 0)
+		goto put_pm;
 
 	ret = coda_hw_init(dev);
 	if (ret < 0) {
-- 
2.43.0

