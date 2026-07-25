Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E332F7F0C
	for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 13:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784985615; cv=none; b=ukKeUqujuUxBwaynYolBf/KeoEYg+bfzzPvMAVzIjY8gdvERukidS5CWHluypYlGXC1McjQOK84Wpi8eeEzwhsW4QSDBhF6N508dZjqVCaScRWP1ubo4zbBJmJv03E+RJzNjqu1LMD35TmLNTinMe90NvPpxDWsuqX7aN48u2Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784985615; c=relaxed/simple;
	bh=7nWByWrKamoS3Tawd6xHdcAqvwiHXGHtS3tq7v3gZUE=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject; b=sbTM8O3H5NoyanzEo+l5QLX48ZpMX0myCjrx5s32mVf0Gkg0kBMyyDDnTV8lUTLy9Qb7BWIzkYI/EsrGaiyNEdNMGH359JJhbhMW621DgHBaTFmIPYB5r5MnPUw/Xc+KftjUbN1QaJEYL4gEOypMIZLZI5TIlN+t01VDIk9r+50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RfwSCP14; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RfwSCP14"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cad68425a7so1967955ad.1
        for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 06:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784985613; x=1785590413; darn=vger.kernel.org;
        h=subject:cc:to:from:mime-version:content-type:date:message-id:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2kCL9s53ovP8SdOgy9H7WYAqOYqd6/28JGErTF4iyBk=;
        b=RfwSCP14LdzE6pZWPn5TCK6i7TRY1+WW1NZMabyr2I/mHSJmucSABdkbLomD0BnNEA
         6yfuNn3lEBgBJMTbitb858QyHqMa21qbSMC6jmAgbFTiuKzZYtbEshUaZo1nXxgIj3+Y
         sFDhbjzuhcp6yfkr4H1OVcgBVDYP2aLmVDOgMLppHf5Y+TH1log79O2kqM8+4TegsFxj
         ghRFXD5k3dHKIdVPWJp3oqXr9t7xWJG0TrsJXCwg41x2CLwVe4xHDS/2+yj7NFQtuaWw
         E6LCV32g5uufHZO89VUJf+bfvQxmZUnRMUBDKU4iJW/blY7Q/dqxCk+Lne4ScFLbg5Ch
         mfwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784985613; x=1785590413;
        h=subject:cc:to:from:mime-version:content-type:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2kCL9s53ovP8SdOgy9H7WYAqOYqd6/28JGErTF4iyBk=;
        b=kHsMuFLx122oL7f0G+Ca4CZbzAVOQs/ToQBP63umPSmML+LEs9Db0fuiIIw+T8FFEk
         uYqH6p22JXkarNDEQ6/oBYXLiaxY5ohvPxbSP7kIPzDV3RgEQnhsR9SVaBmYPVBEUB5j
         +n9LmnPDM7l6/l1rEAuJc023rs3AapLXuIBHBCBn54WPNlZgkYnuvbo+jbzbzo6YSi8C
         xLo9uXHOMUcg0H6LkN1Wif0Rj01l6et7sv0s/f7cdeZzzjHH3XD5UWmK3qFSJlHMfBN4
         HqUXpxwxrtV522lABMQIH+s1YcM2dTr4mLyinHpWowHLT+q8YGCYS9t7uKfV521eJID2
         fi2A==
X-Forwarded-Encrypted: i=1; AHgh+Rr0pFx3Om+g7SDPqL961ugY7D9ptEQrl6t+Mgm7LflIvPreMfteCggWhiq+m0YsLQ1YvHZyf3lqPbGagw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiOM2pz1Yh4JyIr5b8Q81nrAFwxV8xsKZmffycadhIIBc+krke
	jXpB6wtK+Lwmy8PtmEQpti+SCjKTcg7VmYN2cVlIPEVGiRdoM5Ea7dLV
X-Gm-Gg: AR+sD11fT9rYRmC+hxd+zj1/9Dzht6u/uTioXq+VoFbB1q4hEnOmZCxVF66VqlfEgpj
	6dWKmBdMcGYdtrPMtuRf7HLu5Fo9Qa9eWjKNfn3/BtemjMt8YSvrT2gxgSe/wpkpDryRQhdBCcG
	TLIFpINxhrLLXq3neK7tasY9bhHsOw/khzPK24vRN7dQZ/CsuWX27TlwqowlNHJa8/98kmoHgpi
	w3RDlAAN12ZyZI62rKE9YTHWMb7UKeKKk5EYy1pxOVEdasQYLNRmRc2OtTk4gikGSHjonxeM60C
	sIkQG2ymNJvv6iRsK4coLy5U1RyB3mG+W7CEh9jiyXGRl+laxVc3q3gK9gc7Ehz27VK+R7htAQg
	uLeYVj0hSv00CZWCSQ11cCkn/9vKbuBMdQlPAwzW7P66A6TiSQFm2xQir8ePDzhS++dppC7kaQk
	fGjTC+QXtx7KO/UPM1gPQmWVHQ
X-Received: by 2002:a17:90b:3e47:b0:381:6cf0:d5f5 with SMTP id 98e67ed59e1d1-38f2963ea06mr1710466a91.5.1784985613081;
        Sat, 25 Jul 2026 06:20:13 -0700 (PDT)
