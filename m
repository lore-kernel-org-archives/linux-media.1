Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770398;
	b=PPZxnjbcxg97pDz8hYamuL0iW0qqDay9FuVLwNyXZMO/lEEJtivKbyAJ1iPD8BMmpasB
	 o7j/7nvIy+wbKKV6E0OFu159aowTJ9oOBAcfa5l5ga/EgndBJzrAGQXiXJqvQieG0SSpJ
	 pCtdbB8I8ZbJWMxHci12BCmaceBw2fAYXU+um0TvejD3S2K6JoHzv4PDsJo7+uOgRQQpK
	 DFqF0aySACBYizYmc80qgOCoNvYDYtzgtIUQqD/Pu1FoPFBHzMpFba2z+vH9gN0KZ45u+
	 iAZc9+Vk2YDCPScx1JlI1qCxmtktMqAoL19drbPqKRV7+0HyntVNqfAuejXPhperBqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=G3BGRngaI9F1CnRF4P/xvzYqrQvw8BmIKTivHk14ioM=;
	b=YD2Tn8Sej05jO+Dq3RytMaHZvyPpzQEwTbxqRaFwxC0BcM4BoV2bHhdjWEaRGLDL41T1
	 ZM53unefn6/GYf7kjtGa7cXnI3oau7OabMQK6qyTmJFE9j9U4XEFWFZ4D7L/PzE8UMwym
	 Dsa1gh30LHtEbVFWeQjGq2nU2Vs7sxT/nKGyYqGETG0yLVEhcI2uuCSOxXyYOfPUtQNVy
	 lDjLKSUZXKq0kiBOe+EJniieNiIRNkcHSXTJ7gWCMsc2X+46bVI0diJ/fIpdxIBOB7gj2
	 CpPemmK8jBsJtj5JJ2e91yvFaHtf2FIsqwAuAmsfOYC3KDQGuO8D9CX4XoJ8IoHDzvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yhXNzEI3;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9BF606A31C
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 09:06:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E9BF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yhXNzEI3
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-386b8f2f671so4561238eec.1
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 01:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770397; x=1796375197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G3BGRngaI9F1CnRF4P/xvzYqrQvw8BmIKTivHk14ioM=;
        b=yhXNzEI3dP2Y0Mcui0QTwRlE1ToVcfBwZup6yfrwV0yxzQQskU5nraLUhrh015b4WK
         S+cH+vbAyzgj0H2gPQNZvW+StZ3sjYqmWOosN800aaq8+GvRdNaEwR9IbcbrycfpcZPX
         L/uw+zdZbHdPAhLigIVIPmqYZQ8rOB0kWoyahjGuusbG5bxnI8tQC1rsSXrc9YaIcYQ1
         ArprQH8fiR9psWu76MkybMVX8KpzifK4UQ6R4jMbViUCPo+h7NAZMq4JqdW7/pG/ohZt
         HDfHct5NfbQqEuhBHDKfJUj8XN9yFe1LJ9XShB1oTefxpPTGs+KtN9KH/80nz4ywhdSq
         9XJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770397; x=1796375197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G3BGRngaI9F1CnRF4P/xvzYqrQvw8BmIKTivHk14ioM=;
        b=Y1SEeNgtBpN8YcVx5ncNVMajX7GNWP3rNAtgJOllOP0wuOoQld/Dad3W9OXuxZBYMo
         DCE/DfkoXJPcRU3dkw7qUXJb13Qdvxh6LzP3zRW8+c5KGmvcWGyLyhzDpwyQWlq2eeRT
         Bx4uAjaD17NN1bPaIBM/R8uHXAKzmzf9zrt8AyFEQdr3+vTILA4dWZtS7nhW23yNfK1c
         VtRSbDrXaC+HpMRYT8K+0ugaSYvkL6rxjaNYrPgWkWsXJjArv3O5fCdNBc2+1vJWjV1l
         /rbExLsjDVIq1XH7MH5AEO2dCDU5ed5c6EWfXQEoF7rjiiZA2wl4SQ7+D4+dW0plJ8SN
         YKNw==
X-Forwarded-Encrypted: i=1; AL+hErFJX2/ZL8GP0cP4J1DkgRmM6T/6ITLhCAgetfhtjXAcgHPvEu6UHRbeNP3tU0bvdK4LPvmuQPAYKXuV1A==@vger.kernel.org
X-Gm-Message-State: APuU4Z89upwainVY+g+g4ecBs/NiXMr3/3CycPzz0XX+7o6LKWXTzjha
	m2TduAbxuLuYRsIck61XBLxZ3i+GvzRPfJnRrzfpfGuLMevmy4GSabF3
