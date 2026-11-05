Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793881075;
	b=3/WGNtjDwJxnT+hANzIc+rD4GlQ9Hxw08RQtNlXYLeocATFX+8UEaqOXGMHk7zwpzQuX
	 Ir98nsfHRKFZgJiZpq7MFlcwt7ZlUwuXqYKv50FofltlW0Bw26Bk6SHI4EetOO0jn3MaK
	 g4wCm7oY6aQBBnZNPNcOjnACTSF59kgt6bAqU4YZK/975bvm6/WpHAhLbtdENjsQSzmSj
	 nSmP8y3GSAXQCJ5gqwhJ/gKhkniDQTMytVWjCC/CmRiY0SgTNA9RUCJQ9K2S4OgAz/ake
	 TCyPSBjzwjfXX70eDRSPl4foic/CTh7WPRGt0zv5ZWdTKmwnlkzad6YT7Ca/lmxaFwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793881075;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=b+uH6WmJ4dKpiVVWC0is8ktZTKKWmWBCxyuQvk6QJv0=;
	b=IrMNg/uCZRdM12lESPR4arHroiktmROZtk51cyi5/5CHCy8md8r+FornVVb76RJuIvk7
	 M0LHJGNujQ4V8ffqJZhImdQFOR43Sgc5Kp2j1Nu0gYgN/a1dSSickhD7VzrrETRCMkiC/
	 5sL6/ZFbbUW0eBMfASl4oLLboC9OwXM/e+S7VZp24ZThGIYlBDfLtYZ62MMdC/wZfl1dq
	 yyheFAckAA5VB9Co5Le7SDjICcwt3pq4a4s66DDNZJVyXm3Id6eJFWsneueu1aXkaIoJ7
	 eqmVTXAufZWwVIY8TwhfhyQChrPrby6jA5oJhFOpYGFsA2I0VUK0q4Tmqy0BtObjVBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TOXBG2m7;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5A5606EE98
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 12:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D5A5606EE98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TOXBG2m7
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ea7987517aso10085315ad.0
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 04:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793881075; x=1794485875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b+uH6WmJ4dKpiVVWC0is8ktZTKKWmWBCxyuQvk6QJv0=;
        b=TOXBG2m7FJQ3Yh+WQm2NULGJ/tRtV0VIllgqJgUZIusi/Qn3STSU2ImWzMmDAVE3VL
         Q4WJQEXiu/5fZB8B1rYG0BJClWpaXLBgcCxYs/QBOlX3j9jI+HkSUjkE9FZ965f7WQMN
         leQOcL1i+nxlMc8m75D6XZao3PEmlCwGyUk/C/EAIiirOz6VNZn8CKg4GYRtsdndwzCk
         3d67G8JRsh81q62mOAbi7KoDcDq6U/IoNTCY8hV/cpS/tJZGPGX42X3HhPu3p4tFvROd
         85J1WqhrjvrLqvKl5Qmglz8Ej7YksZQmnXsMvR2TtmHs8wjsZnfzMA99dgVJcFRZumpB
         bOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793881075; x=1794485875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b+uH6WmJ4dKpiVVWC0is8ktZTKKWmWBCxyuQvk6QJv0=;
        b=j+78Q2lyKNlnt/o1dVJ0bPGTcEAoRMxEfTaMOTxmiBllou54rTIKfZnkDACU0CCk2o
         5BXlHBaXBJFtKx9e+7P0nz2mcl6lAKsGJuxGlm+bUNkoBKTBU5pI7gr4/FMAWzteh2x7
         F0QMk+LbkutjEofoA+k4sLv7YCMDGbwKdfWewurrWpLI4WQjNYt4MXS+3ijKxZNUebAH
         uPtchWcf+3wLkmKRwC/LfNGKkU3nqu6vu1wxZWuyuKdgMOvo++EhWukZ5N52xHWEveNh
         1z9Jd8gR5Nuq7SAa+EEPJytRky1BLCgJijiDE0LJOiUHuDtVyoVr5DiCUmR6FnLy1hHS
         vvFg==
X-Forwarded-Encrypted: i=1; AKwUvByxO/YcHPodviFabZUFq0FG0Vk/iqq4JyNpsxaZCNKo7CE/6gqLqIBiLfkJHaA3mgduG2rR0B8nNxa9FA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+0lraHHtWJ4Tx5+1v3A5sF/HIxj4m2uhkl8ZXeClst4mH/nKIQ
	uKKNcyBb4NlY/Hyj+kGpxp3EujYFYOE7cjS90hBMJglnTo2zQozmsqnW
