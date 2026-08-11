Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6218941A902
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 08:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786438185; cv=pass; b=T/TO3XMakFKByQkEwdakuw8uw285+JwUP59PmnnZY2fYCDiuOX6B5iE175bEbJmQiIlzD75alf48sFCoIt4P3mUUOmV+rmADuJI1ieJ3LbzqyWx/5h03UVTv6T4hnSLLn9jvuTRO+JB7ECrz8zI12Tz33AyNWo8EJ+vgCtOyZu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786438185; c=relaxed/simple;
	bh=ivL+fRFB0SI4FCYqzCCCvnIHn0hdxkIDu8XSrnu613k=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=JADAKz4an/ievowtowwahR3d//YPCAJQUr/MC7dY5qEGcA20ZUTiNcZybKfHG5OAhRjPqZ+Cfh3zHeN0IQ8TRge5RUJoKJ3Ls+FHgzTXLCM2myVZvYzWntODGDPWDdwxDGp70Em7APRh06ikLy8BQF939K097g9vtNgp+ulwoFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e6dcsi+j; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KNybpxIf; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e6dcsi+j";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KNybpxIf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786438183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=ivL+fRFB0SI4FCYqzCCCvnIHn0hdxkIDu8XSrnu613k=;
	b=e6dcsi+jwwbHA91iTEjFxRAYrLFfs6nNOzHPAjWiU8aDsL0YrvYwW855iLSXm3BErXOTI2
	MlUUqvhaE7y92n2F8qv3N4J7RZQ6J/OHN1UXLO2KsMBsD3aoIn3nRA7lAYY8xwiZHCXiWC
	UjHP5UcUMzCuczLnVW25QUlVRloIkf8=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-BG8J3_aHMmaiiAMCvhB1xA-1; Tue, 11 Aug 2026 04:49:31 -0400
X-MC-Unique: BG8J3_aHMmaiiAMCvhB1xA-1
X-Mimecast-MFC-AGG-ID: BG8J3_aHMmaiiAMCvhB1xA_1786438170
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b1bc2e44e0so635952b6e.0
        for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 01:49:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786438170; cv=none;
        d=google.com; s=arc-20260327;
        b=hb9vZO09dtEWW99dRDVQ1invUjzN8lBPwNvlC/ZqUXsXOerNZ8CxUauZuyan+8y2yX
         FBJjKEpqKbCU6ZZjhYp2zt4SLz11wsMeKA+hP1HbLeXM/o8yI7TLuugNzFUYrRSnchrq
         FPQFqpW2QzcyTv+K0HgUQaJEVWJTIOmbVKJkJsR81NeJUH5leUz44eZ/r69ttxur1IEF
         bxCr6O0s6P5iW/oydBRmFpmf3SPSSjWz0dN8OuGoGNaP7a8O/3/AdKwFe6VTxiqBANmP
         +8AJw2YibqKusLN6WCWNvwqOBTywgWdzJRXpTVefdevkxTlktn9dffirFEC09ggl2YKO
         L8Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ivL+fRFB0SI4FCYqzCCCvnIHn0hdxkIDu8XSrnu613k=;
        fh=mrFmrHlafWYLA3LicceqfFqXXYnmlJehvxvjYznKDrk=;
        b=IB3I7AZerFVO4bMSl/esBAdc4lHw0c/SlytbZD1t8BERaGGCSCgTHzuioNq9pqHXoR
         V7WiNTvcfnImPoZLXrGkEWto5nqIeUFFevgsDmwNtYl8gChYgQD7KVx0GujSAQWD/1v7
         thU7W/OODeirQ2Blwqke5EhSax8PufGzoHrlWt1Oku4d5PSiPf7Wwif1qB9j1RBHIl0a
         33EdZtSGBY0DR20UlZjaBGyPJrxIWxWfrLr+0wzVyeLt9UX2mHXnihaa/jBdsH0xeTIE
         o2KLRiCniShaFPQT/sOQbnnjToMPXtdWo6LhWu0hEs/a6//ObQH1IAqOPzouuUo6yd5u
         8UHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1786438170; x=1787042970; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ivL+fRFB0SI4FCYqzCCCvnIHn0hdxkIDu8XSrnu613k=;
        b=KNybpxIf6DmctulV3g6yU5TOORXdhzZqb0difJAhQBkKWXznnRDgokpDAILPqfqWtL
         1LNNMZc9WJq04wrvtqLn5eJ4A7Jqy49/2fefrjBdPRBVVaMYoiiZVHZwNlHUVYT2uUBa
         ynq72SsO8YCsuU5WvE/TI223vFlOctj6ELm3JZHF8N6QMH/dhQ6GqxLYaNcQ7B7xh+s8
         IHuOK85m8CDphdxaYWfPKAgzTPZrGubT6OUhcbcvgwZbPtsIKfROvuwff5YiTxF9bDhk
         9YL+EYvcSwfhmbvjb+s4VEGJwfjKDjKidN84vBg8onKfECzNDAu3b5fPw/It7aI+p1Sa
         F8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786438170; x=1787042970;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ivL+fRFB0SI4FCYqzCCCvnIHn0hdxkIDu8XSrnu613k=;
        b=DADBkWXIRqSd3Rk2xDKMJbkpa+s6qbllhfC+QLf9VGZva7XAI2wFqSAeq045LI+WOs
         FpbRq9jO3F4Dudd7RB8q9CsfW+bpslYSJWf5f6ngS2sRUKjO6mVj5+XDbwh6NhB/aTqS
         as6w44nIKqoCMbYCeK6JaZvi5HWhA/wQWmUObOkqXJgIwG+UVSuW8odn7iFqVk3rMOLV
         yQoorZ84V6gbJs62WW7LfZaRYc+RyWJYySmV5rAAGNjOGp/nXPP3sn9S9NTd3kel9au9
         5hnCZCtMSAi7xc+C7U8YwmG11y0neN8JtRwYIek++Lx9nTym5bHFbjI1VZfy1DekQD5O
         3zMw==