X-Gm-Gg: AZFdTZcTcAWDYvdPURmPrPVBnytGHUGalFLc3prsrH1EGrZSJnjy/o164cygJfHlaa/
	Ye0rxhbxi/tjKiQSQRvyDozPmm6acnou9LaFKubw68FOZ5qx2YIiYdd1myhfjZSzhRCO6+NJwos
	+Z+ub+lM5KxPspzpmDVMnHQgIV/bjj/oTsFShnT4yi3DUuIxzkvPqjy0d7OrnsS5xG3Sq2Th0+W
	RTTVyY1kpOD2o258UNG6//Vx1WWi9F54TmlCGIB4K6bOyKld8JGGIDiN4rXOe0s/kEyoHDRgk2n
	bSitp0rtiUnVhpB5aU048dbXd5q+uF4qHwHvd0K3OWKvQHlRkC2VdLSp1l0PpjavUrtjL6ORGU5
	XmpfpUR2esu86Ja4GewMSZ86fusbklBUnsEGdOFyq5EG13XLDtIlUr6wB47/WNg8spnPT5buuNL
	8rHg3UOyLNXbnFQtCZ3rYhUXoppyRXOdpj9qRSFysYNIcGG5dVrxu66Gij8QKZlyZDytclKrhBY
	qFjcO/RLxzxHWn/wqdyIpxcv6TPI+lHxPXz/u/u9xK6ISg1StEa+3zEJhIjEZMV4AelrI2+4ZkC
	pLvlohIGLK7ozMZD57Ni02NzvcAGgjY7lRU2iG9T8Dls2BPDpbk3Wl2MXH4NlzI4E4gjKwW3rel
	J
X-Received: by 2002:a05:693c:60d7:b0:386:a01f:a31e with SMTP id 5a478bee46e88-386a01fa8a5mr20886475eec.29.1795770397337;
        Fri, 27 Nov 2026 01:06:37 -0800 (PST)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567ea2cc5sm64837608eec.29.2026.11.27.01.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:06:36 -0800 (PST)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] media: siano: Drop responses shorter than the message header
Date: Fri, 27 Nov 2026 17:06:33 +0800
Message-Id: <20261127090633.162540-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
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

smsusb and smssdio set cb->size from the msg_length field that the
device sends. Nothing checks that msg_length covers the 8-byte message
header. For MSG_SMS_DVBT_BDA_DATA, smsdvb_onresponse() passes
cb->size - sizeof(struct sms_msg_hdr) to dvb_dmx_swfilter(). A
msg_length below 8 wraps this count to nearly SIZE_MAX. The demux then
reads past the end of the buffer pool. On 32-bit big-endian hosts, a
short message of another type also makes smsendian_handle_rx_message()
byte-swap words past the buffer.

Drop such responses in both receive paths, before
smsendian_handle_rx_message().

Found with a CodeQL-based static analysis tool that we are developing.
Reproduced in a userspace harness under AddressSanitizer. Not tested
on hardware.

Fixes: 2e5c1ec8865a ("V4L/DVB (8258): add support for SMS1010 and SMS1150 based digital television devices")
Fixes: 319afbf97f20 ("V4L/DVB (11240): siano: add high level SDIO interface driver for SMS based cards")
Cc: stable@vger.kernel.org
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
I used an LLM to help write the harness and this patch.

 drivers/media/mmc/siano/smssdio.c | 6 ++++++
 drivers/media/usb/siano/smsusb.c  | 3 ++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/mmc/siano/smssdio.c b/drivers/media/mmc/siano/smssdio.c
index 41dcab816216..eafb20a7c357 100644
--- a/drivers/media/mmc/siano/smssdio.c
+++ b/drivers/media/mmc/siano/smssdio.c
@@ -226,6 +226,12 @@ static void smssdio_interrupt(struct sdio_func *func)
 		}
 	}
 
+	if (hdr->msg_length < sizeof(struct sms_msg_hdr)) {
+		pr_err("invalid response msglen %d\n", hdr->msg_length);
+		smscore_putbuffer(smsdev->coredev, cb);
+		return;
+	}
+
 	cb->size = hdr->msg_length;
 	cb->offset = 0;
 
diff --git a/drivers/media/usb/siano/smsusb.c b/drivers/media/usb/siano/smsusb.c
index 0fdc2e0950b7..8c351422a6ec 100644
--- a/drivers/media/usb/siano/smsusb.c
+++ b/drivers/media/usb/siano/smsusb.c
@@ -98,7 +98,8 @@ static void smsusb_onresponse(struct urb *urb)
 		struct sms_msg_hdr *phdr = (struct sms_msg_hdr *)surb->cb->p;
 
 		smsendian_handle_message_header(phdr);
-		if (urb->actual_length >= phdr->msg_length) {
+		if (phdr->msg_length >= sizeof(struct sms_msg_hdr) &&
+		    urb->actual_length >= phdr->msg_length) {
 			surb->cb->size = phdr->msg_length;
 
 			if (dev->response_alignment &&
-- 
2.34.1