X-Gm-Gg: AYBFou3THpmO+XajdvsVyGhWFC4e/gxenKNi06lOB0WxGgPTFaC6LpbPXxwVPwv07o1
	2GDIfY+3xbS9OiyJnJ8wsmHn68TQbJ6f++8c1w2vjzfd+YhU7sJwCIO/oQrLe9wRR3qGMRLwJn9
	HLxAzi4h+1BF7LiGLY1vSo7Lhunm8grp+ZvAKvkORxGXdj8KoTjO4x24j+KdgTk5ypYzByIOcCN
	j35YReleR5bVJNVUVcwBAAm2NbcB6hqx5VsYI7vCGKW1nKwbRYoB+qmsKbWo8NGEmxS3es4xk4l
	wgZOoA6uUskLaOL1ipknQhsEvLq+bHviOMqxzrvcvsDzv7ikXMMWeJZuZ12DTtUS8CX/VHOoJgd
	SIHfUQfg0nrNHZLdMVY9dQZ4BkowYQ/8MVBvnqb6y+G0sMqDgfJmQr2mbKxmRm6VZiKl0kAY9UK
	sOwh5/nBWIYOjC+CiMg2dkNXz7jJRBRwxzvVy0EvoaOCkttCVKGpxunLzzk9yLmxaQ9X8oIEYtF
	+QSTc2wCgpb1TOUypk09otJ78uC3cD7Nis6TcdG8xkOGrppjarjjCJQc6ofApJTpturLxim2zmq
	56v6Y5tnSNd34hWMQ6FyyglaKyDgNYwiOS2wWFcKq/evXlpR
X-Received: by 2002:a17:90b:528d:b0:3ae:5525:dc25 with SMTP id 98e67ed59e1d1-3ae89850a1amr15976995a91.51.1793881074813;
        Thu, 05 Nov 2026 04:17:54 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31cd6c0sm3645307a91.13.2026.11.05.04.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:17:54 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bradford Love <brad@nextdimension.cc>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] media: au0828: reject too-short isochronous packets in au0828_isoc_copy
Date: Thu,  5 Nov 2026 21:17:39 +0900
Message-ID: <20261105121739.1590426-1-hj351016@gmail.com>
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

au0828_isoc_copy() strips a 4-byte (or 8-byte, for a field-start packet)
in-band header from each isochronous packet and computes the remaining
payload length:

	len = urb->iso_frame_desc[i].actual_length - 4;
	p += 4;
	if (fbyte & 0x80) {
		len -= 4;
		p += 4;
		...
	}

actual_length is only validated for <= 0 and for exceeding max_pkt_size,
and len is a signed int, so a malicious or malfunctioning USB device that
completes an isochronous IN packet with actual_length 1..3 (or 1..7 for a
field-start packet) makes len negative.

The negative len is then handed to au0828_copy_vbi(), whose length
parameter is unsigned long, so it is sign-extended to a value close to
ULONG_MAX and drives the copy loop:

	for (i = 0; i < len; i += 2)
		startwrite[j++] = startread[i+1];

The only guard, "if (dma_q->pos + len > buf->length)", is defeated once
dma_q->pos (an int) is a few bytes into the field: pos + len wraps around
modulo 2^64 to a small value that does not exceed buf->length, so len is
left untouched and the loop writes far past the end of the VBI vb2 plane,
corrupting kernel memory. (au0828_copy_video() escapes this because it
truncates len back into a signed int that stays negative.)

An unprivileged user able to open /dev/vbiX and start streaming can reach
this path with a crafted/emulated device.

Skip packets that are too short to hold any payload once the header has
been removed.

Found by code review and reproduced under QEMU with KASAN and no hardware:
with an emulated au0828 streaming VBI, a field-start packet (so dma_q->pos
advances) followed by a 3-byte isochronous packet drives len negative and
triggers a KASAN-confirmed out-of-bounds write of the VBI vb2 plane in
au0828_copy_vbi() (inlined into au0828_isoc_copy()) in isochronous-
completion softirq context. With this patch the runt packet is dropped.

Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
Reproduced with KASAN under QEMU (no hardware): an emulated au0828 over
raw-gadget, with dummy_hcd extended to deliver isochronous packets. KASAN
reports a vmalloc out-of-bounds write in au0828_copy_vbi() (inlined into
au0828_isoc_copy()) in isochronous-completion softirq context; the
vulnerable code itself was not modified. A self-contained reproducer and
the full report are available on request.

 drivers/media/usb/au0828/au0828-video.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/usb/au0828/au0828-video.c b/drivers/media/usb/au0828/au0828-video.c
--- a/drivers/media/usb/au0828/au0828-video.c
+++ b/drivers/media/usb/au0828/au0828-video.c
@@ -599,6 +599,9 @@ static inline int au0828_isoc_copy(struct au0828_dev *dev, struct urb *urb)
 			dma_q->pos = 0;
 		}
 
+		if (len <= 0)
+			continue;
+
 		vbi_field_size = dev->vbi_width * dev->vbi_height * 2;
 		if (dev->vbi_read < vbi_field_size) {
 			remain  = vbi_field_size - dev->vbi_read;
