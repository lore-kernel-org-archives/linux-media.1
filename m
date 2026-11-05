Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793861873;
	b=VEs8qbOFfX5maPgHM1jYqcBUPqiSNl6lYU39Csb4Yhgi+OqPpw4BYBQk47z1/QKCoTto
	 KQDFWOaCCQWM0+A4WA0vIpPBBeDFC/byrJi05srGrkCiVuJbBzmN+6S9fAt3hHnp7cDDm
	 mPu3k4CsQNpdhKIEgiYzqVPXYJonQM+JrQ9FJBQyfJIxbWAw8iH0F4yXt9n1nNunH0X/A
	 IQh2BrfnEFE/jon6eWdQvUGLPbiirVUoWsj/JPcMDQLaNx68j0rjFNoEDSWSa+6qwZigU
	 DSnIFBjH6Z5+rkymSYkQFqEHzh6b2mXRZG10u7F54E2i5BrGFfdXr+0kgEVP4lcGOdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793861873;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6hwSEt9NR4XCAdutgyCrDTEIinZfZHUBtwMhgIOAkGk=;
	b=kfJUFQv0e1UfEWSWE2IrhZbrkngIbIRvU6DXQhp1aFpOlv40ieOt6agH8xbis81Sbnff
	 BpBmeotKmGXsS3M6B8Q0Kwh8HU6ZQE0wcEfdNwdqmYADZcPISkuNxu7qzNcGRy/TD3sjy
	 Ja7R77h9AwjlmiCSxdRRnGYJzZPkeG0XdPOJHLnjXYn6jXDUWNp3Ng1qF73lgNexPxhAK
	 kTC7Ac0rQRkJhVChqYRTKZ473xCRW5WcTyHdmNIgzrWJlvOpGUKSYDO7FaW+i7w3V4XGO
	 9Y6+i8GwyMCaIlzy7HXx5PwmLacQ1oTpZiPD5vLVsVNidrfoDfDehhNKB20y5HTq3Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w53KNXqT;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5B5606A31B
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 06:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A5B5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w53KNXqT
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a06e79e152so926361b3a.0
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 22:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793861872; x=1794466672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6hwSEt9NR4XCAdutgyCrDTEIinZfZHUBtwMhgIOAkGk=;
        b=w53KNXqTSxpG9KIbuNF7y8eO65nqBB1x8uGYhoEV6mJ5FaEXb2jhxCO3I6Pu4YAljA
         f32GdRMMfAz6NQAGle60snYmqEeFvqTyTgGJ1Fc2ru4uGMr/XYGwqd0KnrrgL+CHqydJ
         quF1ZJjACvPR0jhw53RMAa/LcVHLkKs5G0Eg48C8z+XNvDbanMNqVeEbS3l5K7qP3c7L
         Ggq5le7p5czWt4evISjmcbBiNshO32bSbGO4xnmimVXGdE1irdB4bSHLrVjzqE0se9Vi
         GUEaFsRj8J9ifE+/YGb+LN4q0lZx310/ic5ABMOuXHpp5qm05pNE1FlwnycRJo2vNUxm
         WX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793861872; x=1794466672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6hwSEt9NR4XCAdutgyCrDTEIinZfZHUBtwMhgIOAkGk=;
        b=0Ing+LpZhhj5h56bTnPulEp4KuOdBbXclH55ldlXMlAkHNYe91PVEU+xKVdm3jsxhX
         WwFvX6tCZdJMxoBcwJhPU5G+4T1HiMvMax3ajJYZWjEiqvBxIJRS7kMq3j6dXBZQrXED
         oHshGF3qtG+OQxQoF75ErpaiwmJW24l2ZcUENOSqDURslWFeLf9pujoQoCCE/bSw4G1C
         NkwV0HAnn84vugv9zlxXOIJ74PG2HOTfXUYR8DGfObDQsuROJ+vwHB/bOI07eGFE63QA
         gcpAZLcIR59DhZUKGy3cOpYOViR83lEmTSsvue8pBBb7gry4Fn60hIkmdCZ5aLdBQ/He
         zi9w==
X-Forwarded-Encrypted: i=1; AKwUvBws+hF1xTXsey9b2783LxV7nf3lMjeD9U3V1Fohh4PfYQFAmxctYBcomYaElHvnjikG0njwvndedXixsw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9njjLbWXzDoHKT+pKEWOO8GEhnXi8kXLif5Yhus1Z1oDIVzH/b
	BqIgXCKVFLo9qyyYGjTCHWLtKU4fgbTILqiZSmK0oFeMiJvMG6wSQUZy
X-Gm-Gg: AYBFou2HJn2hos76IpNQB0nunUnMuO1H4iapngFE1Wxi/ulUGU5fg97E4ONPhSTjRaw
	h6lGba0hOKq0vOr9fNuTMVrDPWreTRciNG70+TnaoOey5dEfnSkdSC7M8tK2LKtxhHOrOhA0Rb9
	3ZwIT1d7Ntgpjv1+L0Hx9juhSvxxg2Dg4yIHAzs1rVhbYWoaRSc9zlDCVZWpDjolXlJMlEjpw7q
	Ys5vTVsXIv3hjUZjIeVUfPrruC6IxKifre+NPE+VyWZlAXT+jYh1n9/eB5z7zyDD2VYR2M4hUis
	1l4UzN/9Ikbhh6t9XiX+53FQRFksENI1mNtr4t32grZOSXeiKtv74zHroVNBt/kokyI0XvwWujY
	xnvIMx6w5YrL2iyMzopfpMtvsnOP7S3uk7xMoUT6LmQgQHvq4c5Rz0rm8DDAEXdRA5FdhWwXw1c
	2OpDMdG2YdUn6xSYBQNTk5jMf3r/1F9IM6jB9nYxxhM4N1s8B1UVKPjQYs6Pux0xID2vrhVLUSS
	NZJ0L19G2ENEhwBqNraTMvASVsuJbI/BexpjU5hXivvRKOTHD/hKfJVr/HwwRncBTC+GOSTNM8d
	pPaCOryyThLTp/DUlzn8lTdslOlRCPcKiZoLH1uNq9SaEJXH
