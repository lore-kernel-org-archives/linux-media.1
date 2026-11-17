Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908678;
	b=UUJ3E9V9Vtgnqa5gCJtU9O8ry9D31Qhqk2UBROjrmZr40q/Eof0b4WFI1NI82HDFZaDf
	 DsRiIP+1qgzDy0e5AhW7FRl0k9NDj5kg+8c+Pfuft+qwJ4drIySxrkKUS7BlCt0tThVzb
	 ztlUkSS3EwMFRtE++9vPtOryQUYtSHdd5h83X0T7zLjhPmex4ogp2JY47rVjRC1mgdGWW
	 98Nq2F0aWv2es3prz05TPq8Mwn1sOw2/KGQMm0AJ+ISKUJH6mLM1LBbuxe4KVshJdiqIG
	 7Svh0UIzy8Z/ULZkzjEMpfv9WnAJW4gu1vCJnIX7F6rUvKWv1075Z8eBU327IYMvvJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bpVBOHCqTNlmSYDRormllaIQWrWpuayTwUPbDNGy6w0=;
	b=TX25dp95EWJYf/xwKt2pMWYC8sZpRMFHe64HlnoRvN+n+0ererbX9lPVcJKpJfD+viCd
	 p8BVnc+Q5047XWAK0b0T5lGtX+def6HAmFIH0FXgfiHBS9ZweSBhgip/CxHXE+3DcLQHs
	 5ZwqSCRbjWGysra8x6GN99KoKJG+DwVe2B5DzcgIR9zHge8Fwx/spAfOLbomdjeXGcEYV
	 U0a0M/y1f8a+cARAbDKnwj90FwCFkF7NRKFTXSaWiv1s1Cmc7ep/VspoamZ3/QTPYpEPs
	 Dw7lgsR6QLv/7xp12yZ4277yfdyg+1p5hozdAy92oxsp6O9LJ62G9b57jCPQFknTQiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ibn59nDn;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B170C606B5AB
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 09:44:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B170C606B5AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ibn59nDn
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso27501295ad.0
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 01:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794908677; x=1795513477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bpVBOHCqTNlmSYDRormllaIQWrWpuayTwUPbDNGy6w0=;
        b=Ibn59nDnajmbpxSmVCbdMujxlpU2xp7zr+ALPIpdphgEd4gO4RRUzcqnftOFGrxtmQ
         DnP1qix7dGJ505+2a69wh2drHmZ+6mHExhJ6xa6j9T+ef1h3z4jFJ17RhJxFPOwmj7Tq
         ceoQHZI8h38rpyuKLlNGko9rrljwHvmJT1EBq3TGs7glnozjV5T+FJU00kKEP/RajDAU
         U7MGTihjuOdOrtLOGN8DCOOWQEZcQwBONbWvOcWmJjJQ+d6xskQ0eN6keqbQf5H0KUSH
         w9LQBYUPigMAlbp9T+3ozAWQoLyyhTlloN2bWEzXpsylC3GCGDBDlWs2ORejIGjPXMU6
         B1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794908677; x=1795513477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bpVBOHCqTNlmSYDRormllaIQWrWpuayTwUPbDNGy6w0=;
        b=cEEik1Mex6d8xnnVsARrDQ6Ukl+GMWvKJJM0rphFf5Q6xog1QFPP4iIKzaBCSX9er4
         beNHANe96qqHJsKp8xeebOCp7+7m+ml2b3Jf4cbp4xsb7F3WR8qVAwXDU/Hu7uDJkNwR
         8pBnUmaZ87a4fmVCbxqTerBnJccySor8mmEltmJUnHo0DRPn5AIRM5w05d+PXFhCtXeE
         xp1Pecm+ohQvuwDFEGVyHi7NL4cCDo2kxuNoBQsvsvZzFULmwxN7LSJ8fy44Yjz8fq83
         TPJPqcgIbY1LtvrM3pipht2Aaoj0KfM75AazintmOxl4+atO7Hec00xWAIPRBMA0GrKa
         XR0A==
X-Forwarded-Encrypted: i=1; AL+hErFO1xQnYLaq2LWJPj57NSjhoi9AeSuO54KNXIaehImgKtdNrqtBspAU0XHFCv/QVEnuIZ/VmZdO/pxoXg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9U2WccCBg71P7a4n4RYBe/ZEy8btSmxYk+klShfQtlyjVgVKy7
	w1eQ0MetRuYn8WTvaWd7iC9IUYC/cMSGD+TGL1sKWq5mz5xmZWAPhRSZ
