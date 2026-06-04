Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804F523C4FF;
	Thu,  4 Jun 2026 01:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780537637; cv=none; b=uUApgsTHFZGV+DksZz1hYIJrRkP8uc6N8I7VP5lTDafh6bYqT8nVjaB5DyozxAnGik8u3wLz/b0jFHRkTNRxDRHokAhjPSV4jf5djaHghr5IJD34woh2sluzpYpLP/39k801NMR5GvgueyH0KnkMP8fa5IXr3jzHHldABD/ZTLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780537637; c=relaxed/simple;
	bh=4xgyvBIOmbLVG7eaVom2WisxF9n1TESHP+9UuNTwfvg=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=M/zyrqYIkau9/wNLkzXIH0QTQr0qWwBRM5QELAL26tLZ4SMw8PX45QzpVKEYetubER0by4h5vWJlMp9OI0QS5EegAqYYSWW8qWsu5yW/TUST8G7FQjJcow/LUiheeALK6pdy4Yk1Gw4EshTw5bZLSLUEd61dQgA3uQB5v/VxZJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=DHOMgz3e; arc=none smtp.client-ip=162.62.57.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="DHOMgz3e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1780537629;
	bh=jMdruyl19ILCzvY8RIzWv2z4ZGWBG4fLoqrLFN4OQ08=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DHOMgz3eKmQhlLuc7RPys/UtldzxkQn1SR9s5Uajff3A2wNYGdfj5Kiny2YrnziQe
	 ImVAyaNGhDX7hc/lf/oT4TQ42tVfK2QFYkWVC2sM7OOUbB5Kvu1u5qGRl/ZK6FqSMA
	 s2HA6JgyGGhiHK5kkvV40HU3i//yKXvilLj0A4v4=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id BC7BA658; Thu, 04 Jun 2026 09:47:07 +0800
X-QQ-mid: xmsmtpt1780537627tqhpjbu0i
Message-ID: <tencent_B85DFB2210B877A85021C1BC064E70E61C09@qq.com>
X-QQ-XMAILINFO: OIJV+wUmQOUA8Lfzu29TBIX7DH5nnvXzfyECyV8cHx1IBUuKVs3939LCvxBB6U
	 lUqQekjewpvtB2ImsnnOr/SwlrIks4toTs5YUGFKCHYR4LByCg+OaB6yMUMVF9Foeufqu0bqdpkO
	 velWfaTnU8PUtxMnW2QZxYFyk/69uiF7gVuh9NT/fqeTjrgSVyS7aD156kAmmCASzkeJZaNRklfx
	 yO2aEBN7wvERB8kZV2YgyqVK2s1C3vyM/wUgdZEJ6UQ6y9n6CUb6q6MufeOiMbboBrVKDMMqS1lr
	 2xxIRUsOTGB0ExJLBjE/7JoNnxbA7Tn+eTc9F6PTIhFO5mCIIqL03PUrUAcOD3WHUuHZ76NMPhkj
	 GwPx/+jlp08aeuD84QZpXfnCiuyP8Kw5/hYbZryIpCgs7cXaIJIHFEqacA/UzbTyoYqmwHcnR/0y
	 4IsujtxYRPv6MDALSeqc2mcVAAhDA0ScK5EjlAjf+HwX7GJLQkFGhRn5iwSeKl9uNcFwJa3Z/IaZ
	 WxJJuEa+/z1g/G75zUpFMJFjkBcPjPpk0mYwwHgvmE+3OzyyGaEUc0/IPQbsgBwKwJGbXSrYhliP
	 oK42gSu10YyjoHrQnmyVBbGB1f3cY9KnNe20zTTTwB/zu83SdeDmJ0+uP/U0nnvOp/Z7v7hJI4gO
	 H0uOkuMlzLkSvaIyxDDPNBQcdPUXRLfndLKqV3C1DDddDp/QHYcPZvI7xAokjR5tQokZXr9NCTrf
	 NSK9fsD9GOrXoJBlhtBOlNPhUvytYP1NAfVsuO7tqORMK8xKEattuZNMvo00ajW6XV2RXoKRJRee
	 t3o0JCmkuJcqMvSxofmKMLgc0Af7y4mt4O5bpFEXe9GJYUIluLtTClu/AWeU9UWCS49lPVXtGoRe
	 oukLdNTHOt634C0UeeSd1aIWPbfyKbvdEg9TdXdT0uwSscbT0e03uiOmUM6Z+GVtVDFp8FNsZbvC
	 PfykrhvIH401DY+jpTixofm74AFLgrXd0Tb8fL5+mZmTHND+OIsg5SFxxvZ1nUXrVrw34bKo2n3x
	 zEeb0WI+ZdYWSbbcXghRkLt0hNYgeDqzPbOzuM1YaU3w7kP7Nf
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: xiaopeitux@foxmail.com
To: shuangpeng.kernel@gmail.com,
	mchehab+huawei@kernel.org,
	hverkuil+cisco@kernel.org
