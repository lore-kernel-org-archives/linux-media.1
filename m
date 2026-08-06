Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBD538DC69
	for <linux-media@vger.kernel.org>; Thu,  6 Aug 2026 17:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786038455; cv=none; b=ahqgRwMofC56ngOfgtXUIjP2+D78DRH87Bp26L+9VpxOQAKvvfH1XBVaiq8J0ZUpAdS68UxtOaar3Dqj8T0aOJeGDTaRsaxN6DqhVl3p0OhcJqh9eE8TGtxIkM+1MusIK5T4x7lWekXcTjjJTEa3cfxAsLWut1P8gdoob39kqGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786038455; c=relaxed/simple;
	bh=vSerB2OK/jOeZe0W9kGwcf0dSFaiMJU+D8sgcEwDWkI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=POFOubCTn2hy6LfnrMMpUBu974J9iqKUrCp8XAQdBysIRtV5Rm/nZtQYGrmDLpNl5w7eQg0AExzEhqtQuhJDDjHvUBe7R+waQHWI/1F+AUD5OatTYqh27RepctfoHqyp5hN3ukWkCuOdrD3VbiNctQ1vJFm8XheIl0AdKl6H92Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FUFOj1kk; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FUFOj1kk"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso1584230f8f.1
        for <linux-media@vger.kernel.org>; Thu, 06 Aug 2026 10:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786038452; x=1786643252; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8BcwyKuF4sIybbZo8fHv0F2dvNRejz5I+Q0GO6iBkkc=;
        b=FUFOj1kk3wnJqeBNMzgOfApxPe0mRknm/nN5JzkDJ6kKO4owJmXGwaJ9wXnPTl47Zm
         A/GQvXl2ro2uIIBaPJyU8lxFKfzRWdRZDVIMoSqHoDand2/LjzXGp/+CjN5nLLmhRc3r
         cXqp+0N48EoVlhpcjqt4DMsxNtC9qhuE9eNsZxW6SxjABq9oju3Q11c8vTFpoMgn1lY4
         dYjk1Upd5FlS4s2oVEbJzRe9Nixor1kkTwubstuer7Pxpww/N4XBDhwHhw135hmunuP3
         FIzjrIIZ8+zqP8bd9fy7dYierHah3uN0X+ULK3Llb6YBKdW57aqSwySrZjFb+qo2gL+e
         2mGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786038452; x=1786643252;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8BcwyKuF4sIybbZo8fHv0F2dvNRejz5I+Q0GO6iBkkc=;
        b=ic2PQo0ogk4JR257T+M50GhvBq4uHJ3lgt2XCLV4U1+v7rgda8+xYy3iCrEsBAyYAz
         VUl/SMS9xsYbzn7beXeJ1az3AeHRXKKv3wTiSo3hGfp+e8YG9uLPGlxyJfKCFgEBLZ7v
         ASJK2OSsjBcHyt0Ep5H/irJeiLSAf09zJK8VoIB5eWZsawyLFSoNh3QVIeZQ45B53T08
         r42uXxFAcavUz2SZwt44KAneb+qeEQjuKLEFIm0jt6ko9oFNu7/kKwxX74CGImOpunE1
         ol+edZMisGKwcXmPgYNMWEkdugMASyN6868V7uaHexl7uMNpH22MjaFx7+j0pEHP3cTx
         vrPA==
X-Gm-Message-State: AOJu0YzlB7Rh/lA6/snkc211JKAzanl+VKMnTnxTmnzbOkqyn++kzeu7
	BdH6F7F6F0xgNN0q62xp2Y1RyQMDqRZLnCi+2LHUP1pThi3HzRQHBzbJ
X-Gm-Gg: AR+sD11oDJHX+IYr/dQR3Fw6zN0u32gtg1Rv5grFFzaKwfhwUEiBldSw+Pjv1dOAZii
	cr+I6fqUICTzzT6niiwJn5oNHQZHBej313w1CN7shOuvtAPkDMl2ICPEcVjWC1B3qjBuzUJ+Pj8
	0pBUxmxRhbYTJutta+4SHVZq3pd1uem5vNIFaiAtaw4E8GEM+3+VohWtHsDeepMhjArnyeR7N1Z
	FmtADHF+HTO1YzK+gqNZs9IdIbj44SsuzftME7ZYRdg0f52VQZ4HkWbUGd5ga8Qed87Mn1iPFN8
	aKyTDcmjHT1TusRvr9cNJ1wDrGuxV2+lL2pPe4Wlvi86IOHY+GrWOIPQXyBPNaDAYT43BiNdB38
	p562WXAIwFE1IOceK7TohNDaotfFSV4VN2lPtlAzhBBprXHJcmvUxCjdZjp7WrQXoj7IKVHHSJk
	qMZFSc9Fucfsj0mrk2PZWG2F7lrlh9758BGh07/fNjSOY0dXE98u2h8An/rtLX5wgzDsmNnTpHo
	iprNSaqYVn7cn1aU7UbWX3KUvyP+L/wp3pov5c1N7SVVMsSWK/R3If2
