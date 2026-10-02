Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A178432304
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 19:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790970630; cv=none; b=E2N8Nwn+r8FOv+mabQ4fDIzn+llLJAxwkNAxkiHN94mUsVEjPWwodIlgnUIcjMyOSW4HQMBo2q7aWCaktWJHjW3fs9MvIM+xCOxJy4CqbAH/rTFZG83ZSDOBF1CjN00vj1u4YScF//Wm7pY1fPMmf0S201Xf1IB3Cbl3nEyCwx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790970630; c=relaxed/simple;
	bh=jPry0ZxZWH2qI0ULrUX+JCx/FGm9iZZhCbMohyCfLZI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E80bg48x06ifrk9O/BEcp060mBczhvOa9CCB6pJQfNC7EuuZdZgwVtu4DXEkMMB+PNKspoGd83TiivEJkx5v5LmRWxhimPB/Bf8VZ5qaB1Ewaq541NHeIe5/UV9u2ezny8Efpyb0kfnOgPOfhH0Emo3SR5M17Wp/2yY9uFJw/a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=iPKS0/3n; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="iPKS0/3n"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-144f79153f5so485584c88.0
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 12:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790970621; x=1791575421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c+Pr+0S1JlOBX/miOeDu7Q4SuyRTaEP5yuhanTP5lUc=;
        b=iPKS0/3nt/yps11kzkBCV1f6JgZy+m9nq1oaXe/hF3tlSfPFM5dO+uLlr672/tPl91
         m9ScaGSftrqg4nbbGN1R6CwSxYW/9uqbTwVzBIebRSuHRb3uzuiBWFiNLgshSye7VMM1
         p7sNOnQkyr3gmXnPxJYvA5CZQ2GdZ6juSUqdXrPqxxhwQnT3vhX/l+lC4AmwcRrgIyuD
         p/s9Rzf6BbtVe/mcrZLVa/Wp+wyjaczK0QndkgwvoxTcCf8NqcvVFsK2GLI1oQBCAOP9
         wzEAY851Ypjv6I4EXUGWwkdFQNFIehnSOClh5y72uqmDFaN+F9+cHRh6wsPWaLVYLgyI
         Mchw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790970621; x=1791575421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c+Pr+0S1JlOBX/miOeDu7Q4SuyRTaEP5yuhanTP5lUc=;
        b=2bNBQPUPwV+q+AgJBnkKeb7kQ5zo2xAGulFKlTEdWCD2cbTvNBFe93GBm92kI3SJEP
         vkCN6AfsEFoGAoLuDgGyVm8egxQxLmpR5osIXz7A3OL4M3+RxvoNebFGHg/btMPyupFW
         4xoUKkFTHs3V2Na7/hxcl9ISaZLmmtI3v5MGJWj6lzYrGTTJxQkZYiX4K4lo5LOggqU5
         uggWpdnqIPdVoudvoLn1trZbbTgNPoHn0au3beSLNk+lMemDqjlEpokWlRbnDv7ikC0k
         xbTD1S4+tHJzsHO8q3lI6rTZps73LZrXWP+jTgs/6A/t/v1oVKEGu9NSZUnarFc8Iff7
         XC8w==
X-Forwarded-Encrypted: i=1; AKwUvBzP8oRSWsV4Vs6tyqwDLiMT9TI5ZO0nuldl/0fJ+CYN/TdFR5aXr8ymFPAFiMI4oOJJyB6CgSwCksfrfQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mmfH5ilLGlYD14JFKThiYE9RDlGXZ5PWtwAWgYWjwkq6ZmUUll
	geZQIaSFXjzyjGds+BDnzWWbyo/j15jXtNEwxBEVm11EnaaYEk78i5NunmeTjU3DRxs=
X-Gm-Gg: AYBFou1fm5DeozrJnQHNIHG3oq1Y1tV+PwnRGLAEPjhXs9bk9zM0cieDGkJjtsT026C
	7xTo6PldDWwTMAFRt1JIY4+bNUJ6zeWRQEoJomKz+Z71uWMT0RTKejMNOeX7O+yKl16pVw85Yuq
	eGh/J95DazLjp0dMnETjA/JzVU6VOiu0cFukqYLQvVr51zD0Dtrk/OT1FdTmAPbDZkM+Fj3Enyr
	4cUjwYwdtpmaISgqn23d3tDLgDqO1IW5XILUT7eWRCws5CK/aeLUNDGGD6lsRy3VPjcfE3WfGWc
	ntqyX1Q4ndkvBtAWLHQ8w5VyVpshr1+9y8yRyg1IcIRrpTNtDi7BHjtFql1KUw2kI7KIlj9tP2z
	SjZ5EWibBplb3Ab5WOOsAgmWNRr4HL+olfCA0roQlQ40ll0QG3bGPhfNuqwGn/RRJr44o7jTwwB
	JB0ZKUhYpuE8zVQscZbjdq2l26jBkhvDEX/NHSmYnpOWKWSXqbpHrWWbe9ogpgt4P1muiW3ViHO
	ZQSxLgNLMRt/RigyiBca5bU0RmZ2FLImrYcL8+SK4WpaLLKbJrx4Ted66ppYgax0cJEQdg=
X-Received: by 2002:a05:7022:1587:b0:148:516e:53e with SMTP id a92af1059eb24-14dd07fbc16mr9332303c88.6.1790970620487;
        Fri, 02 Oct 2026 12:50:20 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:bcf9:6140:24a9:d1e7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f410725e2sm7157041c88.0.2026.10.02.12.50.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 02 Oct 2026 12:50:20 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6.1.y] media: av7110: fix a spectre vulnerability
