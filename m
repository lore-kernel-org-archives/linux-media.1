Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795555944;
	b=4VAaYBzHQ2ENycsxjPnSc5DY0ZbCJVbiYg74LJ+b4CufoLpmfUgOJhJytLVojpiDIInX
	 smZFmn0XKSB8emD55UPKF3mFHjF8MIMMkgsSv/XRfUE6d2Arg7qV+PEIbgZpGnS4lUgWv
	 PmF3wr7yFQyMOxJbo91ddCS2jBS+ybiSlN9uo+6XywQha3HTwu24FkyoxjbVp5AJmHuo5
	 M9WVS+P/4zAs4jr3opI01b1armtiSGCdosDqeG0cojAkTJc6BxLh1A7HD+zOJ0q/xuKgN
	 xLk27XAOTmM/ZaCIuWCWKoycOXIF1CO/OJa4yME2U150wOdvn18IZccbOkfGk0P0JXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795555944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DDcAtIlwc2AD4AEcVG0iGSI0NR5o7B+lhg7MPzNzuB4=;
	b=fOY+SWcDxsF6AGw0adAbFjYy0xwwY1cXmSGXZjtLDKB3Wi14EKtoDRbL2+Fiy6WIiPkb
	 TpRbdABYGJE9QM5xZ0/VofIwZ1GZ7rlWOJo+Bp/R3GLD2EmHNLt+OxCFhmwGI1WHo2Ob1
	 uv/fTxeAkeG3HaIA/4L3BFGTwV0IprYESO4TYgEB5dcEk19qSwnx8mVteVfaaQU+VMZ53
	 1ll0yxgJ+aMm185HMUTCxeCgujSSp26yJf/VlbMpCJnepPTFMP3e5+zl2czSXb9iN7i/f
	 o1BKlwY5M45woR+WqzYGtW06ZYVcaqSW3b09XT5QL2sz8V9IxBKoJztSV2Iox52SWvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=fqPn0igb;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB26606A339
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 21:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFB26606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=fqPn0igb
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso48539335e9.3
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 13:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795555942; x=1796160742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DDcAtIlwc2AD4AEcVG0iGSI0NR5o7B+lhg7MPzNzuB4=;
        b=fqPn0igbt9CYiII5B6D31XkWWpi++PdBoXbLYGajgAxqw+2kbPNOdmfpTh3C3IcMHl
         UK88CkZ8mYGdVvJjYcKH5OaMcN9xzV3piVPFq5tzMHHju7N4eMIY9oyh90cudcLjVi5r
         yWdSOnjgAAZivaminccdcbWNB0wa1a8DCuNfaMp3vWTNN7B7eNzF14dmG9R5QcVMhByl
         DSJJqQOaxRUGi6g3d4KxTMca3swNuMFCZ9LdEwqxAWTGMKeLaqkWPhgaVZt4dRKX08qB
         QNq0lDAMEGaotsHlFpeV2NXyDL6I38IlKrI0X4UzhQs/LMVtSC+N0TnU+kXIbKHaL+DA
         3TSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795555942; x=1796160742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DDcAtIlwc2AD4AEcVG0iGSI0NR5o7B+lhg7MPzNzuB4=;
        b=KYuAk8z5akwIxxUAJ7guQ5iSI50NgydRFyisH0AR/8T8fupysX6Fr/jQ+FYcGQB3lo
         59wgRQiaiXfDp1th24A9550/6lGwNwBjkK2cJiDtbC5obMj4rWkns+xke/kwanDtFxrE
         /Xn95hDWh1gZXZmmulJkwXSQA1oIk98Y5cZXXysGDqP5ru2jWTVvGfUEn1qLZgJid/dv
         K3A1jAfpKlV/X1uo7AKaS7h83hKprz6JGo5ZduxpUmbImD0rkv9uoSgt/EjhGoyBAxbn
         zqgMS0ZKnho5EHAzoQmTg6D7TJhyzOXJ+gpAniTNKC7/GhXk0OXC6SuTrWS2ZN6t/rys
         KiNg==