Cc: isely@pobox.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH] media: usb: pvrusb2: fix slab-use-after-free in pvr2_v4l2_dev_init
Date: Thu,  4 Jun 2026 09:47:06 +0800
X-OQ-MSGID: <2a53abd5e76d10b171966a9cd50c733a3606121a.1780537415.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <6C2D160B-37DD-40F0-B8A2-089B8CAACB58@gmail.com>
References: <6C2D160B-37DD-40F0-B8A2-089B8CAACB58@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pei Xiao <xiaopei01@kylinos.cn>

The driver attempts to register the same video_device twice if the first
registration with a specific minor number fails. However, when the first
video_register_device() call fails, the underlying device structure is
released via put_device(), which frees the video_device object. The second
call then uses the already freed pointer, causing a KASAN
slab-use-after-free error.

Moreover, the second call always uses -1 (automatic minor allocation),
which is redundant because mindevnum already can be -1 when no fixed
minor is requested. Keeping both calls does not provide any benefit but
introduces a use-after-free vulnerability.

Fix this by removing the second registration attempt and using only
the first call with mindevnum. This preserves the ability to request
a specific minor number (when mindevnum >= 0) while falling back to
automatic allocation (when mindevnum == -1) without double-registering
the same device.

Logs:
BUG: KASAN: slab-use-after-free in pvr2_v4l2_dev_init
(drivers/media/usb/pvrusb2/pvrusb2-v4l2.c:1221)
Read of size 4 at addr ffff88810a2aa4b4 by task pvrusb2-context/2009

Call Trace:
 dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
 print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
 kasan_report (mm/kasan/report.c:595)
 pvr2_v4l2_dev_init (drivers/media/usb/pvrusb2/pvrusb2-v4l2.c:1221)
 pvr2_v4l2_create (drivers/media/usb/pvrusb2/pvrusb2-v4l2.c:1249)
 pvr_setup_attach (drivers/media/usb/pvrusb2/pvrusb2-main.c:40)
 ...

Freed by task 2009 on cpu 1 at 594.064509s:
 kasan_save_track (mm/kasan/common.c:57 mm/kasan/common.c:78)
 kasan_save_free_info (mm/kasan/generic.c:584)
 __kasan_slab_free (mm/kasan/common.c:253 mm/kasan/common.c:285)
 kfree
 v4l2_device_release (drivers/media/v4l2-core/v4l2-dev.c:225)
 device_release (drivers/gpu/drm/vkms/vkms_configfs.c:690)
 kobject_put
 __video_register_device (drivers/media/v4l2-core/v4l2-dev.c:1080)
 pvr2_v4l2_dev_init (drivers/media/usb/pvrusb2/pvrusb2-v4l2.c:1218)
 pvr2_v4l2_create (drivers/media/usb/pvrusb2/pvrusb2-v4l2.c:1249)
 pvr_setup_attach (drivers/media/usb/pvrusb2/pvrusb2-main.c:40)
 ...

Fixes: 0c0d06cac63e ("[media] rename most media/video usb drivers to media/usb")
Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
Closes: https://lore.kernel.org/lkml/6C2D160B-37DD-40F0-B8A2-089B8CAACB58@gmail.com/
stable@vger.kernel.org
Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
index 101b2e9fbaab..f9df813ca09b 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
@@ -1215,13 +1215,10 @@ static void pvr2_v4l2_dev_init(struct pvr2_v4l2_dev *dip,
 		mindevnum = nr_ptr[unit_number];
 	}
 	pvr2_hdw_set_v4l2_dev(hdw, &dip->devbase);
-	if ((video_register_device(&dip->devbase,
-				   dip->v4l_type, mindevnum) < 0) &&
-	    (video_register_device(&dip->devbase,
-				   dip->v4l_type, -1) < 0)) {
+	if (video_register_device(&dip->devbase,
+				   dip->v4l_type, mindevnum) < 0)
 		pr_err(KBUILD_MODNAME
 			": Failed to register pvrusb2 v4l device\n");
-	}
 
 	pr_info("pvrusb2: registered device %s [%s]\n",
 	       video_device_node_name(&dip->devbase),
-- 
2.25.1

