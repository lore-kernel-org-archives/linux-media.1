Received: from mail-qt1-f202.google.com (mail-qt1-f202.google.com [209.85.160.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBCE2BEC34
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 20:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782419163; cv=none; b=f4sLVu6EcmyQY5gz1vhm5/5lfiZ2/otJn0BNy9QuDyXrcrryuxOhN4ecSjRfh18AYu+YAGG+UfLdQTO0YMQajJSB1ug2Gy0ckisyXiYasAk7pIY9Eq9Cb7/59I5ND5tlEgVu3dqvUUVWwF13sB1BOxmM1ozgOm4YQk8diXX7rnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782419163; c=relaxed/simple;
	bh=kH/nWE1uWj4nPX0coh0oI7W0Icpip5M6GBcvfIU9LV4=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=QXC3ioFlCmI9BtrlwuYS6CWpQHEXCdUsbr8cQhOe0MnetP4lLaTun9SGJMgMlP7F/Z3uUT0IhEIFokBc1Xucd2KjIILm2QA8BKratW5e+NVoFQ0Y5Xv4RUWFFtswcmeILyPHOV7GautDpt/JlTu6aFPPGRBFS7E5B4mS7PDwXe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--briandaniels.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ijpriCR3; arc=none smtp.client-ip=209.85.160.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--briandaniels.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ijpriCR3"
Received: by mail-qt1-f202.google.com with SMTP id d75a77b69052e-519fdfbd340so2921101cf.1
        for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 13:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782419161; x=1783023961; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nQTuInYbw/iuI+/cpa7ndKurPDuK7LO01xka1fr9WE0=;
        b=ijpriCR39EKVKVv6a2yPCLs48Pgbjj0EmHPg7c8+Zpz5d2pP0yHVhMo48u+xtSd2js
         TZCJOBQLhkC7bvqdAf0nAyNyWSMdgXnO8JqfBohXOgIcnXlmfOQDqKqRaCdpXwuWB8G6
         EAYOS1g04ZRHh4QjtIc/hZEFW7fpZSuGI6Pw8LI2IPeHMHZZQRnQ2A3EvqSG2/pNEbej
         8ZUwGUlivLXL9T/F/k1XKyKwOPGzvUBwq2SQjXHnsUYIQ86od355tey0rfY+r4rrV7/x
         UXDhPAjji+2TKruuLewe98UNysDckyHqipbXYXh9aKkjYncy/z2IDeBo4m76offDyJjM
         oJjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782419161; x=1783023961;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nQTuInYbw/iuI+/cpa7ndKurPDuK7LO01xka1fr9WE0=;
        b=rUGUxSRDtJjDru0M/zgRWuR2Cy6A+8HOZgW1JN65N1aByXQBqPFn24wWBUtB1nJufH
         3jKKYgVW+qscy5cFbWJIEZggdycX26n6EVUfQE1TJZRFhTxYAoRh5e5OwQoUOpEDp8X7
         4HFuVE9XBNHmcaUnnlaycwXQMt3ZpHUi0HIxgQz2E6zsde1BTsXPtUUzadOkoNZ4044z
         Iq9vbY9wAvxmOG3MyUuasmgQelaziucgwnHmkfMh6afkynm3Y4n5t+ixReNX7SeMcrAL
         pRWTHSk+pxDRgF5dQ0PB4T5BGBj8Zz8U9tuqvyco0R0WFmkNqX+G7TbKNCPJh/CqDSU7
         JXDw==
X-Forwarded-Encrypted: i=1; AFNElJ9qCVKvRKhjq+0261q4gJ8HiePvgeyHZQ+2cwoDQAPW+JMLaLE6yTy87fq7b6mDUlfw1IiPfcs7aw3N5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyI/yMZTqbmw1FK4ife61NAVZQRDn2BhotutiOeCBoz2D6J+D9+
	QuX/+JiUnbgMx2kUwJlhRQ+4Am+6XSb3HaVoU3a+kv5JqDlySY/AqeEhFAMfjPPEj3upqhTIJGm
	9FhX/h++7XRKC1SGVgtGIUsBWODQl
X-Received: from qtbhx10.prod.google.com ([2002:a05:622a:668a:b0:517:7852:3f03])
 (user=briandaniels job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:622a:514:b0:50f:b61c:ec4c with SMTP id d75a77b69052e-51a72149df7mr49243091cf.7.1782419160377;
 Thu, 25 Jun 2026 13:26:00 -0700 (PDT)
Date: Thu, 25 Jun 2026 16:25:46 -0400
In-Reply-To: <ce63d29a-8c76-4a3d-ad8f-144f8b709cfa@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260625202549.2988460-1-briandaniels@google.com>
Subject: Re: [PATCH v4 2/8] media: virtio: Add virtio-media driver structs and
 function declarations
From: Brian Daniels <briandaniels@google.com>
To: "Bryan O'Donoghue" <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Brian Daniels <briandaniels@google.com>, acourbot@google.com, adelva@google.com, 
	aesteve@redhat.com, changyeon@google.com, daniel.almeida@collabora.com, 
	eperezma@redhat.com, gnurou@gmail.com, gurchetansingh@google.com, 
	hverkuil@xs4all.nl, jasowang@redhat.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mst@redhat.com, nicolas.dufresne@collabora.com, 
	virtualization@lists.linux.dev, xuanzhuo@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> > +extern char *virtio_media_driver_name;
> > +extern bool virtio_media_allow_userptr;
>=20
> This looks a bit funny to me - why do you have externs in your header ?
>=20
> =E2=9E=9C   grep -r virtio * | grep extern
> arch/mips/include/asm/mach-loongson64/builtin_dtbs.h:extern u32=20
> __dtb_loongson64v_4core_virtio_begin[];
> Documentation/virt/kvm/api.rst:    - virtio external interrupt; external=
=20
> interrupt
> drivers/gpu/drm/virtio/virtgpu_drv.h:extern struct drm_ioctl_desc=20
> virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS];
> drivers/net/wireless/virtual/mac80211_hwsim.c:extern int=20
> hwsim_tx_virtio(struct mac80211_hwsim_data *data,
> include/linux/virtio_anchor.h:extern bool=20
> (*virtio_check_mem_acc_cb)(struct virtio_device *dev);

You're command will only return lines that contain both `virtio` and `exter=
n`.
If you instead wanted to find all header files that contain externs, I beli=
eve
you would want something like:

  find -type f -name '*.h' | xargs grep extern

When I run this I find many examples of `extern` in header files.

That all being said, the reason the `extern`s are in the header file is so
files that include said header file can access those variables. In this cas=
e,
these variables are used for different module parameters. We may be
removing them though, check the other discussion thread.