X-Forwarded-Encrypted: i=1; AL+hErEEAg80soHcege0msQBt2PdAkdGTARSKTJVAqqUqg/zrmigtcinSSrADW2X2jg5LGlHIbI5RkR0Ol/oQw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+bTcOpTbMjtGpOQMZXC8ugyf9k1GNslb/0FUkeuK3IX3uoYkZs
	ToNXXnHOnaIaIeAD3qvsE0Ep2++iBR1Z12z96/V6KRux65Am4L/3HhB1P5ei4Q==
X-Gm-Gg: AZFdTZcTCuQvJFwBKgTyzixe09R5TkkP5TtZSozk7so1XSnKnY2YERHVGcNVlRFKggi
	0epl9hr6P+yIY5poimZCCDS41gjFGNp4JAxGujOH8xH28sN1L/q9pzs+JOGvtwcEwOLidOf8WW4
	6sy9vnRaRqJ+xAlYc2WOnvXSPWQFJxFBKKqPD27DPCZpDSUMqSTdxp12iqKVhGdNGM3NZg0TCZ0
	/wu3X+ZVOJmNVMgoNAqEUfVe33JQtEHuv+RDRqMOpM9tlShIng42/+XUemzZyXPR4vdJwawd8TY
	R/fL++dJZWAW54GkX61ShDB/qflQhqzv33sXsYqcB3KEe32Kw0I9K9T087RIZy5jHOmt8A3nEAV
	BDUp2fb0bXqExE00wuBgo1gcg2fpb1Q3ZWaupixL7KXcJen13CvNFy2K46eNov0KfSt3d0wqxjD
	C+yd8aGeO/nRAGCUx6p23l8u0Uo6Aw2TQ2/C1pSTJI92ZyqPWZrjfaWCuLgMVjOf/F1NCbWCFUV
	igrPahGm48Iah3yHSu2OdYFIXqgiwNZdVs0XsBlp5N53QkUYPr5YP5ehONvabFs/FtpLeVq2veu
	GOl5xvGWvR9c8JViwqMwu4O3LZe02kuVF6gNZJ+lF0AC5WxDFljJX832lkoSJylR5RWNpfskk7V
	dLGA+4GmdNHCHbKsk55sqR3Q02yqpGE+qN18y5/S092oV5YCkU7xGPOE=
X-Received: by 2002:a05:600c:4e02:b0:4a4:4d57:8462 with SMTP id 5b1f17b1804b1-4bb88812b1cmr326513585e9.24.1795555941983;
        Tue, 24 Nov 2026 13:32:21 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-ad98-7500-021b-21ff-fe38-46c2.310.pool.telefonica.de. [2a02:3100:ad98:7500:21b:21ff:fe38:46c2])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb88442693sm410851315e9.1.2026.11.24.13.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:32:21 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	hverkuil+cisco@kernel.org,
	birenpandya@gmail.com,
	linux-kernel@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2] media: i2c: saa7115: only select SECAM for SECAM-only standard sets
Date: Tue, 24 Nov 2026 22:32:05 +0100
Message-ID: <20261124213205.807361-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.56.1
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

For the SAA7111(A), SAA7113 and GM7113C the chroma standard (CSTD bits
of register 0x0e) is selected in saa711x_set_v4lstd(). Since commit
a9aaec4e83e6 ("V4L/DVB (5408): Fix SECAM handling on saa7115") SECAM
is chosen as soon as the requested set contains any SECAM standard,
even if the set also contains PAL or NTSC standards.

Such mixed sets are passed to the driver in normal use: for these chips
saa711x_querystd() can only determine the number of lines, so on a
625-line signal VIDIOC_QUERYSTD returns all of V4L2_STD_625_50 (PAL,
PAL-N, PAL-Nc and SECAM). An application which sets the detected
standard (v4l2-ctl does this before streaming) then gets SECAM decoding
of a PAL signal. On an SAA7113 this results in a picture without
colour (U and V are a constant 128) and RDCAP in status byte 2 is
cleared, so saa711x_g_input_status() reports V4L2_IN_ST_NO_SIGNAL even
though the decoder is locked to the signal.

