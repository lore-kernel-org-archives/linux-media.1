Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D2042BE81;
	Fri, 14 Aug 2026 07:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786694375; cv=none; b=BAibmZuKoI6MWp2ZS7CXfaLsMR7N1VNGB9xoG6ZQkMa/E7v7Cw5X+EQV9EtdQsizoXW+U3dSSN/W8nIz+hdTKKWGU0i0NQvTVgq5uluYZNvBIK5bMLquv3QJN7u4V07Ov/sbnOxQHNlZC4wmVsLchGnmKU7Lyk/nGjMPMgax69E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786694375; c=relaxed/simple;
	bh=dAhc2S743KGWg5RJveLY6djOgql/0jClFmLscSVJe0g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qEYKZIXE0xxWaiDes7p8H10Poo/ebAHImZXSA4YAHP8KdapNwxrzpmbjdWxxCpxgFo7ZdP7FZa5A7BZuodaGOlO/5VwkvknlhcdSU70h6m3v0FjGSsWllvnFyD/mXrXZdu10BT/T6h4LdNys7CGzAWCSt7SQzzm43LvI5SLdvW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowABXK+_iyn5qZKOeBQ--.62715S2;
	Fri, 14 Aug 2026 15:59:30 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Malcolm Priestley <tvboxspy@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v2] media: lmedm04: bound I2C staging buffers
Date: Fri, 14 Aug 2026 15:59:29 +0800
Message-ID: <20260814075929.20478-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowABXK+_iyn5qZKOeBQ--.62715S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWFWkKFyrGr13Xr43XrWDJwb_yoW5AF17pa
	ya9rWagr1UJFnF9Fs8Ar45Xa15G3yfta4xK3yfWw1SgFn2vr1Yqa48KrWjkF4rGryxAr17
	JrsYvFWDGFZFyr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkE14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
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

lme2510_i2c_xfer() stages protocol requests and replies in fixed
64-byte buffers. It writes protocol header bytes and copies caller data
before proving that the complete request fits, and it can copy an
oversized read response from the input buffer.

Validate the read-only, write-then-read and write-only message lengths
against their distinct protocol header costs before touching the staging
buffers.

Fixes: d2f918bba7a4 ("V4L/DVB: Support or LME2510(C) DM04/QQBOX USB DVB-S BOXES")
Assisted-by: Codex:gpt-5
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1: https://lore.kernel.org/all/20260704011513.60356-1-pengpeng@iscas.ac.cn/
- move validation before protocol-header writes
- use distinct read-only, write-read and write-only size limits
- rebase on current media sources

The three I2C protocol layouts were reviewed statically; no LME2510
hardware test was performed.

 drivers/media/usb/dvb-usb-v2/lmedm04.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/lmedm04.c b/drivers/media/usb/dvb-usb-v2/lmedm04.c
index 05c18b6de5c6..9fd60e257a9b 100644
--- a/drivers/media/usb/dvb-usb-v2/lmedm04.c
+++ b/drivers/media/usb/dvb-usb-v2/lmedm04.c
@@ -499,6 +499,7 @@ static int lme2510_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 	struct lme2510_state *st = d->priv;
 	static u8 obuf[64], ibuf[64];
 	int i, read, read_o;
+	int ret = -EINVAL;
 	u16 len;
 	u8 gate;
 
@@ -508,6 +509,17 @@ static int lme2510_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 		read_o = msg[i].flags & I2C_M_RD;
 		read = i + 1 < num && msg[i + 1].flags & I2C_M_RD;
 		read |= read_o;
+		if (read_o) {
+			if (msg[i].len > sizeof(ibuf) - 1)
+				goto unlock;
+		} else if (read) {
+			if (msg[i].len > sizeof(obuf) - 4 ||
+			    msg[i + 1].len > sizeof(ibuf) - 1)
+				goto unlock;
+		} else if (msg[i].len > sizeof(obuf) - 3) {
+			goto unlock;
+		}
+
 		gate = (msg[i].addr == st->i2c_tuner_addr)
 			? (read)	? st->i2c_tuner_gate_r
 					: st->i2c_tuner_gate_w
@@ -522,9 +534,9 @@ static int lme2510_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 		obuf[2] = msg[i].addr << 1;
 
 		if (read) {
-			if (read_o)
+			if (read_o) {
 				len = 3;
-			else {
+			} else {
 				memcpy(&obuf[3], msg[i].buf, msg[i].len);
 				obuf[msg[i].len+3] = msg[i+1].len;
 				len = msg[i].len+4;
@@ -536,8 +548,8 @@ static int lme2510_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 
 		if (lme2510_msg(d, obuf, len, ibuf, 64) < 0) {
 			deb_info(1, "i2c transfer failed.");
-			mutex_unlock(&d->i2c_mutex);
-			return -EAGAIN;
+			ret = -EAGAIN;
+			goto unlock;
 		}
 
 		if (read) {
@@ -550,8 +562,11 @@ static int lme2510_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[],
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
-- 
2.50.1 (Apple Git-155)

