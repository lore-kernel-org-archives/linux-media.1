Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE93E3909B3;
	Tue, 17 Mar 2026 07:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773733110; cv=none; b=rN/7xDe/p8WtSk2THWlAR0Ne8Q9tWdtoq4NMrIkPL8TUoZdYjDQ/UwDZfPC7ezqOmCuOwYMAtTsMWzV2SFZcFWWguLXMPF8Pa1daq4bbjr7fxp+IGU7xFhzPxdUx6Vh7tNRPsXXJuDuv2ZNa1UHSFcVyhpJJlpDK1pIM/hHuTrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773733110; c=relaxed/simple;
	bh=132Vm35CBwtshbKyUUhSa7BWgnii/+ruE2wjkAm9B3E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ljlWlz2WUwBoirKhMQomvcUkXdVYY3tqlt+RtT4unxo+PNGz596+GR2AXdfukq+5mA72YsVmr+Rq3E/ljqDTZOtn1YHkxYkrfcBnD7f4PRL8NqhxwpY+V13F12TZq3h2jtdNdlxgih9OsISeJ/SEyqSNbiOUOs5Yyn8eWgKIEt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowAB3ktnjBLlpZ0_rCg--.6820S2;
	Tue, 17 Mar 2026 15:38:11 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil+cisco@kernel.org,
	laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	tomi.valkeinen+renesas@ideasonboard.com,
	kees@kernel.org,
	ethantidmore06@gmail.com,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH v3] media: v4l2-subdev: Fix error check in v4l2_subdev_get_frame_desc_passthrough()
Date: Tue, 17 Mar 2026 15:20:20 +0800
Message-Id: <20260317072020.3876151-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAB3ktnjBLlpZ0_rCg--.6820S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tw4fury8tFy7ArykWr45Jrb_yoW8CF4xpr
	W7KF4IkrWjqFy8Jan8X3W3Jas5Ja4FyFW7KrWfZwn7ZwnrtFWDtryIy345ZFyvk392qaya
	vFn8GrWxAFyFk3DanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9K14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_GF4l42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
	v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUYuWlDUUUU
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Use IS_ERR() and PTR_ERR() to properly handle the error return from
media_pad_remote_pad_unique(), which returns ERR_PTR() on failure but
never NULL. The previous code only checked for NULL, leading to invalid
pointer dereference.

Detected by Smatch:
drivers/media/v4l2-core/v4l2-subdev.c:2588 v4l2_subdev_get_frame_desc_passthrough() warn:
'remote_source_pad' is an error pointer or valid

drivers/media/v4l2-core/v4l2-subdev.c:2595 v4l2_subdev_get_frame_desc_passthrough() error:
'remote_source_pad' dereferencing possible ERR_PTR()

Fixes: a564839e630c ("media: subdev: Add v4l2_subdev_get_frame_desc_passthrough helper")
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
Changes in v3:
- Remove the Reported-by tag due to missing Closes: URL

Changes in v2:
- Added Smatch warning messages to commit message
- Added Reported-by tag for Ethan Tidmore
- Kept both Reviewed-by tags
---
 drivers/media/v4l2-core/v4l2-subdev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 9efd14d4026f..7cb17e0a5617 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2585,10 +2585,10 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 
 			if (!have_source_fd) {
 				remote_source_pad = media_pad_remote_pad_unique(local_sink_pad);
-				if (!remote_source_pad) {
+				if (IS_ERR(remote_source_pad)) {
 					dev_dbg(dev, "Failed to find remote pad for sink pad %u\n",
 						local_sink_pad->index);
-					ret = -EINVAL;
+					ret = PTR_ERR(remote_source_pad);
 					goto out_unlock;
 				}
 
-- 
2.25.1

