Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A3D1E98E3;
	Sat,  4 Jul 2026 01:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783127720; cv=none; b=hGdh4o2WpLo15OANhjJ350WZoYAGN9r5FciBa2kQZM40F/MLHTPQc2vAUCoOw030vRWvDOxnCyFigKnDUlWFLoC86TAd/wJezOH17LjTLQ0bQniRz3mk9hiWU1uymxOZ5x7APnjWvKgQ8KXEXoNzWXl2bgF46Q9LQrymLKE88s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783127720; c=relaxed/simple;
	bh=/y4lAqE0lhao9y53dEWi22cZehOru7NHPH8S8U7x4TU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hnSFLR1sFJ2+wSIlXvh6gmMMU4eGlVBP+wqN7h1f0Havst2VO4FsvgMeLmAugVq/Y+XtIclLEPtYw0ip9C0b4XFwAn0daL2Z6jSsuSNYtbrrBrFIotCrrL93By6vB7ovidGPFPng2ss93RxyUlbv5eSnM7WBbuveffvEHXEpMUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowACn+cyjXkhqqr3EFg--.57416S2;
	Sat, 04 Jul 2026 09:15:15 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Malcolm Priestley <tvboxspy@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] media: lmedm04: bound I2C transfer buffers
Date: Sat,  4 Jul 2026 09:15:13 +0800
Message-ID: <20260704011513.60356-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowACn+cyjXkhqqr3EFg--.57416S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJrWfAry7CrWrZr13Cw13twb_yoW8WF1Dpa
	yagrWxKry5Jrn7WFnrWw45ZFyrG393tayUC3yxWw18Grnayr15GayUKa42vr4UGryxAryU
	tr15XF98WFsFyr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvj14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AF
	wI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1D
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
	JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUez
	VbDUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

lme2510_i2c_xfer() stages I2C transfers in fixed 64-byte obuf and
ibuf arrays.  It copies caller-provided write bytes into obuf and
copies read replies from ibuf without checking that the requested I2C
message lengths fit those staging buffers.

Reject write and read lengths that exceed the local USB command and
reply buffers before copying to or from them.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/media/usb/dvb-usb-v2/lmedm04.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

--- a/drivers/media/usb/dvb-usb-v2/lmedm04.c
+++ b/drivers/media/usb/dvb-usb-v2/lmedm04.c
@@ -499,6 +499,7 @@
 	struct lme2510_state *st = d->priv;
 	static u8 obuf[64], ibuf[64];
 	int i, read, read_o;
+	int ret = -EINVAL;
 	u16 len;
 	u8 gate;
 
@@ -522,22 +523,29 @@
 		obuf[2] = msg[i].addr << 1;
 
 		if (read) {
-			if (read_o)
+			if (read_o) {
+				if (msg[i].len > sizeof(ibuf) - 1)
+					goto unlock;
 				len = 3;
-			else {
+			} else {
+				if (msg[i].len > sizeof(obuf) - 4 ||
+				    msg[i + 1].len > sizeof(ibuf) - 1)
+					goto unlock;
 				memcpy(&obuf[3], msg[i].buf, msg[i].len);
 				obuf[msg[i].len+3] = msg[i+1].len;
 				len = msg[i].len+4;
 			}
 		} else {
+			if (msg[i].len > sizeof(obuf) - 3)
+				goto unlock;
 			memcpy(&obuf[3], msg[i].buf, msg[i].len);
 			len = msg[i].len+3;
 		}
 
 		if (lme2510_msg(d, obuf, len, ibuf, 64) < 0) {
 			deb_info(1, "i2c transfer failed.");
-			mutex_unlock(&d->i2c_mutex);
-			return -EAGAIN;
+			ret = -EAGAIN;
+			goto unlock;
 		}
 
 		if (read) {
@@ -550,8 +558,11 @@
 		}
 	}
 
+	ret = i;
+
+unlock:
 	mutex_unlock(&d->i2c_mutex);
-	return i;
+	return ret;
 }
 
 static u32 lme2510_i2c_func(struct i2c_adapter *adapter)