X-Forwarded-Encrypted: i=1; AHgh+RrOfZU6sEJTYv2BCIQjULjxjh2lHjq0HY9L0oW2shPjiodhlXbTrjmQ7w5+iLxp+Xh3JoGbnfz7lSlzSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyG2/qkM0rnP95FbAEYUpTJvoLtWf2iNyWPnW/VYr+cnUQ1JDng
	ZgxazKM0huIGBWmpDq/wAz07bz/pdirTsBm2Z++1DPE+PN9Arg66sypNvna0DDkQvXUwl2PccCG
	1pB+LxSxbmSM7+tcSPTiHXO9mTQHIkDQcSEg4EZ+IuzwDA5148ILiov7i4vU6OUShGuKyEe24/A
	oxDR1ClmdO25vYLoP5fBU9cJf/yQjabQJraF7qhEY=
X-Gm-Gg: AR+sD12E2bxjpOxrUrftTG9eEL4gawthecxFeGt/n1g7esQ6T20Cp4pBd/pgtFSMrqy
	vwgX50duZkQfRVB/hObeDKsBZYL3ESZjNrCN3C0nMZDCU7GaFaZ6SElwMhYLUNOvm+nwQeWbi7Z
	0acNodSrhqD0yomGQI5KOAYSNVqOYIAERChrHe+CCe8jSlQNp+s+YijCnOwOJ4P0L9KL6a9nEsB
	uP0c+9dk1gss7da+j/sTQ/2Q/1vc4Y4riAjJUZknai35A==
X-Received: by 2002:a05:6808:30a1:b0:4a0:6d4c:7cc1 with SMTP id 5614622812f47-4b1fd268fb6mr1261339b6e.0.1786438170474;
        Tue, 11 Aug 2026 01:49:30 -0700 (PDT)
X-Received: by 2002:a05:6808:30a1:b0:4a0:6d4c:7cc1 with SMTP id
 5614622812f47-4b1fd268fb6mr1261306b6e.0.1786438170085; Tue, 11 Aug 2026
 01:49:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Dorinda Bassey <dbassey@redhat.com>
Date: Tue, 11 Aug 2026 10:49:18 +0200
X-Gm-Features: AUfX_myup5Cn7XHNiGhYWSQ_DXHMKD_bon7ysZ5L9_VfRayW5JmQ-J3z0cr4fPg
Message-ID: <CACzuRywJFBi8VS9iLNFABgNvjK1_cmYLzdjwjBXdZBggFr1SWA@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] media: add virtio-media driver
To: briandaniels@google.com
Cc: acourbot@google.com, adelva@google.com, Albert Esteve <aesteve@redhat.com>, 
	changyeon@google.com, daniel.almeida@collabora.com, 
	Eugenio Perez Martin <eperezma@redhat.com>, gnurou@gmail.com, 
	Gurchetan Singh <gurchetansingh@google.com>, hverkuil@xs4all.nl, 
	Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, 
	Michael Tsirkin <mst@redhat.com>, nicolas.dufresne@collabora.com, 
	virtualization@lists.linux.dev, xuanzhuo@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

I've been working on a vhost-user frontend for virtio-media
in libkrun[1] and tested this series with vhost-device-media[2].
A few things I noticed:

1. Wrong constant in vfl_dir detection in virtio_media_driver.c:
>
> + if (vd->device_caps & (V4L2_CAP_VIDEO_M2M | V4L2_CAP_VIDEO_M2M_MPLANE))
> + vd->vfl_dir = VFL_DIR_M2M;
> + else if (vd->device_caps &
> + (V4L2_CAP_VIDEO_OUTPUT | V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE))
> + vd->vfl_dir = VFL_DIR_TX;

V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE is a buffer
type enum, not a capability flag. So it should be
V4L2_CAP_VIDEO_OUTPUT_MPLANE.

2. Kconfig architecture support

> + depends on VIRTIO && VIDEO_DEV && 64BIT && (X86 || (ARM && CPU_LITTLE_ENDIAN))

ARM64 is missing here, so the driver cannot be selected on
aarch64. Also, CONFIG_ARM is 32-bit only, so 64BIT && ARM
can never be true; that branch is dead code. Since the driver
has no platform specific code, this could just be:

+ depends on VIRTIO && VIDEO_DEV && 64BIT

as it already covers x86_64, ARM64, and any other 64 bit
architecture without listing them individually.

3. Error sign convention:

> + resp_header = sg_virt(sgs[out_sgs]);
> + if (resp_header->status)
> + /* Host returns a positive error code. */
> + return -resp_header->status;

The comment in the driver and the protocol spec contradict
each other. The protocol.h describes the status field as
"one of the standard Linux error codes" without specifying
a sign. It's probably worth making the protocol spec explicit
that the host returns positive error codes to match the driver's
assumption.
[1] https://github.com/libkrun/libkrun/pull/811
[2] https://github.com/rust-vmm/vhost-device/tree/main/vhost-device-media

BR,
Dorinda.

