Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD2B3CBE80
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 07:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443167; cv=none; b=BFZSCPjp+VJyVtLAVvc538BRYkKRKAlEVc7kwQ+G779tqTjJ2wgiihodJHMmVwLkC8tx4ovMa7BmIuR3Rkhs0ZYILYjV5v4ZfaAaau7y17z37+dxfkBrtZfxNe1PBhwlcwduBMKiKRuUKXddb8g81gcNr1FT++aMgcDSJpgJXLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443167; c=relaxed/simple;
	bh=SMQ/AIdgJkr5O5fjNFTHt4fefg0SwuXDpd4904cBtmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XxeYZ3zfKKnoyfea01/xWCmKsWcHSNQGBnSm6Re7eB33n4R50iETFYSqLox0G0exzBG9IvUHwgf4u8YxtDydzFuE2jW4t2IqKrF9hmpMt5pazmwpk/4QUqr9Nz3v/Q/38GYw7Dql7XEo0psc3L1JecdCmH4cVR/7lLyR2oVPZyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=okLRWIeE; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="okLRWIeE"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so49362565e9.2
        for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 00:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791443164; x=1792047964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SMQ/AIdgJkr5O5fjNFTHt4fefg0SwuXDpd4904cBtmw=;
        b=okLRWIeElp920G0IBHYkDb6CFSJubsb8t0zT1FdAR+nAbYW/a/noXRfIU0IgCWAS0H
         M/RpBRbN+/0xM9328YI871UvGP7doePKgFS6hHNPeyf/V4paygF7ylXZ1+n8zrdDNnU1
         XaCbSoIhjvK2ikeWrfer+XEY0B3rbeQInP/gPCES/lWZ/BdWTf3m464syCoLqdCN2Gx0
         oH12NV+5t+NsdcEytrz6w1SOP27HbW4UlIBgOlqtk7RFOTSvLU1x1SZvQMpSNQbKKnsv
         9Xh0ZW6wDIckFiV91mLzzRYtC9Jpmni76ACvolQYplPwJzXa29HjkZilsfKYLqqCmQj8
         8Lqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791443164; x=1792047964;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SMQ/AIdgJkr5O5fjNFTHt4fefg0SwuXDpd4904cBtmw=;
        b=Fqb9GFi/gIzRlZjuSf2AnTsFz6NB4WFaDRC2gT90HMTiah9QCpBCaUSvBWcSivk19Z
         Y6rAKBV4Hy9UsiS+Xzjwq3OJHR4ILpqEEqPddinG/0cd4XRDRjIEemmJPxBJg8Kv2u+t
         y5RRpbnGlSm2EEyVf91Wm+688QU/06cAr0DbjOjINAj4EjA9DiZ2x7vJLvSDrukr4OP2
         fFJdEWWcnmq3WmN1CsSFORHULMwYQOakvUsGj4IV6aZmkXJexbfAHlX2+GCSYqu0I0Cx
         qG9+3EQUOyvDULhiWgcZh/FbHGCh8p2+rv4NwLGu85orO/pWZUeP9Ho2yBy32Yfonej4
         CoSg==
X-Forwarded-Encrypted: i=1; AKwUvByqAF9bEBMxyX4dPXGyt5IxZ5B1yXSmfsf5quODxRKEjtzzoHo5EUnnKq3jGnPPPnzk7Z08tqivZChZHQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lBB5GwzVjDNfdSfGmetVqmOszV7mO8A/K0QsKXA/n2Ub59kKlE
	h2I51K+RLQ8iT06S7MTexatLtgpJCXKiJvheCRjWbTc4BWHGh0GprCKk
