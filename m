Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9939A48BD47
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 12:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909407; cv=none; b=cnKdcch/XFZ2VWCocJK6ENZL0tYNk+7ocN+Ryqege+moCB6s8Vd7ZDsI30GKDETlJukCPOM3TPsqDn/yD+Ba5neEumv/9GGGT+iXIHXFhE9LoG0D23SAqTtXyGLMWu9IaZm//2EAwZDmKBz72RzUJff4+MKS0I0tzCY25MALXsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909407; c=relaxed/simple;
	bh=qxvk4YJQ6XSShJzJ2XbQlAWBWrG98CnV0/FfhF1YheQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A2+NDsELV0aOdi31rX0GSOhZh+XjOA4R1VxU2BzxFCxOBCLhkFZSyhJdyJ+YU3H/04Zo8o5xB+yELXDmqvteOv4zCY1gRBVhwqIFstVpH5edc3Uhe+00Wke62IjsgYC0EByAesEoRmXlgIPs+kUFseTLdYJKA+4gMLQqPYERGM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c1s43w+g; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c1s43w+g"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c9aea40d799so221956a12.0
        for <linux-media@vger.kernel.org>; Wed, 01 Jul 2026 05:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782909406; x=1783514206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kRZ5y6jv3qLE+/HG/vpjw07aIlvGDyFsle/4yejj/PA=;
        b=c1s43w+g5xhF0FHIxMlSJUPrquox7PYjpd3KhWbLR2onLUKv4t+uYRjRMbYzgGnweS
         Qe345rejr+A6SZxojFw7TEdy824RdCx3G1m3plGwAFA78LdO9DnUl1EfIKH4+a3P7CeD
         58qPudyxTj4VcDxahzzSbrugdUZvLLSQBDoBF3KePISrn2SbOx0H9QolwZY7/17PlM7L
         YG5W4AHcGRgd/crDnjbGV5kNLWSi+VoE/nQjpcI+U85oDXWY4rMPDVtr8EIe+0Ionw9t
         WeSgfgHWSw2uOyx5FvUGHyjgShK0rbGLg5fg37u0dwER7mvcRrKY4H9UUEiBZ+F6LR5b
         LVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782909406; x=1783514206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kRZ5y6jv3qLE+/HG/vpjw07aIlvGDyFsle/4yejj/PA=;
        b=AfMsWnyrlTYWyhTV3ai2MwND8p9E2CisOuMdyybEHL7SZVGhK3Gb1+4BDtmVU+SkCL
         JBVtyC1OoLjhsr8dWxzhx59iYKBhIiybnQNynz4JXwWx5HOvFekHUhXfSjIZMY5arRLg
         iw/XDBuWfhJctUlI451dkCNxQzrRIWExsjxBqIFkMM4iCHKyglzDT8y/PuzQim+YqNoL
         vPATfTiM8dg/D8FZO+6JGbOifXdnpbwgNmUUjmACWOzD9/ctEULSog8tCm4C3WA4YNAI
         ukfGdF5IibMGjTEWyyzr/foPTQr7tN4oq1mGYqkv2YxSmNDbEFRgUnMJH+Rqqu31yglv
         dx3Q==
X-Gm-Message-State: AOJu0YwScyuApV75TeQzaR4StbR+6tIQi+VsIxDkTPhnfjc4z+4ymrSH
	EsKuODFMw/ybdu2v5M5N/TAe2/9sPCHlKG7ImUQKDqq5ENBqF1AHNaiI3fyTZg==
X-Gm-Gg: AfdE7cm7GfNIoDB0904ff8O4/A8PirKdRibX522tbooCtx7KOyPxJWIAYkWgMdPvlJF
	SSH35NNcv5rT/2XryoN3Ok1oJD5xAAA08+lNDNup2Kjyb3KczFVmRjR5avGnH0txf3wwRHQmFFh
	WnJICblkJ27UGa6vW8UMSq3M5jSfKaMvlCjyRfjZEOYrEpJp23sfGgre9M7f5xA3Q9gu/7uB0KX
	e+f2si13SpP6Qg+yIHZUsWvQ6unYoB85TaREzmDjUsz64pPrXx3IHwIp4gkHcAZSnJD+Wpsvyrv
	+sg88TywCavjY7BFcqJC9Vv2Yy3JPokYN7UDkbptWk++shf0QYI1e0vrSc51hfLMrgEe8G2NoPi
	SRnI+OJfRlz5nZd3th2fDkg28d/FMIxHyciz/iaptkEjNUIE1f+B0KqqrSAt/SN11ZsWiGG/6ie
	eFQAB7Coc97dXclFfZstSijh9US5yCCogUa+9Rcw==
X-Received: by 2002:a05:6300:670a:b0:3bf:6c07:b2ed with SMTP id adf61e73a8af0-3bff42dc827mr598754637.48.1782909405833;
        Wed, 01 Jul 2026 05:36:45 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9bbf95be56sm3025872a12.16.2026.07.01.05.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:36:45 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Jasmin Jessich <jasmin@anw.at>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: cxd2099: bound the CAM reply length in read_data
Date: Wed,  1 Jul 2026 20:36:41 +0800
Message-Id: <20260701123641.1674982-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

read_data() drains the CAM FIFO into ci->rbuf with a length the CAM
controls:

	len = ((u16)msb << 8) | lsb;
	if (len > ecount || len < 2) {
		/* read it anyway or cxd may hang */
		read_block(ci, 0x12, ci->rbuf, len);

msb and lsb come from two CAM registers, so len can be as large as 65535.
ci->rbuf is u8 rbuf[1028], and wbuf[1028] follows it as the last member of
struct cxd. read_block() advances the destination pointer for each chunk it
reads, and it never checks the buffer size. A len above 1028 runs past rbuf
into wbuf, then off the end of the struct.

The drain branch runs whenever len is larger than ecount, and the caller
caps ecount at 512. A CAM length from 1029 to 65535 writes up to about 63KB
past the buffer.

This only happens with buffermode=1, which is not the default. A faulty CAM
reaches the path the same as a malicious one.

Three sibling frontends already guard this. s5h1420, stb0899 and tda10071
bound the device length to the destination before they copy. read_data()
now clamps len to sizeof(ci->rbuf) before the drain read. The FIFO still
drains and the write stays in bounds.

Fixes: 2748e76ddb29 ("media: staging: cxd2099: Activate cxd2099 buffer mode")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
I do not have the hardware. The out-of-bounds write was shown with a small
harness that models the rbuf and wbuf tail, not on a real device.

 drivers/media/dvb-frontends/cxd2099.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/dvb-frontends/cxd2099.c b/drivers/media/dvb-frontends/cxd2099.c
index f95950a613..67b2ac4464 100644
--- a/drivers/media/dvb-frontends/cxd2099.c
+++ b/drivers/media/dvb-frontends/cxd2099.c
@@ -560,6 +560,8 @@ static int read_data(struct dvb_ca_en50221 *ca, int slot, u8 *ebuf, int ecount)
 	len = ((u16)msb << 8) | lsb;
 	if (len > ecount || len < 2) {
 		/* read it anyway or cxd may hang */
+		if (len > sizeof(ci->rbuf))
+			len = sizeof(ci->rbuf);
 		read_block(ci, 0x12, ci->rbuf, len);
 		mutex_unlock(&ci->lock);
 		return -EIO;
-- 
2.34.1

