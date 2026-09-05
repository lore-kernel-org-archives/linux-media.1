Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C2937A857
	for <linux-media@vger.kernel.org>; Sat,  5 Sep 2026 15:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788623983; cv=none; b=NNco65dgGHydu1hycIyg7kEV5oD6bSfKBbNF+/OTniOFvA10BKE/CKekNMnebvOpzTuftbHYbYNDcdGlnKrv0/Our1/eP+c6wEHZTP6Qslszu47jkEim3Q6ifMfG3wiwR9bkOvF2P3LGO0ba9uH4Rfw2eukIWKGrs0spdpPPJfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788623983; c=relaxed/simple;
	bh=YZlxU0qa7yOrokzcfozuDZtKhdaD3EolrNmfGK/fOLE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NLdML4IjW30Xy3hAfAKgFnN09R74O+Bcs9ESlh4jPRf40113iUGNxu4q9RcriPeti2BBK3UQg3Jm2DBu7WTlLEBQGEhkJVvxb3ETa27Mw2rL45AXSu/vNM0BRR0PIDUuubt3t/AaVlLepAr9zij6fHulrLXAZkajBqFxds7x0Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FX1aJ4eR; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FX1aJ4eR"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b60bcf9051so1850905e87.1
        for <linux-media@vger.kernel.org>; Sat, 05 Sep 2026 08:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788623980; x=1789228780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5I5p80BiRfSVOrueQcySpZyddbNr0LAI4GdYjGvwOYc=;
        b=FX1aJ4eR1Y4V69p/D4Gxf0fXwsFqUu2/4R+9hKwUjWX288k4d8t6uWD39dbzvZ1qHI
         hbfNm5CLWM7REWTUVlkn5KIKW5f+2z334uSQc8w0+/v2YDoan68yVLAsYPYt61diXvMl
         N6CbkKS58uVQRX9jlGVCy5mL9KyvwU2c3bb2layDZ7MU33c8BkW1EQhYtNP2pD120Ild
         c94SFWUkBtgDt16EVAPeRHwnoN8U4ZwVhZ8r9/kq4jIkClZ7FgeosvKRIzl2rXyWEwCn
         UdjLkcDsvd4pN1Tdsb7e4mJZMETWIfmhNlZejUSm7Q+oFA8tcEuN0kEUNs8G72rYjyN0
         KR8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788623980; x=1789228780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5I5p80BiRfSVOrueQcySpZyddbNr0LAI4GdYjGvwOYc=;
        b=JDFvEhk30T5qU0JjCIhTPRDBkkp15MbBsGvwZaOrCBUrFFvqiHqXZE8HHWSrbLcxd0
         Zeg0xnOkfddP6FKv3P0N0hngO7OlzenLd0VFgLJfLoH67F3UxOblH/NgFSWXSSh/OwOK
         /3p7CnEJchAvsou/B7O5vIp0VXSobGAZK7MiUVqydszxhpG6HLTrDgFNXLexUsL3dc/b
         WiBz4x0RtjES9YY4fuEd8JMpb3sxkGxt4rurfVDfDSEQLbs6WLCusx6HOBjLYlTpyTct
         j2pz7vaC+eP59fNfABHqj4wQz3rZM5gohhyf0it7QCaZiGUNiDuqIXX+zVL9FxzZHGTk
         UOYw==
X-Gm-Message-State: AFuF++lWxbbqqGSF2GqKCTuloCCD8Vc3i39VDOkA5Ko9j94uvkd6RbOl
	ixtjyp6zAZ+fscK1ojDAzTk7S/x8bvRnQSm1T3rPog1K7zHYhmsb0+Hf
X-Gm-Gg: AYBFou0VeXUGYt92LuifESg1jvRuPyFh6X5Ad9Of0QnRDTadb/0F9xWk1uE5X8pKEtM
	rKCeEgPpOWrDU46bCtOXwUJLEkqT9qLKwA2tgGWNE5jTLlmbgnzGqGGgo3rct4LnyS2JpYhivCJ
	B5OTGgxOdA/Y4eL8sVRtRIFYQaFzscEi6bcxfh4Nh1ghTIFz2Tfu5C00gEZGd/1FUTH5ypvWuUb
	rSM6BdKPYDv8GAWQ+MXgUNOwBgpwl42N+4LYNIvp4VkIMQw19AdrLD9fCqNcI5z9fib3SZmNRO6
	4COxc7ADwvS020LMLfPbzRXnndIS2q3KLB+PJIAJbz29lH3lKYqXZvTvl+53sfCVGSQWVrOwBbi
	658c8R5w5/L5Qcpb8we5DnzgiifuvYFOLEJOpz9JRFjfHTM/p3QLxJ3Dxdek79VPtdrmKR1XFV7
	j+30SLcqgnmxAzJID6aAAHn9ELoKCydizb/0x9yil0KgoDOZBkm8JDwaFLkBX1P/Mnp3UWb1+CI
	9c=