Received: from Potato.localdomain ([171.76.83.76])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13015052sm33762367c88.5.2026.07.25.06.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 06:20:12 -0700 (PDT)
Message-ID: <6a64b80c.4987c784.13f2de.011a@mx.google.com>
Date: Sat, 25 Jul 2026 06:20:12 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============3307223758249983777=="
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Shivesh <chanelshivesh@gmail.com>
To: sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org
Cc: bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] media: ipu3: fix line ending with '(' in atomic_inc_return call

--===============3307223758249983777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From c753198ad726500786ba04d66d531db4c11e2b03 Mon Sep 17 00:00:00 2001
From: Shivesh <shivesh@example.com>
Date: Sat, 25 Jul 2026 13:18:59 +0000
Subject: [PATCH] media: ipu3: fix line ending with '(' in atomic_inc_return
 call

Move the atomic_inc_return() argument to the same line as the
function call to fix checkpatch 'Lines should not end with a ('
warning.

Signed-off-by: Shivesh <chanelshivesh@gmail.com>
Signed-off-by: Shivesh <shivesh@example.com>
---
 drivers/staging/media/ipu3/ipu3.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3.c b/drivers/staging/media/ipu3/ipu3.c
index 84c4d0bf027d..14e30cf913b8 100644
--- a/drivers/staging/media/ipu3/ipu3.c
+++ b/drivers/staging/media/ipu3/ipu3.c
@@ -556,8 +556,7 @@ static irqreturn_t imgu_isr_threaded(int irq, void *imgu_ptr)
 			buf->vid_buf.vbb.vb2_buf.timestamp = ns;
 			buf->vid_buf.vbb.field = V4L2_FIELD_NONE;
 			buf->vid_buf.vbb.sequence =
-				atomic_inc_return(
-				&imgu_pipe->nodes[node].sequence);
+				atomic_inc_return(&imgu_pipe->nodes[node].sequence);
 			dev_dbg(&imgu->pci_dev->dev, "vb2 buffer sequence %d",
 				buf->vid_buf.vbb.sequence);
 		}
-- 
2.53.0


--===============3307223758249983777==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-media-ipu3-fix-line-ending-with-in-atomic_inc_return.patch"

RnJvbSBjNzUzMTk4YWQ3MjY1MDA3ODZiYTA0ZDY2ZDUzMWRiNGMxMWUyYjAzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTaGl2ZXNoIDxzaGl2ZXNoQGV4YW1wbGUuY29tPgpEYXRlOiBT
YXQsIDI1IEp1bCAyMDI2IDEzOjE4OjU5ICswMDAwClN1YmplY3Q6IFtQQVRDSF0gbWVkaWE6IGlw
dTM6IGZpeCBsaW5lIGVuZGluZyB3aXRoICcoJyBpbiBhdG9taWNfaW5jX3JldHVybgogY2FsbAoK
TW92ZSB0aGUgYXRvbWljX2luY19yZXR1cm4oKSBhcmd1bWVudCB0byB0aGUgc2FtZSBsaW5lIGFz
IHRoZQpmdW5jdGlvbiBjYWxsIHRvIGZpeCBjaGVja3BhdGNoICdMaW5lcyBzaG91bGQgbm90IGVu
ZCB3aXRoIGEgKCcKd2FybmluZy4KClNpZ25lZC1vZmYtYnk6IFNoaXZlc2ggPGNoYW5lbHNoaXZl
c2hAZ21haWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBTaGl2ZXNoIDxzaGl2ZXNoQGV4YW1wbGUuY29t
PgotLS0KIGRyaXZlcnMvc3RhZ2luZy9tZWRpYS9pcHUzL2lwdTMuYyB8IDMgKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9zdGFnaW5nL21lZGlhL2lwdTMvaXB1My5jIGIvZHJpdmVycy9zdGFnaW5nL21lZGlhL2lw
dTMvaXB1My5jCmluZGV4IDg0YzRkMGJmMDI3ZC4uMTRlMzBjZjkxM2I4IDEwMDY0NAotLS0gYS9k
cml2ZXJzL3N0YWdpbmcvbWVkaWEvaXB1My9pcHUzLmMKKysrIGIvZHJpdmVycy9zdGFnaW5nL21l
ZGlhL2lwdTMvaXB1My5jCkBAIC01NTYsOCArNTU2LDcgQEAgc3RhdGljIGlycXJldHVybl90IGlt
Z3VfaXNyX3RocmVhZGVkKGludCBpcnEsIHZvaWQgKmltZ3VfcHRyKQogCQkJYnVmLT52aWRfYnVm
LnZiYi52YjJfYnVmLnRpbWVzdGFtcCA9IG5zOwogCQkJYnVmLT52aWRfYnVmLnZiYi5maWVsZCA9
IFY0TDJfRklFTERfTk9ORTsKIAkJCWJ1Zi0+dmlkX2J1Zi52YmIuc2VxdWVuY2UgPQotCQkJCWF0
b21pY19pbmNfcmV0dXJuKAotCQkJCSZpbWd1X3BpcGUtPm5vZGVzW25vZGVdLnNlcXVlbmNlKTsK
KwkJCQlhdG9taWNfaW5jX3JldHVybigmaW1ndV9waXBlLT5ub2Rlc1tub2RlXS5zZXF1ZW5jZSk7
CiAJCQlkZXZfZGJnKCZpbWd1LT5wY2lfZGV2LT5kZXYsICJ2YjIgYnVmZmVyIHNlcXVlbmNlICVk
IiwKIAkJCQlidWYtPnZpZF9idWYudmJiLnNlcXVlbmNlKTsKIAkJfQotLSAKMi41My4wCgo=

--===============3307223758249983777==--
