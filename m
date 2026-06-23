Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE8B3A9636;
	Tue, 23 Jun 2026 06:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782195027; cv=none; b=jSlDjZg8i6+BC0Yv0G+nfiImHD0CrSNJr3PVud+HehZAZJfVmkNjOXE/yZFn41kcW5irfA3b6h4YxZuE69LjnMF8N60HaJd/jA+vD9nQDJcvgnRN9PROwHtLHr7MUONjpYYRpdnA2nwu6cqDcLeLd/4o36bp4nZlegflJJrbLpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782195027; c=relaxed/simple;
	bh=MnXLzfOH5NtVMoG3oUrijFajimjOnPfibV5JFuQux5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KBHqZKxpb1oGgo7coLaf3kiDJ/GLd+5s34/rhldbhujzG46P4gXdTVbr8SpNia9mDXWCPL89b2cJg68OK//xpeUgjEzjLzWIJKGTydzpLGa/24YaiwhyneA9QJuq24ror7U3tes7fKFOUqTnovjdTaEGlelVOF6UktP8Uh7f/o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowACnCt5OIzpqEgbKFA--.53062S2;
	Tue, 23 Jun 2026 14:10:22 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Tommaso Merciai <tomm.merciai@gmail.com>,
	Martin Hecht <mhecht73@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] media: i2c: alvium: propagate write handshake timeouts
Date: Tue, 23 Jun 2026 14:09:41 +0800
Message-ID: <20260623060942.30029-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowACnCt5OIzpqEgbKFA--.53062S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww4rKF17Kr18Aw43Wr1fXrb_yoW8uF1kpr
	Wa9F98AryDJas7tF1ktw1UAFyrGrZ3tay7Zrs2ya1rZan8Grn5JFyUKas0qw1rXa4xGr4I
	v390gFWjyFW5JrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkE14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_
	Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUxcT
	PUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

alvium_write_hshake() waits for the BCRM write handshake bit to become
set and then clear again, but it ignores the return value from
read_poll_timeout(). A timeout therefore leaves ret unchanged and the
caller can observe a successful register write even though the handshake
did not complete.

Assign the polling helper return value to ret for both handshake phases
so timeouts and low-level read errors are propagated to the V4L2 control
caller.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/media/i2c/alvium-csi2.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/alvium-csi2.c b/drivers/media/i2c/alvium-csi2.c
index dd991c2ee700..9ebb2a92199a 100644
--- a/drivers/media/i2c/alvium-csi2.c
+++ b/drivers/media/i2c/alvium-csi2.c
@@ -352,11 +352,11 @@ static int alvium_write_hshake(struct alvium_dev *alvium, u32 reg, u64 val)
 	}
 
 	/* poll handshake bit since bit0 = 1 */
-	read_poll_timeout(alvium_read, hshake_bit,
-			  ((hshake_bit & BCRM_HANDSHAKE_W_DONE_EN_BIT) == 1),
-			  15000, 45000, true,
-			  alvium, REG_BCRM_WRITE_HANDSHAKE_RW,
-			  &hshake_bit, &ret);
+	ret = read_poll_timeout(alvium_read, hshake_bit,
+				((hshake_bit & BCRM_HANDSHAKE_W_DONE_EN_BIT) == 1),
+				15000, 45000, true,
+				alvium, REG_BCRM_WRITE_HANDSHAKE_RW,
+				&hshake_bit, &ret);
 	if (ret) {
 		dev_err(dev, "poll bit[0] = 1, hshake reg fail\n");
 		return ret;
@@ -370,11 +370,11 @@ static int alvium_write_hshake(struct alvium_dev *alvium, u32 reg, u64 val)
 	}
 
 	/* poll handshake bit since bit0 = 0 */
-	read_poll_timeout(alvium_read, hshake_bit,
-			  ((hshake_bit & BCRM_HANDSHAKE_W_DONE_EN_BIT) == 0),
-			  15000, 45000, true,
-			  alvium, REG_BCRM_WRITE_HANDSHAKE_RW,
-			  &hshake_bit, &ret);
+	ret = read_poll_timeout(alvium_read, hshake_bit,
+				((hshake_bit & BCRM_HANDSHAKE_W_DONE_EN_BIT) == 0),
+				15000, 45000, true,
+				alvium, REG_BCRM_WRITE_HANDSHAKE_RW,
+				&hshake_bit, &ret);
 	if (ret) {
 		dev_err(dev, "poll bit[0] = 0, hshake reg fail\n");
 		return ret;
-- 
2.50.1 (Apple Git-155)