X-Received: by 2002:a05:6000:1842:b0:47f:8d71:210a with SMTP id ffacd0b85a97d-47fec634b38mr26308893f8f.15.1786038451766;
        Thu, 06 Aug 2026 10:47:31 -0700 (PDT)
Received: from valmpani.valmpani (cgn-195-14-217-60.nc.de. [195.14.217.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff79a7302sm8263913f8f.1.2026.08.06.10.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 10:47:30 -0700 (PDT)
From: Vasileios Almpanis <vasilisalmpanis@gmail.com>
Date: Thu, 06 Aug 2026 19:47:22 +0200
Subject: [PATCH] media: dw2102: fix OOB read on firmware size not a
 multiple of 64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-dvb-v1-1-a750f8e5b2ea@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKnIdGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCwMz3ZSyJF1jA3NzQ5O0NDMjI1MloMqCotS0zAqwKdGxEH5xaVJWanI
 JSKtSbS0Adwl+kGcAAAA=
X-Change-ID: 20260806-dvb-307714ff6225
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Igor M Liplianin <liplianin@me.by>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 syzbot+f408eac9faa61d5a1927@syzkaller.appspotmail.com, 
 Vasileios Almpanis <vasilisalmpanis@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786038450; l=2387;
 i=vasilisalmpanis@gmail.com; s=20260731; h=from:subject:message-id;
 bh=vSerB2OK/jOeZe0W9kGwcf0dSFaiMJU+D8sgcEwDWkI=;
 b=ForF2kxJMOHk+Qjpdztm/ba78RcPkxgtj1+6qk1gYPfpwvIjQK3I8tqD5pf9VyKCG1ZWtGVq4
 m0j4UXCSLZlCCRuva1qlsiUSkmRglJOxoR08anD4wGBPtwBRA8vG0QK
X-Developer-Key: i=vasilisalmpanis@gmail.com; a=ed25519;
 pk=gn5Uo6yL8Tlpq5uATxA3nqoq+U8eWLRbjD+bOk0qSpU=

dw2102_load_firmware() copies the firmware into a buffer of exactly
fw->size bytes, then walks it in 0x40-byte steps while always passing
0x40 as the transfer length. When fw->size is not a multiple of 64 the
last chunk reads past the end of the allocation producing the following
splat:

  dvb-usb: downloading firmware from file 'dvb-usb-dw3101.fw'
  dw2102: start downloading DW210X firmware
  ==================================================================
  BUG: KASAN: slab-out-of-bounds in dw210x_op_rw+0xb6/0x180 drivers/media/usb/dvb-usb/dw2102.c:102
  Read of size 64 at addr ffff88802bcf2ba0 by task kworker/1:2/803
  Call Trace:
   <TASK>
   kasan_report+0x117/0x150 mm/kasan/report.c:595
   check_region_inline mm/kasan/generic.c:-1 [inline]
   kasan_check_range+0x264/0x2c0 mm/kasan/generic.c:200
   __asan_memcpy+0x29/0x70 mm/kasan/shadow.c:105
   dw210x_op_rw+0xb6/0x180 drivers/media/usb/dvb-usb/dw2102.c:102
   dw2102_load_firmware+0x2b4/0x970 drivers/media/usb/dvb-usb/dw2102.c:1906

Fix this by clamping the last chunk to the remaining bytes;

Cc: stable@vger.kernel.org
Reported-by: syzbot+f408eac9faa61d5a1927@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=f408eac9faa61d5a1927
Fixes: 7fd4828f6cc5 ("V4L/DVB (8421): Adds support for Dvbworld DVB-S 2102 USB card")
Signed-off-by: Vasileios Almpanis <vasilisalmpanis@gmail.com>
---
 drivers/media/usb/dvb-usb/dw2102.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/dw2102.c b/drivers/media/usb/dvb-usb/dw2102.c
index 4fecf2f965e9..4e26e1776977 100644
--- a/drivers/media/usb/dvb-usb/dw2102.c
+++ b/drivers/media/usb/dvb-usb/dw2102.c
@@ -1902,9 +1902,11 @@ static int dw2102_load_firmware(struct usb_device *dev,
 	if (p) {
 		memcpy(p, fw->data, fw->size);
 		for (i = 0; i < fw->size; i += 0x40) {
+			int len = min_t(size_t, fw->size - i, 0x40);
+
 			b = (u8 *)p + i;
-			if (dw210x_op_rw(dev, 0xa0, i, 0, b, 0x40,
-					 DW210X_WRITE_MSG) != 0x40) {
+			if (dw210x_op_rw(dev, 0xa0, i, 0, b, len,
+					 DW210X_WRITE_MSG) != len) {
 				err("error while transferring firmware");
 				ret = -EINVAL;
 				break;

---
base-commit: fcaeecb8b0cd44f77d03b28de0671258d4db18f8
change-id: 20260806-dvb-307714ff6225

Best regards,
--  
Vasileios Almpanis <vasilisalmpanis@gmail.com>

