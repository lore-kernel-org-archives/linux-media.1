Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875914;
	b=d14GoYZrvrdYphrzkO9E0MI7iPQr4M8dpKrz/9q22+CFsOqOOGb5IdkjKKK66S0an6VJ
	 9EkS7BuDszWNof1dKccrXYmJrjDuQKioySiHTBkM8qEkVoU9MeeNzvPPy45k+erV+VF44
	 z7sjBUAQpdzNRfFpG57gdjrlBLTNx9DdxMWJtLZ9F16gO2pOabkL8THM5ouManwp/d9KM
	 vP6Of0Ii0hdnRV8Y7bju7CmJDryMP2+i1pbse8YYAlXE8jkW9rtgebVUYkQl77S/njDV+
	 2uToD+aEGyvSrTiWtq7dzk2iyNNG/IwyDp1x7JtlVVeIjsf04e9LnaHYT3ZG78wxs+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Rno+ABKVoCHjtYqyaujA/hiDFnvF78Jd9s6HELBuDFU=;
	b=Aw5hOG4P0uHxZSC1RkaVbgriTC3PMtAuCwyLLLFLE1VFQoIEafjsXW9qBv5Y2P8b8As1
	 VDkqvHWwz5ro9W6VuvqK9de84MnMpFYuatgd5NQrRpDOlQJz87QiNVL7a4v5/qNDYhL0z
	 rW6RJu28c1nVr1TgD92EulaDlnGg0rRrK0MHpetJeN9cTtfdkaAtxzrWpkr8i2Gf83JPg
	 /+14kvDEG+gA+nk8uPbd45SzCcwyxyBjlyQmtgfFNj8rB/np5nqmhDvV8E9IZ8/AjzrtY
	 vSzsZtM2vAUNf7HpKaUzpsQloQT+OnNJ/TlRahhdSDegzBZw8BrSuVkX+KOG/82H4jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WwflIkof;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFE9606A328
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 10:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BFE9606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WwflIkof
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdab938dc83so756840a12.3
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 02:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793875914; x=1794480714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rno+ABKVoCHjtYqyaujA/hiDFnvF78Jd9s6HELBuDFU=;
        b=WwflIkofOYTZE8YbyzmanHfUgdq+9tDgbdm42MZGM9d0xsLQD9m8OTQ2m5vpUtLY6A
         JpJw/oa0SAH+q9pSL3RmlLTHm5ad9cnIWZpYxRPKp2CYfV6dposlRI6mq2xzLKhQqcnV
         DaOm3RCxzY1A9C8E2KXCc6xLkdwYTyTPwCuefxOsouGF/pGplcvdDfv/8bExeiazmkb6
         OU0dl4ZnpdJmwg6RgbmsHZHCnrlqSzKrJRcFjiY+dyKA/QoycIhAtyHjw50SEKR+D9+C
         9LPHetngvd4hZUNpfjsJG6cptQTfmFZq8NRgT0Mj5ri02jKVDoCxS4h7tlyc2DGSL5v5
         ivIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875914; x=1794480714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rno+ABKVoCHjtYqyaujA/hiDFnvF78Jd9s6HELBuDFU=;
        b=ShUEBggitg2oZBm9toRcV4i4Z0Z6zevOXjvRUFbxNjWsITxKwND6/7/jV3XfXASOKj
         iP4R53KolimUPTMwjGls5uuKXklKPyon7D5ngGUyNHzcZqeXkYh8e53qfvFt0sWvGtmP
         B+00rO8H7AIYKghorx3RJX0K8qC0Qva+rFq/dMtUHh76y79Lw8+ppl949SlYzmXo7Raz
         /kueYtxPmBQt6i7P8p2LcciDwnLY7Mdj0yaRzRgXjH+y0Mn8yEwPnsI4c+IA7gRTZwqn
         AlVgrYV8ebVczYBUCrI+hjOdUCFpC/G0OfovRJ1/t3JSNcLToQOocicqZ50Ue5PhvnVD
         zpmg==
X-Forwarded-Encrypted: i=1; AKwUvByp2TIMQb6CmJABJMtSEmgzrZB0u8GATQw2hLXUzvK9B6QiJLptFYYw7Swj0CkUj73zABiZAhAa7UILng==@vger.kernel.org
X-Gm-Message-State: APuU4Z8871oBPcMAxa/W8eXOEdYUYLxo0dxpXA4mXpgUYhRr0EmW3VhY
	xEEPYK5kD4TRY4tOTDPDjVEKHcFkUjVUBhh7X9nUro3Je1lRlw81K6pyQu9iSHFs