X-Gm-Gg: AYBFou2aCVxr0iqCAG41LkgNyD6k+/ixmIc6NOQSFtCJcbj64l8Bc11cQJSaMtuDyNr
	iVFgoU3A1SY8ancSvm8ubV+YvYZVjl3oLv/EA5lo4ATt6dzqE4Kkcc074lyf87Hw9F+4ayK53vm
	WDBxH5yz8wqbAa74fCr3qOd5NlBTHouq3ACLCIj+6qFLIBVnpmYxt4H12vlVc1He3rKuHN5Ipi7
	BgLdO8unVWH/jmHxjZq5k8ZlFBfKQ/J9jHJd1j/mB57YFeMGxRPGgpcgg6s+iJfsUSbGPOCxwdo
	KSNYD4hO1l4NiPJRQjgQZT8nhm6dVI6omZalwAGjoeqxg6bduxeGw2Aglc29QSzxDx7H7TcGM3N
	NS4JJKJCSrJI+ztPNfDrtU7sIl9AeRGpMrYvOx7s7YAzU3pNNPDmkYcuwm8S228jpxGfExyBC/M
	dsPGZO6LS+gzlTGTy9jMwPs48S09rLX2tLS3hf+i+xs5zywo1r39lCNFYJfA7XYiX5TMGKKmMOT
	9ZucHyKgP0i+2nPvMVcAaR49/nhiDQeLu4KhhNZjfoobD1kkYAvSpdr1ArDPvXprMuc01vIASao
	pRu/U8LzagTWKgS+DVfv+pPI3xa7yqphkv9bTugUU9utH28UtDqL6WYJw98BwDrxk7zbxTGLneI
	UA4XyCdSm8d+Hdsn5k+/wbNuUB5IbtUMqfxLKHyuBCGxtG7fKSGY=
X-Received: by 2002:a05:600c:a087:b0:4a0:1fe2:d4c8 with SMTP id 5b1f17b1804b1-4a1802eabe2mr77020485e9.5.1791443163776;
        Thu, 08 Oct 2026 00:06:03 -0700 (PDT)
Received: from [127.0.1.1] (host-95-239-230-248.retail.telecomitalia.it. [95.239.230.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1843e3356sm42833285e9.14.2026.10.08.00.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 00:06:03 -0700 (PDT)
From: Nicola Fiorillo <nicfio@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, mchehab@kernel.org,
 hverkuil@kernel.org, ngocthang2710.1999@gmail.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, nicfio@gmail.com
Subject: Re: [PATCH v3 1/2] media: v4l2-subdev: Fix NULL pointer dereference
 in subdev_open()
Date: Thu, 08 Oct 2026 09:06:01 +0200
Message-ID: <179144316198.13032.1846729931094664641@gmail.com>
In-Reply-To: <20261008054842.GB683793@killaraus.ideasonboard.com>
References: <20261008042600.275884-1-nicfio@gmail.com>
 <20261008042600.275884-2-nicfio@gmail.com>
 <20261008054842.GB683793@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Hi Laurent,

Thank you for looking at it.

On 6.12.86: agreed, that line does not belong in the commit message.
The runs that matter are the ones on media next described in the cover
letter, and those are what the commit message should have referred to.

On the fix: agreed as well, it does not fix the problem. subdev_open()
now goes through vdev->v4l2_dev->mdev, which is only valid as long as
the driver keeps the v4l2_device and the media_device alive. vimc does,
through its v4l2_device release callback, but ipu6-isys embeds both in
struct ipu6_isys, allocated with devm_kzalloc(), so they are freed when
the driver is unbound.

I checked this on the IPU6 tablet (media next 9cfc1aca0781 plus the
sensor drivers mentioned in the cover letter, without this series):
with the media device, a video node and a CSI-2 sub-device node of
isys held open, I unbound isys, then issued one ioctl on each node and
closed them. KASAN reports use-after-free in v4l2_ioctl() on the video
node, then on close in v4l2_release(), v4l2_prio_close() and
v4l2_device_release() on the struct ipu6_isys allocated in
isys_probe() and freed by devres at unbind, and more in subdev_close()
and __vb2_queue_free().

Patch 2/2 rests on the same vdev->v4l2_dev assumption, so I am
withdrawing the whole series rather than keeping half of it. The
underlying issue is the lifetime of the objects in the driver, and
that needs a proper fix along the lines of what Hans did for em28xx,
not another check in the file operations.

Thanks,
Nicola