X-Received: by 2002:a05:6512:2343:b0:5b6:95e:87ea with SMTP id 2adb3069b0e04-5b616ef1cfemr3945777e87.11.1788623979352;
        Sat, 05 Sep 2026 08:59:39 -0700 (PDT)
Received: from localhost.localdomain ([80.66.93.3])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166fbfacsm1154323e87.42.2026.09.05.08.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:59:38 -0700 (PDT)
From: Maxim Skokov <skokovmaksimevg@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maxim Skokov <skokovmaksimevg@gmail.com>,
	syzbot+cb43e758a4dc84dd467f@syzkaller.appspotmail.com
Subject: [PATCH] media: vivid: round the height down to the vertical subsampling factor
Date: Sat,  5 Sep 2026 18:58:18 +0300
Message-ID: <20260905155903.124458-1-skokovmaksimevg@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reports a vmalloc out-of-bounds write in the test pattern
generator:

BUG: KASAN: vmalloc-out-of-bounds in tpg_fill_plane_pattern drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2617 [inline]
BUG: KASAN: vmalloc-out-of-bounds in tpg_fill_plane_buffer+0x2063/0x4160 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2705
Write of size 720 at addr ffffc900038f9d50 by task vivid-000-vid-c/6017

The reproducer requests a 720x49 NV12 capture format, i.e. an odd
height for a format whose chroma plane is vertically subsampled.

The buffer size is derived from the height by a truncating division:

	sizes[p] = (tpg_g_line_width(&dev->tpg, p) * h) /
		   dev->fmt_cap->vdownsampling[p] +
		   dev->fmt_cap->data_offset[p];

For a single buffer holding both planes tpg_g_line_width() returns
720 + 720 / 2 = 1080, so 1080 * 49 = 52920 bytes get allocated.

tpg_fill_plane_buffer() however emits one chroma line for every two
luma lines, i.e. DIV_ROUND_UP(49, 2) = 25 lines, and thus needs
49 * 720 + 25 * 720 = 53280 bytes. The memcpy() of the last chroma
line runs 360 bytes past the end of the buffer.

An odd height is not meaningful for a 4:2:0 format in the first place,
since the chroma plane would have to hold half a line. Rather than
fixing up each of the ~10 sites that divide the height by
vdownsampling[], round the height down to a multiple of the vertical
subsampling factor where it enters the driver. Adjusting the format is
what TRY_FMT/S_FMT are for, and it keeps every later division exact.

Formats without vertical subsampling are unaffected and keep accepting
odd heights.

Tested with the syzbot reproducer, which no longer triggers the splat,
and by streaming NV12, NV21, YUV420, YVU420 and YUYV at heights 47,
48, 49, 51, 480, 481 and 1081. v4l2-compliance gives identical results
before and after (48 of 50 succeeded on the vivid device in both
cases; the two failures are pre-existing and unrelated).

Fixes: ddcaee9dd4c0 ("[media] vivid: add support for single buffer planar formats")
Reported-by: syzbot+cb43e758a4dc84dd467f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=cb43e758a4dc84dd467f
Signed-off-by: Maxim Skokov <skokovmaksimevg@gmail.com>
---
 drivers/media/test-drivers/vivid/vivid-vid-cap.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
index e20449084..147af0f9b 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
@@ -570,6 +570,7 @@ int vivid_try_fmt_vid_cap(struct file *file, void *priv,
 	const struct vivid_fmt *fmt;
 	unsigned bytesperline, max_bpl;
 	unsigned factor = 1;
+	unsigned int vdiv = 1;
 	unsigned w, h;
 	unsigned p;
 	bool user_set_csc = !!(mp->flags & V4L2_PIX_FMT_FLAG_SET_CSC);
@@ -622,6 +623,18 @@ int vivid_try_fmt_vid_cap(struct file *file, void *priv,
 		mp->height = r.height / factor;
 	}
 
+	/*
+	 * The chroma planes of vertically subsampled formats hold
+	 * height / vdownsampling lines. If the height is not a multiple of
+	 * the subsampling factor, then the buffer size calculations round
+	 * that number down while the test pattern generator rounds it up,
+	 * so the generator writes one line past the end of the buffer.
+	 * Round the height down to keep both in sync.
+	 */
+	for (p = 0; p < fmt->planes; p++)
+		vdiv = max(vdiv, fmt->vdownsampling[p]);
+	mp->height = rounddown(mp->height, vdiv);
+
 	/* This driver supports custom bytesperline values */
 
 	mp->num_planes = fmt->buffers;
-- 
2.47.3