The intention of the original change was most likely that a single
SECAM variant (for example V4L2_STD_SECAM_L) selects SECAM as well, not
only the whole V4L2_STD_SECAM group. Keep that, but only select SECAM
when the set consists of SECAM standards only. For 625-line sets this
is the same condition the saa7127 driver uses for its SECAM
configuration, and for the sets applications pass in practice
(VIDIOC_QUERYSTD results, V4L2_STD_ALL or single standards) it gives
the same result as other decoder drivers such as tvp5150 and adv7180,
which test for SECAM only after PAL and NTSC.

Mixed sets now keep CSTD = 000 (PAL BGDHI for 50 Hz, NTSC M for 60 Hz),
which matches the behaviour before that commit. This also stops the
driver from programming CSTD = 101 for 60 Hz when a set such as
V4L2_STD_ALL is requested, which is reserved on the SAA7113 and selects
PAL 4.43 on the SAA7111A.

While here, document CSTD = 101 in the table above the code and add a
comment that CSTD = 000 is used when none of the cases match. CSTD = 101
is listed in table 42 ("Chrominance control subaddress 0Eh") of the
SAA7113H data sheet (Rev. 02, 9 May 2005) and in table 26 ("Chrominance
control SA0E") of the SAA7111A data sheet (1998 May 15).

Link: https://www.mouser.lt/datasheet/2/302/SAA7113H_2-87651.pdf
Link: https://www.eecg.toronto.edu/~tm4/SAA7111A_4.pdf
Fixes: a9aaec4e83e6 ("V4L/DVB (5408): Fix SECAM handling on saa7115")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Changes since v1 at [0]:
- dropped Assisted-by line

[0] https://lore.kernel.org/linux-media/20261115224523.820853-1-martin.blumenstingl@googlemail.com/


 drivers/media/i2c/saa7115.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/saa7115.c b/drivers/media/i2c/saa7115.c
index f4015f11367b..a33487d37d08 100644
--- a/drivers/media/i2c/saa7115.c
+++ b/drivers/media/i2c/saa7115.c
@@ -1007,11 +1007,16 @@ static void saa711x_set_v4lstd(struct v4l2_subdev *sd, v4l2_std_id std)
 	010 Combination-PAL N (3.58MHz) NTSC 4.43 (60 Hz)
 	011 NTSC N (3.58MHz)            PAL M (3.58MHz)
 	100 reserved                    NTSC-Japan (3.58MHz)
+	101 SECAM (50 Hz)               reserved (SAA7111A: PAL 4.43)
 	*/
 	if (state->ident <= SAA7113 ||
 	    state->ident == GM7113C) {
 		u8 reg = saa711x_read(sd, R_0E_CHROMA_CNTL_1) & 0x8f;
 
+		/*
+		 * CSTD is cleared above, so it is 000 (PAL BGDHI for 50 Hz,
+		 * NTSC M for 60 Hz) unless one of the cases below matches.
+		 */
 		if (std == V4L2_STD_PAL_M) {
 			reg |= 0x30;
 		} else if (std == V4L2_STD_PAL_Nc) {
@@ -1020,7 +1025,8 @@ static void saa711x_set_v4lstd(struct v4l2_subdev *sd, v4l2_std_id std)
 			reg |= 0x10;
 		} else if (std == V4L2_STD_NTSC_M_JP) {
 			reg |= 0x40;
-		} else if (std & V4L2_STD_SECAM) {
+		} else if ((std & V4L2_STD_SECAM) &&
+			   !(std & ~V4L2_STD_SECAM)) {
 			reg |= 0x50;
 		}
 		saa711x_write(sd, R_0E_CHROMA_CNTL_1, reg);
-- 
2.56.1

