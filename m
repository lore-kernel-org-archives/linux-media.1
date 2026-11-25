Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645709;
	b=pgGu4Nm/0D2ULYDFOdYzyJWuxO6TPycm367AHjk+0YFr3tqfhn9a60ldcZZALSul2pCW
	 CGEsc8YY1MyRyoPDJyZ2NNgmzUc+SbJ+tentqISUoza9MD3GzATyX7BrKkbkoq2HULbIT
	 hmTu9Lb7e9IpbajstCvC3rrJZSHKl4KUIzRASp5OBuhB0gwLymTlxEhnxoYIHrE43FNvU
	 2JKPMj3CmstgeqLYU7YIXfQPTr1+EG244b+rnPjS71LqoVyFohQ1uUXw+FMM3TSSNkSrC
	 zDPpJAz36BiLMnlM+i7RXgKb4NoTjPNGq4E8mDd1Dws3IDlKkVkqGc+SfjYTQ0Dr0Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645709;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=bB9dahbauIY6gVR9GUf26/TEEIOmcwn74D5zXKoaRTs=;
	b=1FsIt8rBgimWOSXlUe3vFG9HoI6RIUk/cuEgl1GOSGuLyuoMkNU8LL2ha8oiT12xngMm
	 io7qgGs8plcQa9NudjOvDCLFGHjOireK8L6GF03UOR/rq9RhRy7VWL7FDPM5ZYrhH0ayu
	 6AQpXjO6eAH4rEObrxf3YpPMbLj4Nu+e959kk/9YqL4/yGni8mRBDykt6GvFPsy4h4IxE
	 kF8uroqdnuGWLqJ28b190gGJM3MFd2BteqwJMsxjpfFWuPpiM99/EyWLS+/T7p95J0VG/
	 u0ahU4YT889d7PqcmKZ3esMYqJ1b3YmoPxHDbCMo9OP0o02HaR+5tk7hf2PriQ28BLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gEuAIfW2;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602D8606A323
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 22:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 602D8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gEuAIfW2
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3869accaac2so3791408eec.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 14:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645708; x=1796250508; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bB9dahbauIY6gVR9GUf26/TEEIOmcwn74D5zXKoaRTs=;
        b=gEuAIfW2PwwuZoWNRspnLc6yTnLsXF4VrYR69h/SaRXixoHcD++1Er7TnVuIcgATxq
         LDRSPcab9ONssZt805d131zL+AcHL2t3U8L5HADpSvbVhN3GSOMNW9e6mtTnzougCeyn
         oPpd4N47tlnfiyT/3d5tvNgb8zA3KCCjrCmCFJYiLsHZkQecTi3LVjof4Hk078j+ymmn
         3nLiBV1kEKz+c0tqRA46C7CuRuFKwIxndqXlq3BUtw/J/rDqfuJ4IkPbZIUWGYtDp/6R
         SpAZ7Xb/9eSW/a3V1dsdNa3PLZBtzysvovrSXdi1ZfLm6eCu/uJZFkQMabzwVbn+BsYk
         H4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645708; x=1796250508;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bB9dahbauIY6gVR9GUf26/TEEIOmcwn74D5zXKoaRTs=;
        b=N5du0B3CdhgbKnupjdA8vZhm8ZrPsST3aJthIyiZG56brCq7x3bWFxomSVR+JYmZ4b
         GRgkEKkutar7ybKSdtxuQETvtwfKy6H7dJGpzvKTzOAkRSv+zuM22nxE+byGPQGoXfLE
         NscqENMwFXLXTwzhWRCH9mN0q67/oWeypxGiCRYdx6axC4rBUqZQ9I0g5c29kQRGirsk
         UyreC/6JDhGEXW3/a+1hjB30RCmzN1piIEcw0j4AcvBLmTamXrNXvWV5xhc/2c4no1aY
         edCKu06h2/K9pGc085e0jRG3F6kbGieZd8iEeADHnbb71o/xzwB080YmhTBMfgGORZls
         OVcA==
X-Gm-Message-State: APuU4Z+gqLJUNcieFX/68ZtSCZqnxjG9y4xy6OJNm3RRTtXDqIZPCQEs
	kS5YPx5i7QoYSq34lfOONc5W75Pt9ssmxyCCO1PV0mzeN5/vYkO+JoL0KYYDLbY4hVVd8E6/AOX
	ZtA==
X-Received: from dleb17-n1.prod.google.com ([2002:a05:701b:4251:10b0:1a7:f7dd:f258])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2706:b0:192:a481:361
 with SMTP id a92af1059eb24-1b5568c12e0mr18196883c88.7.1795645707988; Wed, 25
 Nov 2026 14:28:27 -0800 (PST)
Date: Wed, 25 Nov 2026 22:28:02 +0000
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222802.1451781-1-elkin@google.com>
Subject: [PATCH] media: cx231xx: clamp bulk buffer copy length to vb2 plane size
From: Elkin Cruz <elkin@google.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In cx231xx-417, start_streaming() initializes bulk URB buffers of size
320 * max_pkt_size (up to 163,840 bytes for 512-byte USB 2.0 bulk
endpoints), whereas queue_setup() allocates vb2 plane buffers of size
mpeglinesize * mpeglines (65,536 bytes by default). Passing unchecked
len into buffer_filled() overflows the destination vb2 plane buffer
when actual_length exceeds the plane size.

Guard against non-positive lengths in buffer_filled(), clamp the copy
length to vb2_plane_size(), and record the payload length via
vb2_set_plane_payload().

Fixes: 64fbf4445526 ("[media] cx231xx: Added support for Carraera, Shelby, RDx_253S and VIDEO_GRABBER")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 drivers/media/usb/cx231xx/cx231xx-417.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-417.c b/drivers/media/usb/cx231xx/cx231xx-417.c
index 55af8b9f2038..0b3e856f6d21 100644
--- a/drivers/media/usb/cx231xx/cx231xx-417.c
+++ b/drivers/media/usb/cx231xx/cx231xx-417.c
@@ -1297,15 +1297,18 @@ static void buffer_filled(char *data, int len, struct urb *urb,
 {
 	void *vbuf;
 	struct cx231xx_buffer *buf;
+	size_t copy_len;
 
-	if (list_empty(&dma_q->active))
+	if (len <= 0 || list_empty(&dma_q->active))
 		return;
 
 	buf = list_entry(dma_q->active.next, struct cx231xx_buffer, list);
 
 	/* Fill buffer */
 	vbuf = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
-	memcpy(vbuf, data, len);
+	copy_len = min_t(size_t, len, vb2_plane_size(&buf->vb.vb2_buf, 0));
+	memcpy(vbuf, data, copy_len);
+	vb2_set_plane_payload(&buf->vb.vb2_buf, 0, copy_len);
 	buf->vb.sequence = dma_q->sequence++;
 	buf->vb.vb2_buf.timestamp = ktime_get_ns();
 	list_del(&buf->list);
-- 
2.56.1.839.g22a8290db9-goog

