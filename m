Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782EF3438B5;
	Sun, 16 Aug 2026 05:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786857550; cv=none; b=BAKDaLJlyQfd5nB9osphmML2XKiMpXyxDB/et1NltN6cL6oBfqt7Wqt4qm/8l4j2CpG12OfN0koD2Vk3J+Qemye+N8c6FRtJLUJPrq9+gSkcrf/QBDehz20ygEpL44Se3npIt57ruF9H69IZw/b+YrgjOseKgkWc4loZDaXpfSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786857550; c=relaxed/simple;
	bh=ohIE386wEoVcyWRElFwmsTJ5xap98ikabxyZuY/5C0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BMvI1/zNdgpwhTFixwmOhn4zL3pfpxhACXxWnumDGjJ90aiRBtz3x2bu6xZ5lom+AckRDRGCoUk0SMog55PVjBaSS5vlFl3w/JQywh1HEZfZibfZjCOVf5GHy2rFU/0X6j1yTK/ZCDvUNv5qlpMn8a3/BMoER58YSFNT8OLVmC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-03 (Coremail) with SMTP id rQCowAAHET88SIFqUjeMBQ--.5585S2;
	Sun, 16 Aug 2026 13:18:53 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: coda: validate firmware payload before copying
Date: Sun, 16 Aug 2026 13:18:49 +0800
Message-ID: <20260816051851.3712-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAAHET88SIFqUjeMBQ--.5585S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAw4rGrW5ZFWxAFW3uFW7Arb_yoWrtF13pa
	y5Kay2yFW5Cr1Yyr1xAw47AFy5uws5JFWUGFW7CFn7C34Dtr1kX34DtFyjqryrCrWIg3W3
	uFsaqFnxAFnF9FJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
	xVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1l
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
	6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUjuHq7
	UUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

coda_copy_firmware() accepts an optional 16-byte MX header, but moves the
source pointer without reducing the remaining size.  The pre-reordered path
then copies the original size from the advanced pointer, reading 16 bytes
past the firmware allocation.  The native-order path always subtracts 16
from the size, including for images without the header, and can truncate or
underflow the payload length.  The function also probes and reads words
without first proving their alignment and extent.

Track the payload pointer and length together.  Validate the optional
header, opcode, word alignment, and paired-word requirement before copying.
Use unaligned little-endian accessors and stop hardware initialization when
the firmware layout is invalid.

Fixes: a1a87fa3a0cf ("[media] coda: add support for native order firmware files with Freescale header")
Assisted-by: Codex:gpt-5
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1:
- use unaligned little-endian accessors instead of typed firmware casts
- validate the optional header before probing the first payload opcode
- validate both native and pre-reordered payload extents
- report an invalid image instead of continuing hardware initialization

v1: https://lore.kernel.org/all/20260706092922.79898-1-pengpeng@iscas.ac.cn/

Validation:
- scripts/checkpatch.pl --no-tree --strict: clean
- git diff --check: clean
- manual source-level audit of every read and copy in coda_copy_firmware()

 .../media/platform/chips-media/coda/coda-common.c  | 61 ++++++++++++++++------
 1 file changed, 45 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/drivers/media/platform/chips-media/coda/coda-common.c
index be37ea568bfe5..18311b60cc285 100644
--- a/drivers/media/platform/chips-media/coda/coda-common.c
+++ b/drivers/media/platform/chips-media/coda/coda-common.c
@@ -24,6 +24,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
+#include <linux/unaligned.h>
 #include <linux/videodev2.h>
 #include <linux/ratelimit.h>
 #include <linux/reset.h>
@@ -2927,36 +2928,60 @@ static int coda_register_device(struct coda_dev *dev, int i)
 	return ret;
 }
 
-static void coda_copy_firmware(struct coda_dev *dev, const u8 * const buf,
-			       size_t size)
+static int coda_copy_firmware(struct coda_dev *dev, const u8 *buf,
+			      size_t size)
 {
-	u32 *src = (u32 *)buf;
+	u32 *dst = dev->codebuf.vaddr;
+	size_t words, i;
+	u32 first, second;
 
 	/* Check if the firmware has a 16-byte Freescale header, skip it */
-	if (buf[0] == 'M' && buf[1] == 'X')
-		src += 4;
+	if (size < 2)
+		return -EINVAL;
+
+	if (buf[0] == 'M' && buf[1] == 'X') {
+		if (size < 16)
+			return -EINVAL;
+
+		buf += 16;
+		size -= 16;
+	}
+
+	if (size < sizeof(__le16))
+		return -EINVAL;
+
 	/*
 	 * Check whether the firmware is in native order or pre-reordered for
 	 * memory access. The first instruction opcode always is 0xe40e.
 	 */
-	if (__le16_to_cpup((__le16 *)src) == 0xe40e) {
-		u32 *dst = dev->codebuf.vaddr;
-		int i;
-
+	if (get_unaligned_le16(buf) == 0xe40e) {
 		/* Firmware in native order, reorder while copying */
+		if (size % sizeof(u32))
+			return -EINVAL;
+
+		words = size / sizeof(u32);
 		if (dev->devtype->product == CODA_DX6) {
-			for (i = 0; i < (size - 16) / 4; i++)
-				dst[i] = (src[i] << 16) | (src[i] >> 16);
+			for (i = 0; i < words; i++) {
+				first = get_unaligned_le32(buf + i * sizeof(u32));
+				dst[i] = (first << 16) | (first >> 16);
+			}
 		} else {
-			for (i = 0; i < (size - 16) / 4; i += 2) {
-				dst[i] = (src[i + 1] << 16) | (src[i + 1] >> 16);
-				dst[i + 1] = (src[i] << 16) | (src[i] >> 16);
+			if (words % 2)
+				return -EINVAL;
+
+			for (i = 0; i < words; i += 2) {
+				first = get_unaligned_le32(buf + i * sizeof(u32));
+				second = get_unaligned_le32(buf + (i + 1) * sizeof(u32));
+				dst[i] = (second << 16) | (second >> 16);
+				dst[i + 1] = (first << 16) | (first >> 16);
 			}
 		}
 	} else {
 		/* Copy the already reordered firmware image */
-		memcpy(dev->codebuf.vaddr, src, size);
+		memcpy(dev->codebuf.vaddr, buf, size);
 	}
+
+	return 0;
 }
 
 static void coda_fw_callback(const struct firmware *fw, void *context);
@@ -3007,8 +3032,12 @@ static void coda_fw_callback(const struct firmware *fw, void *context)
 	if (ret < 0)
 		goto put_pm;
 
-	coda_copy_firmware(dev, fw->data, fw->size);
+	ret = coda_copy_firmware(dev, fw->data, fw->size);
 	release_firmware(fw);
+	if (ret) {
+		v4l2_err(&dev->v4l2_dev, "invalid firmware image\n");
+		goto put_pm;
+	}
 
 	ret = coda_hw_init(dev);
 	if (ret < 0) {

base-commit: 4900cad020c0580dfb1be27776ff10a4ef110cfa
-- 
2.50.1

