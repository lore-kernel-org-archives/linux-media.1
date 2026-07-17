Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6AF3B7759;
	Fri, 17 Jul 2026 09:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784280282; cv=none; b=Tk1kxdc9Mp9A+3qlb+1PlR6BBqel99aOohxP5ZjP8+DllzjMGLGGame4Ol7kmXmnJKdgycD31uC87nPYahBN6HufkFf6S3FcRLXmoTZ9GwRD7d5Iv6gZYoyx21R5DL7Tup71pb6eX85n2dkRaPSXmr4SBNKiTQhIegKm50auDMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784280282; c=relaxed/simple;
	bh=CIPSG0CaUgmOlruu7RaA2DOFloxd6kWgRAxnchYib1Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Sm+nSnJDaZOsjC49w77Ah2jdCwnt0f8z+jX5ws7YEyQ0KJLnlDc61vC0G8u7Bp4dG8UXg9DwADd95pj6rdikwXGPLGBsoj9UYvHUdhzl0kWA2yg/KsOl+Exv+WOch4Q5/9ktVlHLhMVf+Ovj46pyNx7c6zASMf4tWt/d5/MEHuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=fXrDLb7U; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="fXrDLb7U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=d4
	x7N8v0CZw3BDWZoCpoQUvCoAcvyZ1Xe2Q4+Uv/0cI=; b=fXrDLb7UvAqCrwZJF8
	aZTH8+DvqnDxGMm4G0QMeVRHUkv4aSJwO0tZhJ2oYzvP0KSFYHVinsEcWtv/oef9
	8PA7Y6L7EU24qReOHwSyHxyqF/CoEG826Ik5QMoup/YvJ+G4hZc3giX/aJX96b85
	0XtvsqGrIir07f7iHQ5Vj5M4I=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgCnESG+9Flq5w+gHg--.17942S5;
	Fri, 17 Jul 2026 17:24:21 +0800 (CST)
From: Lei Huang <huanglei814@163.com>
To: mchehab@kernel.org
Cc: johan@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Huang <huanglei@kylinos.cn>
Subject: [PATCH 03/16] media: s2255: Use consistent braces on all arms of if/else statements
Date: Fri, 17 Jul 2026 17:23:36 +0800
Message-Id: <20260717092349.684342-4-huanglei814@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260717092349.684342-1-huanglei814@163.com>
References: <20260717092349.684342-1-huanglei814@163.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgCnESG+9Flq5w+gHg--.17942S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxCF4UZr43JFyUJw1UurWktFb_yoW5GryUpF
	WfX34Durs3Xr47AFsrJFs7W3W3G3s5trWqqFsrK34UCrn3A3s7ZFZFkF1agrs8Kr97u3W2
	qr1vqa1Uu3yqyaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jdID7UUUUU=
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/xtbC0QVfVmpZ9MWnXgAA3m

From: Lei Huang <huanglei@kylinos.cn>

Fix all 5 'CHECK: braces {} should be used on all arms of this statement'
issues reported by checkpatch.pl in s2255drv.c. Add braces to else and
else-if branches that were missing them for consistency with other
branches.

Signed-off-by: Lei Huang <huanglei@kylinos.cn>
---
 drivers/media/usb/s2255/s2255drv.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index 78011f5fe99c..a759ba9a6d51 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -534,8 +534,9 @@ static void s2255_fwchunk_complete(struct urb *urb)
 			return;
 		}
 		data->fw_loaded += len;
-	} else
+	} else {
 		atomic_set(&data->fw_state, S2255_FW_LOADED_DSPWAIT);
+	}
 	return;
 
 }
@@ -839,8 +840,9 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
 				mode.scale = SCALE_4CIFSI;
 			else
 				mode.scale = SCALE_4CIFS;
-		} else
+		} else {
 			mode.scale = SCALE_2CIFS;
+		}
 
 	} else {
 		mode.scale = SCALE_1CIFS;
@@ -1122,8 +1124,9 @@ static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id i)
 			vc->width = LINE_SZ_4CIFS_PAL;
 			vc->height = NUM_LINES_4CIFS_PAL * 2;
 		}
-	} else
+	} else {
 		return -EINVAL;
+	}
 	vc->std = i;
 	if (mode.restart)
 		s2255_set_mode(vc, &mode);
@@ -1306,11 +1309,11 @@ static int vidioc_s_parm(struct file *file, void *priv,
 		return -EBUSY;
 	def_num = (mode.format == FORMAT_NTSC) ? 1001 : 1000;
 	def_dem = (mode.format == FORMAT_NTSC) ? 30000 : 25000;
-	if (def_dem != sp->parm.capture.timeperframe.denominator)
+	if (def_dem != sp->parm.capture.timeperframe.denominator) {
 		sp->parm.capture.timeperframe.numerator = def_num;
-	else if (sp->parm.capture.timeperframe.numerator <= def_num)
+	} else if (sp->parm.capture.timeperframe.numerator <= def_num) {
 		sp->parm.capture.timeperframe.numerator = def_num;
-	else if (sp->parm.capture.timeperframe.numerator <= (def_num * 2)) {
+	} else if (sp->parm.capture.timeperframe.numerator <= (def_num * 2)) {
 		sp->parm.capture.timeperframe.numerator = def_num * 2;
 		fdec = FDEC_2;
 	} else if (sp->parm.capture.timeperframe.numerator <= (def_num * 3)) {
@@ -2058,9 +2061,9 @@ static void read_pipe_completion(struct urb *purb)
 		return;
 	}
 
-	if (status == 0)
+	if (status == 0) {
 		s2255_read_video_callback(dev, pipe_info);
-	else {
+	} else {
 		pipe_info->err_count++;
 		dprintk(dev, 1, "%s: failed URB %d\n", __func__, status);
 	}
-- 
2.25.1

