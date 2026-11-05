Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874781;
	b=N2Ou1optLXgjmcgReNL12Ncywe3Uvyp6gdMpeAJJaO6d1dbQr54X5VLk7BIy0s+qllDt
	 Q71fe3vhzlRui087QWD0+32rkfewlUjuElOWyzb44q2n8inGhzc5gblPoYzpTK6q6l2ZU
	 RiLnQ4pos0V+eowTnM/JGyfDik/9kNQsxk2lJuo8DsH57kU9n9OByx0Y+UVkYv79w5S+W
	 bM3wJqOOvZQ6QFP5ElKLTc/uVt0op567gKP+GtWxOJfVc/gMJmKB8B/aMqB5rRKIcKT6/
	 0t7qAHt3ZqZ7zq4MgBxWwZn48GbgTsJEj1d3mEzdrXhBlu6UZSwo4E5ApPZZeCpWTsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=v0rbKVQ49enEBCt7tCDTAR+n/t5wNOavw3KdPMopqog=;
	b=IKn4tG1Nc8JyNXTHeAE0QbYYCf51ahZcGgpPpSBK7oUsyrRlLTfEHEQMHpoDk0TqxxsE
	 ybTcRzosUN4CT5UJHfeE1zDPOlosSWtKLc1WgTjYdlgpAKxfUtbku5er8HvFjIz0pDdQ5
	 4DG/s0FUDz8GyVKMAUYPUmowyfaToIOp/2Tv7elpjkcD5IFdfU3CZQMUsIz/cL9nkLaHP
	 yGL6bYBvGY5a48i7ewj3Ro6qpgW8DjBa5C4fmK7AzUNbpOndCUrcKPzt7Mf5jREK+oAgc
	 OoCnZQfvKOTOae812dabsNmWBFxoBNSb8V9+sI24RrCtY7Fn9XtSip4JGBQ92llY6zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PiyCf7pv;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21228606A326
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 10:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21228606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PiyCf7pv
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-886e61fa30fso799454b3a.1
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 02:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793874780; x=1794479580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v0rbKVQ49enEBCt7tCDTAR+n/t5wNOavw3KdPMopqog=;
        b=PiyCf7pvWgT8fxkMzrWLrIH3dgWUniFK7soH84AMstFJO8rYlWAtORcQBiHnBLeWPs
         NNiNzOZ90aMMgi1JGENjNURKZuSo7+lErbIWOjc5muIfBSs844BTQkHcWxt2sjSVemLv
         b3jJ5uCjGu0G2T/wb9Wa+QFDYelGltdYmY5h4VRnuOMkrCPEzjrBCAm6MIBGdkmt19UQ
         LvVCLVo9liYpYgh+TQc2q0TU6SDfDG1kqIqXyyJCrWt+Btx9S/nfuS5iOpyT3aungVc7
         6GLIY8/kha3rjXXouZf+UbCmMRwFLQVjIb12RlcJnnxROwl0eYmuG9QNAQBaNeHrjgzR
         tYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793874780; x=1794479580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v0rbKVQ49enEBCt7tCDTAR+n/t5wNOavw3KdPMopqog=;
        b=WUGClRnINRGbpamlZvpMJJw0+8xGbVkC8zdkrO0p4jHRtvv63dKFTmGs6oOItOCxIT
         TzdZP9nN7xJmsDkMUCyjA/xWbjRVWCekNfOdj19qWoO4xeaUfelkWiC/j+SZepuu+JUh
         yU9nteIOME7Yo9eutsqhNsI/OdH+ZtNUJWckJO+8gtVRPsSqwbzb+DWpS0+TmISRh4/M
         BNfM5LuTQG2Mb0fcJUjBi5CvJxblvlM1JBRfCrPYk4IO5ThQuqQr35zOzpo/6XrL/ij6
         AL2dqKm0kLsa4a5fUuNaly0jkwHFajHRXCcl9PkPezkSQVRCEIdIXoDfhzRANiUqGG8e
         vZeg==
X-Forwarded-Encrypted: i=1; AKwUvByEFQ3dBZrfths9loDt279tK3mpPtwpBUrRHnf3J/xR6uKZWq9kl93Ojv60BodfDbU1yeT9FfxYAQrZPQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/X0kLwr+X3d6A9aqFU12tzq0gioD8bwZkh9BcVRhAvdywi7oLr
	kIpHZM6hZY3r/S2onsikipd4WNkOboojRfZ/L8E95IAewLTZU2zMoIvM
X-Gm-Gg: AYBFou3K0Bq52M+47HalyLixFdzgzGQBvGe3Ot8u3FMaFmOVLaAcaOZKXmFK+NS+PFc
	7CTlbCMoiXgi2kVDvOR1Jr2tPs6/derPYsccfJUjTyGnGzt0ZP6OTZ6fJwATYMUoL+aCCtfQh2+
	k5owEWckamk7+nz3BbhdicrfkSc4DNXi719AJ18jR0rY9JzflWGoVeD4pR73k7HENyuvob0blVI
	RJPPqRPXz5p3iKXtEfti4i6vTdpmUmPnfHiIwhaq8M3iyolszJhFjemxIfZwxl6AgQmqPUh36qW
	nPZV2+r/oyxPdpdRtk7P8HtVRWT9p4vCbiMgV0+r55FL1DdaF3imjyJv38y3DTvxeGIiF3u/r0I
	X9BOswBWu5BZZN1eA1ARpjq3qACkTR9r0Ww3PxAWfSNMV16fQYOKffX5GFk0eUtch81BbxUh0np
	OGcl8kaSYp5j/LhF6WZ0OuWgkFn9uyfc/UiPWImv+vyw8Zxo9RGp9iJ52ohrgJDjoO4nWPqf0kd
	9Jp/BoUiaRN8a0Dzk1xXfXwbUAvaO4yCTT4Yiz0YSyPiSlEp1xikr2VvjyL/JlPb7JETctBw/bX
	LCmUpMRPLEgLf/RCZb2e7t3a5YHbR5VGutXZvJLCkASi6bQp
X-Received: by 2002:a05:6a21:3b49:b0:3e2:aaf9:3a17 with SMTP id adf61e73a8af0-3e92895901fmr13076159637.25.1793874780263;
        Thu, 05 Nov 2026 02:33:00 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb5d66a91csm450865a12.3.2026.11.05.02.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:32:59 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH v2] media: gspca: etoms: bound device-provided length in sd_pkt_scan
Date: Thu,  5 Nov 2026 19:32:45 +0900
Message-ID: <20261105103245.1436719-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105065728.1351098-1-hj351016@gmail.com>
References: <20261105065728.1351098-1-hj351016@gmail.com>
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

gspca_frame_add() only bounds the *destination* frame (image_len + len >
PAGE_ALIGN(sizeimage) -> discard); it applies no bound to the *source*,
doing memcpy(image + image_len, data, len) directly. Nothing clamps the
device-declared length against the bytes actually present in the packet
slot.

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
v2: wrap a commit-log line to <=75 cols and drop the space after the
    (int) cast, per the media-ci checkpatch report. No functional change.

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
+	datalen = (int)(((data[0] & 0xc0) << 2) | data[1]);
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