Date: Fri,  2 Oct 2026 15:50:15 -0400
Message-ID: <20261002195016.21386-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

[ Upstream commit 458ea1c0be991573ec436aa0afa23baacfae101a ]

As warned by smatch:
	drivers/staging/media/av7110/av7110_ca.c:270 dvb_ca_ioctl() warn: potential spectre issue 'av7110->ci_slot' [w] (local cap)

There is a spectre-related vulnerability at the code. Fix it.

[ Backport to 6.1.y: added the explicit linux/nospec.h include required
  by the older source. ]

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi Greg, Sasha, and media av7110 maintainers,

I am working through the small CVE backports still missing from 6.1.y.
This one addresses CVE-2024-50289. It masks the validated CI-slot index
before using it in the av7110 array lookup.

The corresponding 6.6.y backport is already in the 6.6.y stable queue.
The fix is already present in 6.12.y, 6.18.y, and 7.2.y, but not
in 6.1.y.
The target-specific adjustment is recorded in the bracketed note above.

Could you please queue it for 6.1.y?

CVE: CVE-2024-50289
Upstream: 458ea1c0be991573ec436aa0afa23baacfae101a

AI assistance: An LLM helped identify, adapt, and validate this backport; I
reviewed the resulting code and validation evidence.

Thanks,
Artem Dinaburg

 .../media/deprecated/saa7146/av7110/av7110.h  |  4 ++-
 .../deprecated/saa7146/av7110/av7110_ca.c     | 26 +++++++++++++------
 2 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/deprecated/saa7146/av7110/av7110.h b/drivers/staging/media/deprecated/saa7146/av7110/av7110.h
index 9fde69b38f1ce3..c2956c23d9c1e4 100644
--- a/drivers/staging/media/deprecated/saa7146/av7110/av7110.h
+++ b/drivers/staging/media/deprecated/saa7146/av7110/av7110.h
@@ -86,6 +86,8 @@ struct infrared {
 	u32			ir_config;
 };
 
+#define MAX_CI_SLOTS	2
+
 /* place to store all the necessary device information */
 struct av7110 {
 
@@ -166,7 +168,7 @@ struct av7110 {
 
 	/* CA */
 
-	struct ca_slot_info	ci_slot[2];
+	struct ca_slot_info	ci_slot[MAX_CI_SLOTS];
 
 	enum av7110_video_mode	vidmode;
 	struct dmxdev		dmxdev;
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/av7110_ca.c b/drivers/staging/media/deprecated/saa7146/av7110/av7110_ca.c
index c1338e074a3dc1..642af03fbac810 100644
--- a/drivers/staging/media/deprecated/saa7146/av7110/av7110_ca.c
+++ b/drivers/staging/media/deprecated/saa7146/av7110/av7110_ca.c
@@ -12,6 +12,7 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/nospec.h>
 #include <linux/types.h>
 #include <linux/delay.h>
 #include <linux/fs.h>
@@ -26,23 +27,28 @@
 
 void CI_handle(struct av7110 *av7110, u8 *data, u16 len)
 {
+	unsigned slot_num;
+
 	dprintk(8, "av7110:%p\n",av7110);
 
 	if (len < 3)
 		return;
 	switch (data[0]) {
 	case CI_MSG_CI_INFO:
-		if (data[2] != 1 && data[2] != 2)
+		if (data[2] != 1 && data[2] != MAX_CI_SLOTS)
 			break;
+
+		slot_num = array_index_nospec(data[2] - 1, MAX_CI_SLOTS);
+
 		switch (data[1]) {
 		case 0:
-			av7110->ci_slot[data[2] - 1].flags = 0;
+			av7110->ci_slot[slot_num].flags = 0;
 			break;
 		case 1:
-			av7110->ci_slot[data[2] - 1].flags |= CA_CI_MODULE_PRESENT;
+			av7110->ci_slot[slot_num].flags |= CA_CI_MODULE_PRESENT;
 			break;
 		case 2:
-			av7110->ci_slot[data[2] - 1].flags |= CA_CI_MODULE_READY;
+			av7110->ci_slot[slot_num].flags |= CA_CI_MODULE_READY;
 			break;
 		}
 		break;
@@ -264,15 +270,19 @@ static int dvb_ca_ioctl(struct file *file, unsigned int cmd, void *parg)
 	case CA_GET_SLOT_INFO:
 	{
 		struct ca_slot_info *info=(struct ca_slot_info *)parg;
+		unsigned int slot_num;
 
 		if (info->num < 0 || info->num > 1) {
 			mutex_unlock(&av7110->ioctl_mutex);
 			return -EINVAL;
 		}
-		av7110->ci_slot[info->num].num = info->num;
-		av7110->ci_slot[info->num].type = FW_CI_LL_SUPPORT(av7110->arm_app) ?
-							CA_CI_LINK : CA_CI;
-		memcpy(info, &av7110->ci_slot[info->num], sizeof(struct ca_slot_info));
+		slot_num = array_index_nospec(info->num, MAX_CI_SLOTS);
+
+		av7110->ci_slot[slot_num].num = info->num;
+		av7110->ci_slot[slot_num].type = FW_CI_LL_SUPPORT(av7110->arm_app) ?
+						 CA_CI_LINK : CA_CI;
+		memcpy(info, &av7110->ci_slot[slot_num],
+		       sizeof(struct ca_slot_info));
 		break;
 	}
 
-- 
2.39.5

