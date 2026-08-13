Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276064854EE;
	Thu, 13 Aug 2026 15:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786633836; cv=none; b=JRQucfvyt6SGufPqccS3zvb25Vq+h+88a8Oh4iC7mCDGs/pRiBYZwvR37qAFoKa4OkftHKvMwefx/ERLx4XElybfbXLSmiiDOF891IEpFmn18h5IG+bUrIifutGGBwkm/gySwVUKxMtUr191oAof5C8zVGKKFy58SPRHhuNbjsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786633836; c=relaxed/simple;
	bh=oM+EkXnRjuBi6sDIJKHB1huiIIMR8smV3OiVL03eDsw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hw0h+veAvNBLQIEaq3BG6E/LZ/TGTNXGIBFWWspBz5Af1RUi+EExqfaBlXcH+s/5BdXq86ZNUxw/UVrJ8YZe2GKmBjDNVFbIU9YMZgTxGo7TSI0nwFrvCnUHHriewSk3vhtTN8SzO+vp5BV5Eo8Rw9q5yk3YmfPgICuupCayYpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowAAH3fC_3H1qcL54BQ--.42757S2;
	Thu, 13 Aug 2026 23:03:28 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: or51211: validate firmware size before fixed-offset copies
Date: Thu, 13 Aug 2026 23:02:53 +0800
Message-ID: <20260813150327.12934-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAAH3fC_3H1qcL54BQ--.42757S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WFWDuF1UtF1kZr43CF4UArb_yoW8AF4UpF
	4jvFWjqayUKw4ftFykC347Cas8Wws5XFW5Kry5AayvvryS9ryxXryUG34Yq345JFn3Ja42
	qanxAryxAFZrAw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyq14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48J
	MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfU5WlkUUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

or51211_load_firmware() copies bytes 0 through 392 into its staging
buffer, then uploads 8125 bytes starting at offset 393. The second copy
therefore reaches byte 8517, but the firmware size is not checked before
either fixed-offset access.

Define the minimum layout size and reject shorter firmware before the
first access.

Assisted-by: Codex:gpt-5
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1: https://lore.kernel.org/all/2026063009052493.5-ccfa108-0048-media-or51211-validate-firm-pengpeng@iscas.ac.cn/
- name the minimum fixed firmware layout size
- explain the first and last bytes consumed by the loader
- rebase on current media sources
- disclose the use of Codex

The fixed extents were reviewed statically. The short-firmware path was
not exercised on OR51211 hardware.

 drivers/media/dvb-frontends/or51211.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/dvb-frontends/or51211.c b/drivers/media/dvb-frontends/or51211.c
index 8c4aabef2d99..22f802c4e9fb 100644
--- a/drivers/media/dvb-frontends/or51211.c
+++ b/drivers/media/dvb-frontends/or51211.c
@@ -17,6 +17,7 @@
  * or /lib/firmware (depending on configuration of firmware hotplug).
  */
 #define OR51211_DEFAULT_FIRMWARE "dvb-fe-or51211.fw"
+#define OR51211_FIRMWARE_MIN_SIZE (393 + 8125)
 
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -99,6 +100,9 @@ static int or51211_load_firmware (struct dvb_frontend* fe,
 
 	dprintk("Firmware is %zu bytes\n", fw->size);
 
+	if (fw->size < OR51211_FIRMWARE_MIN_SIZE)
+		return -EINVAL;
+
 	/* Get eprom data */
 	tudata[0] = 17;
 	if (i2c_writebytes(state,0x50,tudata,1)) {
-- 
2.50.1 (Apple Git-155)