X-Gm-Gg: AYBFou2i9aNB6nI7bgiRJt+dh4yI70fsCUL106JSv/17RLG1YLFN+qbh86kYZ3vxqOO
	GSfJXO0CGI3M3uV0fFpuZpXgwf5Gm+Q05Dtei7XuRKvRRP4K4nqTQ861Zxm8jTkbttzeIBJfEAk
	dIN/lXnYkeR+jbdiziqiE4+U1RiGNC/KAXXHzpqzBHOAXrJor5QV7n1zgpDXLBqA/O0hmXzlAel
	pobBM+YbHG2kAFkDSq394ndgUoJnRwgsIXNOu/PDvJgRFKqWGh0/7MJxy58C0BSSPY7HIcZSRfh
	Zfiefl9ODYF0okQiTJY7jtoMQc/JEXpGfoLCnwFmLVw7pxG7UIN/ZLAt0nDchFc9TUqrOZLrEl6
	/+obp+THArs4rV4BM7uo1AahcSdC2bIOxzj6PIh8YO2K9HWWNsnSKXwB/DM0Dnbwpez1R9QKnC4
	EhPQYGeAtW/crhdqpjeFTSTUFeGxZApjSpZqHJADRKWick6hTZwl9tQCDp8ORpHSyGNWTFNG9xn
	Kngm2kW5biBEUuOYLp/djuh3xX8+1GDa+gEr/Y4K5UpnClyaSeKLu3xFbBfnWTd39mZqDg2GCWv
	zzdOwctST7WAS1YK54LWNBERBiOxgZGUAcMKu/aMJnldhZzl
X-Received: by 2002:a17:903:4683:b0:2dd:b837:48f7 with SMTP id d9443c01a7336-2eb3649f118mr178999575ad.25.1793875913587;
        Thu, 05 Nov 2026 02:51:53 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed090e515bsm15755525ad.42.2026.11.05.02.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:51:53 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] media: gspca: tv8532: bound packet length before frame_add
Date: Thu,  5 Nov 2026 19:51:40 +0900
Message-ID: <20261105105140.1446192-1-hj351016@gmail.com>
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

From: Hyunjung Ko <hj351016@gmail.com>

sd_pkt_scan() in the tv8532 sub-driver hands the two image lines of a
packet to gspca_frame_add() using gspca_dev->pixfmt.width as the copy
length, without ever looking at the actual length (len) of the received
isoc/bulk packet:

	gspca_frame_add(gspca_dev, packet_type0,
			data + 2, gspca_dev->pixfmt.width);
	gspca_frame_add(gspca_dev, packet_type1,
			data + gspca_dev->pixfmt.width + 5,
			gspca_dev->pixfmt.width);

gspca_frame_add() only bounds the destination frame buffer; it copies
'len' bytes from the source 'data' unchecked. 'data' points into the URB
transfer buffer at iso_frame_desc[i].offset, and the isoc completion
(fill_frame()) forwards whatever actual_length the device reported (it
drops only zero-length packets). A camera -- or an emulated /
USB-redirected device -- that sends a packet shorter than 2 * width + 5
bytes (709 bytes in the 352x288 mode) therefore makes the parser read up
to that many bytes from the transfer buffer, past the data actually
received for the packet. Those bytes are emitted into the userspace
video frame, disclosing stale transfer-buffer contents; for a packet
positioned at the end of the coherent URB buffer the over-read may also
reach past the allocation, depending on the endpoint's packet geometry.

Reject packets too short to contain the two lines the parser
unconditionally copies. A short packet makes the current frame
incomplete, which gspca already discards; the stream resynchronises at
the next frame boundary.

Found by code review of the sd_pkt_scan() idiom shared across the gspca
sub-drivers. Not reproduced (no hardware); analysis only.

Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/media/usb/gspca/tv8532.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/usb/gspca/tv8532.c b/drivers/media/usb/gspca/tv8532.c
--- a/drivers/media/usb/gspca/tv8532.c
+++ b/drivers/media/usb/gspca/tv8532.c
@@ -251,6 +251,16 @@ static void sd_pkt_scan(struct gspca_dev *gspca_dev,
 	struct sd *sd = (struct sd *) gspca_dev;
 	int packet_type0, packet_type1;

+	/*
+	 * Both gspca_frame_add() calls below read pixfmt.width bytes from
+	 * the packet without consulting len, the last one starting at
+	 * data + width + 5.  Drop packets that are too short to hold both
+	 * lines, otherwise the device can make us read past the end of the
+	 * received URB data.
+	 */
+	if (len < 2 * gspca_dev->pixfmt.width + 5)
+		return;
+
 	packet_type0 = packet_type1 = INTER_PACKET;
 	if (gspca_dev->empty_packet) {
 		gspca_dev->empty_packet = 0;
