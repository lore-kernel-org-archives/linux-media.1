Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794782733;
	b=hP5YBEsbQBTAc+Mo3P+rj8WSrb8CSd33lyuCBnlvcdRi0enapwd5vOi62XN74JoIlJ3z
	 NvjY+Um+L8mgTe+xkuPftJRfEu9RkXiQRh8yHhPHf5H/HDFlmAJOS3Sa5w2sSOAcZ4mdv
	 JZqQWzyX6qinClb20QkX0HENSXHj7B7GCUmRDfQV9ReDjxA3iklAa6RnjyVML5aNYOI5r
	 fASmYu0Ez2b+W68dHrTiCmJok8NAaUfzojSXrLh0AZufKWqcFwNqkiw7Knf9ksp3N3P7R
	 frhqh66r/7h6dD0qNcKQYGwXjJluodO0OVzrB48+k87yqUU9rmEhzvDcKSOVwdfbuaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794782733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GOr05e4sBQgtPWColaaByvA3KE3CX0khn1f+6+vSgZ4=;
	b=Djp/LKxp8IcPLplpUgvaOi+VDHCWFJibxmd4ffvwjYL8Zibsc12pJRlBRtoIK65BX/9y
	 7aDnJGfY84XAkzZivmu0WdLZG1nxw8Az56Nuf380FNd8ExR6npJoDY4xwl2BMrzf/bCiv
	 Rgawl0TAC6afN/P4JFBgsDlaeAPQd0g9pJlqvyP9HW1mlbkwh6wF0ri0Z0gkIiE4I4w1A
	 /KGHpbECm4SX4rlTmbYs2d5AlU6NIcPr6YXbtcbxYryjadxa9obSa8+Yz94TDr6nwZPd4
	 cNLc5s6R6ZInj0/hVL93s45yHY5SZoYSFMB10MpEbziPtD8zarYzDT7EacmPCueizOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=AatWGr14;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94C3606A31F
	for <linux-media@vger.kernel.org>; Sun, 15 Nov 2026 22:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E94C3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=AatWGr14
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so32040775e9.2
        for <linux-media@vger.kernel.org>; Sun, 15 Nov 2026 14:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794782731; x=1795387531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GOr05e4sBQgtPWColaaByvA3KE3CX0khn1f+6+vSgZ4=;
        b=AatWGr14KzZxwc2Z0l4MTY5LVwBIFm7TniTPp9oDrlmZmcasvjHGzXaxxX+5IF0CIv
         MRe/plwx5R4zIQKLFXLOcxDmWfFy9xVERl/TyGv7ie8CuOk0NjQ+5ggsW6xcUtlzYgpH
         ZvPkid8BDnHSJEYaB23vIiIgLQTz93ppSIORNSBDQxtzOMSUa4AExaNwAsXlW0i+FXTb
         N/rhn1fZLTUbH+qzhRnkso7hg6Qgexz4QXZnpHmKj4UFghVQjqKdPcr8vKSAhs2BlcVY
         2P1+EiMnSCezLhIt5+tPeFS4iS1j9n7qG9TMzmGBuiGCU/q03qFoCR4HWBc0FYk8ET63
         6CJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794782731; x=1795387531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GOr05e4sBQgtPWColaaByvA3KE3CX0khn1f+6+vSgZ4=;
        b=OKMY5W8Qblqat4BuJp8LNnMWqPmGbfUc2ydEfJTYxqos0W3XG6L5pxvIKLajjJrOTi
         9CrzOQURIHDe2lmoTE/XsEJebbXt6Q2e6Kwkg4buFd5Q7HxEz4MvwFXWOC9dE1wfh8Ze
         ysYL6n9TeNZkRk5M0+EozAu2RFQlrykzE4aDcMI9GZfekdVeBlA3EajULeQ4Cu0N5Zr9
         3AYCidIyhveMm5/Q+wrwoLJrRad1TmSc+eTFmHhTwtR0WRGZXHjQCMH1d2sxj0JkEEYf
         PaEgIf29CEVdRvJvSXnrqGMXkCghEr+CrvQ+muLAXKUVfoBaXyIJHcxhZWetch7eKNkS
         Fi8g==
X-Forwarded-Encrypted: i=1; AL+hErGTgFU0/PVYx6IXSuwGFBni3LbEZDcKXXl/v4GWhbvNeK7bdlbkhr2JB0C6NrNmlD3qjKmcWyXfWQ35fg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9hdvSpl0BXSE+hhu/nxG4xVTap7vJfk4dJhLRCttgp9qcdT3eI
	Jr5G8449MH2gwhzcXviLnuaJMmnsUtmAR4TjrhKf+OXI+KbT4h+Jvx2S
X-Gm-Gg: AYBFou0pmZa1yEJ8whCZzpzqcMYYRR4LkDFJzv9TlUaUdq7UobQUdtpqpQNPJ3EQ4cS
	EPaO2Rz9neXnuwSclRrZAYSEDM01EvDNAzsauOuQAmgCM0ZTncPz05Ges3ZQkeY95HesBwq8UHh
	00YuCP57DLhQ1bOPMb4jGYC7LM/ebP8YvA5vpvoNd59jnhUtsjSPajlrZZS+DnOquWKe6Cc3IlO
	e9JdacvBM7mvYr52pLL2v91XA3NZyOpJxPaeELWkl/XTY8EGZnx8OCjZoZrByJBKAx1869CzmY+
	hwE7uYKU8TMJMLuUKOoBn6LJaMkcv+xfB8SfjVPeY+f15nxwIRT7CNdwhjGZIa7hCPwSzv9gf1p
	IsIqo7A5srVISWR1NK5wSsmdsmP2Z21KD522qufR70fwdhPpdC5AadiceVVc5xAO14/eotCVWS+
	u2mi2l92EceJ27O5kG9yrzIyK4tctYlvtMJ4EkQ1K7t2M3ceZRVsiIj+LXoQCiY6gGleSNgZUAD
	d7TqkwTgP4fHI8F/uih4wFbczgZAht/vADPPbRKn1r0XVBir0HSFMkeroKwPmJLrzjms9JdHXW4
	x+rUsIFKw72NfSIWdMadmrgrZjlyxcpKkCnt8WL2o3e5Cf30mrj7tIVaFWaJ2pqMKgqLa8e/UJp
	zd/1+UOoYFStzXprEBUntastejf5zoxmGdhuq+znsYs/NOVKt4jjbeHyLtkTqcqlVqyfRS84Fjk
	mc3w==
X-Received: by 2002:a05:600c:3b9d:b0:4bb:5dbf:af06 with SMTP id 5b1f17b1804b1-4bb5dbfb103mr167096955e9.9.1794782731226;
        Sun, 15 Nov 2026 14:45:31 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-9c24-a600-021b-21ff-fe38-46c2.310.pool.telefonica.de. [2a02:3100:9c24:a600:21b:21ff:fe38:46c2])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5f1c0e0dsm17912227f8f.15.2026.11.15.14.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 14:45:30 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	hverkuil+cisco@kernel.org,
	birenpandya@gmail.com,
	linux-kernel@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] media: i2c: saa7115: only select SECAM for SECAM-only standard sets
Date: Sun, 15 Nov 2026 23:45:23 +0100
Message-ID: <20261115224523.820853-1-martin.blumenstingl@googlemail.com>
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
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
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