X-Received: by 2002:a05:6a21:8281:b0:3e0:df81:23ef with SMTP id adf61e73a8af0-3e928aab8cfmr15657881637.74.1793861872246;
        Wed, 04 Nov 2026 22:57:52 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb469a8e97sm1832513a12.29.2026.11.04.22.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 22:57:51 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] media: gspca: etoms: bound device-provided length in sd_pkt_scan
Date: Thu,  5 Nov 2026 15:57:28 +0900
Message-ID: <20261105065728.1351098-1-hj351016@gmail.com>
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

etoms sd_pkt_scan() is the gspca pkt_scan callback, invoked from the isoc
URB completion (fill_frame() in gspca.c) with (gspca_dev, data, len) where
data points into the URB coherent transfer buffer at this packet's slot and
len is iso_frame_desc[i].actual_length, i.e. the number of bytes the device
actually sent in that isoc packet.

The subdriver overwrites the real packet length with a value taken straight
from the first two device-supplied header bytes:

	len = (int)(((data[0] & 0xc0) << 2) | data[1]);	/* 0 .. 1023 */

and then hands that count to gspca_frame_add() for a header packet
(data += 30) or an inter packet (data += 8):

	gspca_frame_add(gspca_dev, FIRST_PACKET, data, len);
	...
	gspca_frame_add(gspca_dev, INTER_PACKET, data, len);

gspca_frame_add() only bounds the *destination* frame
(image_len + len > PAGE_ALIGN(sizeimage) -> discard); it applies no bound to
the *source*, doing memcpy(image + image_len, data, len) directly. Nothing
clamps the device-declared length against the bytes actually present in the
packet slot.

The isoc transfer buffer is usb_alloc_coherent(psize * npkt) where psize is
the device's reported wMaxPacketSize and npkt defaults to 32; this driver
sets neither cam.npkt nor pkt_size, so both derive from the device. A
malicious camera can declare a small wMaxPacketSize and send a short packet
in the last slot while setting the header bytes to request len up to 1023.
gspca_frame_add() then reads up to ~1023 bytes starting at data+8 (or
data+30) -- past actual_length, past the packet slot, and past the end of
the transfer-buffer allocation -- and copies that adjacent kernel memory
into the vb2 video frame, which is handed to userspace: an out-of-bounds
read / kernel information leak reachable by plugging in a crafted USB
webcam.

A 1-byte over-read of data[1] also occurs when a 1-byte packet is delivered
(fill_frame() only drops zero-length packets).

Keep the real packet length, reject runt packets, and clamp the
device-declared length to the bytes remaining after the header offset
before passing it to gspca_frame_add().

Found by code review; not reproduced (no device/USB-redir setup on hand).

Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/media/usb/gspca/etoms.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/gspca/etoms.c b/drivers/media/usb/gspca/etoms.c
--- a/drivers/media/usb/gspca/etoms.c
+++ b/drivers/media/usb/gspca/etoms.c
@@ -659,24 +659,37 @@ static void sd_pkt_scan(struct gspca_dev *gspca_dev,
 			u8 *data,			/* isoc packet */
 			int len)			/* iso packet length */
 {
 	int seqframe;
+	int datalen;

+	if (len < 2)			/* need the 2-byte packet header */
+		return;
 	seqframe = data[0] & 0x3f;
-	len = (int) (((data[0] & 0xc0) << 2) | data[1]);
+	datalen = (int) (((data[0] & 0xc0) << 2) | data[1]);
 	if (seqframe == 0x3f) {
 		gspca_dbg(gspca_dev, D_FRAM,
-			  "header packet found datalength %d !!\n", len);
+			  "header packet found datalength %d !!\n", datalen);
+		if (len < 30)
+			return;
 		gspca_dbg(gspca_dev, D_FRAM, "G %d R %d G %d B %d",
 			  data[2], data[3], data[4], data[5]);
 		data += 30;
-		/* don't change datalength as the chips provided it */
+		len -= 30;
+		/* the chip-provided length must not exceed the packet */
+		if (datalen > len)
+			datalen = len;
 		gspca_frame_add(gspca_dev, LAST_PACKET, NULL, 0);
-		gspca_frame_add(gspca_dev, FIRST_PACKET, data, len);
+		gspca_frame_add(gspca_dev, FIRST_PACKET, data, datalen);
 		return;
 	}
-	if (len) {
+	if (datalen) {
+		if (len < 8)
+			return;
 		data += 8;
-		gspca_frame_add(gspca_dev, INTER_PACKET, data, len);
+		len -= 8;
+		if (datalen > len)
+			datalen = len;
+		gspca_frame_add(gspca_dev, INTER_PACKET, data, datalen);
 	} else {			/* Drop Packet */
 		gspca_dev->last_packet_type = DISCARD_PACKET;
 	}