X-Gm-Gg: AZFdTZfC7xc1nIRk9RBEW/y4q2Ag1OkvTI+9RqCKneNtUxO4fydU0XfAjXIaoPhcwDl
	FR43q8tPNtaj6ls2T5BpTu0VVlFFEAfl8Be3+X2WKIgNLaysYObHQ1lZgsFWmPhhQmxhfQDi+wy
	9aiu7IaEfe2V0GQMA0cUn2lldIvl/s/7DfJOvDjgC87CBqLmfsKImxAxyCD/JRgjyktsu5ViDrM
	6JHBoE1/R5aYOdrOB04VyARhzkmB4yUzSRacOjKPzLWgSOEiB0zI66SOcGOYqh7JN76+IcMYzg8
	SLWqOZ5nSIXRkWO8dGJt/hKWPsW0cy9i04Y0kuVCoXQZjp8gND1nUT7D0unhSq0yE2znVIX3UUq
	gGfO6OJmWBGWBCDrgTEevcunh6/4IMBohScgM2zyLMSp0ldOesF39esKpAkR2yUa4EPSVjHEZCp
	wGNd5f+Ow2WjggLND7TVQlc2cHCtUcQKU8jf9uvDy5yB5XPN0VKOs+75V3hMFAmac2cjq6jbm4M
	WD/AAn6RwAvX4Y/hrdOEpL501o/+dyWab/O52VYTnQuLLUF0qU9kBzOpzXqTtGjelt0p/vtcYdW
	VNfcclx1pYs/sYv4KnscDKcVZGARdPu1j/0aQV0MbFmT/qLw
X-Received: by 2002:a17:903:3887:b0:2e9:528c:ba02 with SMTP id d9443c01a7336-2ee0dcca259mr118714855ad.60.1794908676979;
        Tue, 17 Nov 2026 01:44:36 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd76db218sm12114815ad.3.2026.11.17.01.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:44:36 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Tim Harvey <tharvey@gateworks.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] media: i2c: tda1997x: fix out-of-bounds read with a one-block EDID
Date: Tue, 17 Nov 2026 18:44:23 +0900
Message-ID: <20261117094423.193684-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tda1997x_set_edid() accepts one or two EDID blocks, but always reads
256 bytes from edid->edid: once when programming the CEA extension
registers and once when saving the EDID in the driver state. For a
one-block EDID the buffer allocated by the V4L2 core is only 128 bytes,
so VIDIOC_SUBDEV_S_EDID with blocks = 1 reads 128 bytes past the end
of it and writes that data to the chip.

Copy only the blocks that were passed in, zero the rest, and program
the chip from the saved copy.

Fixes: 9ac0038db9a7 ("media: i2c: Add TDA1997x HDMI receiver driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/media/i2c/tda1997x.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
index 30dfd8a7b42b..a523fc2b2b71 100644
--- a/drivers/media/i2c/tda1997x.c
+++ b/drivers/media/i2c/tda1997x.c
@@ -1891,17 +1891,18 @@ static int tda1997x_set_edid(struct v4l2_subdev *sd, struct v4l2_edid *edid)
 
 	tda1997x_disable_edid(sd);
 
+	/* store state */
+	memset(state->edid.edid, 0, sizeof(state->edid.edid));
+	memcpy(state->edid.edid, edid->edid, edid->blocks * 128);
+	state->edid.blocks = edid->blocks;
+
 	/* write base EDID */
 	for (i = 0; i < 128; i++)
-		io_write(sd, REG_EDID_IN_BYTE0 + i, edid->edid[i]);
+		io_write(sd, REG_EDID_IN_BYTE0 + i, state->edid.edid[i]);
 
 	/* write CEA Extension */
 	for (i = 0; i < 128; i++)
-		io_write(sd, REG_EDID_IN_BYTE128 + i, edid->edid[i+128]);
-
-	/* store state */
-	memcpy(state->edid.edid, edid->edid, 256);
-	state->edid.blocks = edid->blocks;
+		io_write(sd, REG_EDID_IN_BYTE128 + i, state->edid.edid[i + 128]);
 
 	tda1997x_enable_edid(sd);
 
-- 
2.43.0

