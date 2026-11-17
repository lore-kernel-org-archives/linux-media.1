Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915934;
	b=Fdv+S3XZKRn2D41VK0wO/B0Ci3ImxcRaGGd+uNxCZuO2Hci1E422Tqjlig3tb7FAqCP/
	 OUS+QkTK1ChVcpYpY2pcGM6j+eUW4ty91Vd2KswoVrcEuosYIEKw8DgMP/abjiwsoLyFP
	 ei0djLDrC004f+Eghat0NG6xk+mJFQ1uT3Qhgv1LBBslXweyzFqeC1eQKrK0m+K/vd+vj
	 2VutWfgKLzH9r/aQvrTn+oOxWL7s7rp+fFarUiEEApxKvt+AN2sIKYxUtb13adxPr9BSm
	 0tVIBrhlecE6GPi9d3vEzUxYsipS4eYSWqcijh3p2QzTMqJwSCNSdGZmxy8TpZA0RqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=xEHiK/lQJsiNqCYdsYnexV9SSAq2eRDbdaxychq8MdU=;
	b=d+HJqZcbkiOtjcKAiW4j2ReljrlQ+l0W7X8mFkYf6y4ePlbYRiIlHTHCBDRCk8mQpuOF
	 wBtl1UdI7ODOoJ0rKOMw6tnnScahuMmCOTmdnUcHGtl0YH2vX0VX2V67BsC17mi+D1l6O
	 5e/UgU5zRAMb5chy56MaAVxBAQ5lZpOhrqBi/AZY7O9mydC6w+GyBeCyoP2QEJAXdvbQo
	 r9++46kwjWf+pysGw3aLV9hZ0lm2dC7qOyQOBGLDRLk2cYUMNyiKX797Lgsd1+zifw4ad
	 /avyuQBduIxc3fSE5OdMFB09ZE+Thi0401SdUT5HbrlUa0vgHNbHgClfV3IdcqL9dwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PfcSc1Xv;
	arc=none smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C50B606A333
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 11:45:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C50B606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PfcSc1Xv
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ae0a5c1715so7612281fa.1
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 03:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794915931; x=1795520731; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xEHiK/lQJsiNqCYdsYnexV9SSAq2eRDbdaxychq8MdU=;
        b=PfcSc1XvKlk/DIZONeZkQIZzT32HbHfJqlE0G+YBOOC3LvGz+JT+4i6XHQBrcch6uz
         qKCHb9TIlE60UCro7tYZgWSpPOoVW9XO1Q6mQggeTMwkLcCKWaKwOxYFNHY4htzNy90W
         EAuN0yNbL77v43AgNHoAsz4l84kSsfLFK2k+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915931; x=1795520731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xEHiK/lQJsiNqCYdsYnexV9SSAq2eRDbdaxychq8MdU=;
        b=maVy0EUZ2eg6bqS+FNsIXjl/iQmFFYxE2zgpdkSLPj3yCHWxgl0xJ0obCT0MwwVHa9
         zm1fdJRQ2azOzydGKBgaAun4XdAzuZKWx+PWShsv4Ey9oJacBlXyUtr4UFHXXG2BVMt1
         1CrDx3JGApxzGdXXCtu0RIi5sfEbQZLwk9Xl4fthvu0/jggMIDvbzorGIAdUq/VC1QMy
         w/SmE6/jLYq12tLbjtEHkTyGFmRkZv/SevvbRtj9HHf/YZ/sFy4YtTc9NeCdmkYJwYZm
         QD9i+8hADZdOUd+INNxPO7CyHdMU+eXVdFF1UVQpHrdou+BHOZPz98Zvbnz+RkVrFTin
         GnuQ==
X-Gm-Message-State: APuU4Z+uQAPRs9x+028fmlU5bi21fC3VCQWEeLv8OhfSpf4UkQkmE4HQ
	0rm2Q7CKOIG8vUFH/jJt3dyashabvvSopVyaagocoGZ3QvIIeotHM8upMqMky70LJg==
X-Gm-Gg: AYBFou3c8y54MD2iKrCuISOnmNfJUBVCHrjsISuMia5CuKMELeKPYiZesPV4FlR1Xy4
	kRhTqzNVP7NGh/XsvsIgN63+DlKN4vdDDa9v1ZqdRs9W1iU9edT2n5+lcndaK2GEjbQnu9dN0V8
	EmIeUiw0f6h8oonn06XZmcZ5fzkx2huEFj4FyMgD9Fd5TsYV3Eu+aRlqxvnMfLGQJqaA/P70qfh
	5rN6wxL6Tn1awb1E/dp4CzGuXt5lvr1BL/eBbN1Dwhk92JQYgPMIxRwoIN3DOzUl3BpN/9RiVG9
	VMBt0QKA1rENWWn8qdKH571d+HAqwF+bnTUFjvV0qLgdzp57Ty0jKqr+Rp6IAaYi6UlFSVSPfze
	y2E8f6Wq4bZRz37Fmg+vTBhf3vcHlfRhxlpTCYDZIaJgyyDnXgFyEHVig0q8N+691tDz6R/dr0H
	pu9CbhoRKL0u+eQUVrmQkCK+BMa/AnsAA2NvB/TQtj+TDrtl2o2K25zYrljJqGhhuW8acNUsoqA
	uI+02CDu5L+8/YVA5E3uIjEr2QPCnJCbWe311snwbq+Tbi3Sac4955Fc/GFGPEzKreR+4q13Xo3
	P3tiQ9YtIjNX/xlm6JQS3bsLZtWcz9jXiX/s9Va/EYM/twCVfyDof1ne9SifPIsYVutOlkAep0+
	4oM7pblKybIjBNKhll/+V/y7wHgHfxJA=
X-Received: by 2002:a05:651c:a191:b0:3a9:7c85:a16d with SMTP id 38308e7fff4ca-3ae5c9c3b3fmr6962841fa.5.1794915931605;
        Tue, 17 Nov 2026 03:45:31 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712d9dd4sm3955141e87.7.2026.11.17.03.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:45:31 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 17 Nov 2026 11:45:25 +0000
Subject: [PATCH 1/2] media: uvcvideo: Do not setup queues with buffersize 0
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-uvc-dji-v1-1-7cb3cf3b4b5a@chromium.org>
References: <20261117-uvc-dji-v1-0-7cb3cf3b4b5a@chromium.org>
In-Reply-To: <20261117-uvc-dji-v1-0-7cb3cf3b4b5a@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org, 
 Jordan Moormann <service@jordan-systems.de>
X-Mailer: b4 0.14.3

Vb2 (correctly) does not expect queues to have a buffer size of 0
and throws a nasty warning:
  WARNING: at vb2_core_reqbufs+0x60e/0x630 [videobuf2_common]

If a device has a descriptor with an invalid size, exit early before
bothering the vb2 functions.

Fixes: 6998b6fb4b1c ("[media] uvcvideo: Use videobuf2-vmalloc")
Cc: stable@vger.kernel.org
Reported-by: Jordan Moormann <service@jordan-systems.de>
Closes: https://lore.kernel.org/linux-media/c2c00ad1-b21c-42f9-b3a1-e03a0ad49651@jordan-systems.de
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_queue.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index 3c002c8f442f..46b807b95d2c 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -91,6 +91,9 @@ static int uvc_queue_setup(struct vb2_queue *vq,
 		break;
 	}
 
+	if (!size)
+		return -EINVAL;
+
 	/*
 	 * When called with plane sizes, validate them. The driver supports
 	 * single planar formats only, and requires buffers to be large enough

-- 
2.56.1.708.g77570a6a1d-goog

