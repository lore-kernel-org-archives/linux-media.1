Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794852205;
	b=KT9CG3GP4o3vZNnRA2dF3MqNRRwrGSvM24H5cGnEnQAT+6QZmPFCT2SnxFdRUBW9QbIF
	 tTdNFtbGJOpMpGOjPHUqf3a7LZH8VXXEwujFuy1amhjO8e5GW9VzVKCgoUjSKmdjVKYNR
	 CIxqT7a9gvjOv8siMZVlMDBsQKeBRp3fUED6jwwDwk3DsvQySH4eoLWBAC+2/gLE253qF
	 2QMcCRoMWRfm4XnQxuhMCsmj29MdNDAoaFSk08FK/lCg6toRHkaeSNop1FeaXVhsmqsrR
	 YgUycy10rY16RsV8KRBg/NdMGse57nB1P1s8YiyqmZXORl+HU5dyS09XfzAyd8mv/IQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794852205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UsEi7nj+gIWpohML70hey3/GRg+ovwcWW0/uBKwbaX0=;
	b=r3ojXVEyNh2V+/cRXg2zni6NTAYJj4BWJzps7XTUyChKsPEIAQCYhUHOlxwPve6YKFCa
	 btNYhSCGJaJPqOIT0sLpACDztUoHQiijbCbECluW/yCWi0CLwdJQWhul2wLUFswZdc25Z
	 XFgvv4HToemucJDgcspeZlJ6qc62D9ddH2s3qvNoHSLgb8q597Ge61ZxixFH2ttfgovoe
	 yLrL7brICdKrjrrpW0h819p33fTf1U3/D+mf+4nyXL69qzIknqjWQOnFKAqyiTaCt5RtT
	 ZUFywfnpw7ZjIT4tWS8pStrOIyr+f64dw+QOdsFmC/rVJnKKbHVYfgf7a0B4NyoHqXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=I6mqVMTG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295F0606A32A
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 18:03:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 295F0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=I6mqVMTG
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c50a4a2132cso490874466b.3
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 10:03:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794852204; cv=none;
        d=google.com; s=arc-20260327;
        b=KmmTSXRgGcRVZ/g70JpkSyoVGEUFohu1w5EtZT6xdy9Fb0EhAVIoFu3QJ893V7u+Oi
         dmr3DnO3uEAVgjdsWQs6KMQTCqnHUEcI033qn2j8vDUKgQ0jMLPtRoMSdEA4DM7R/e4D
         UFvaSGxsN9unnbtFusmaY7VXC11qoP1/odaHuQ3lNGnEfJ+zQLmgY9+6Aot/kOLT0PQO
         OeMvBFLxA9WxiVtqYB8hzIWHntIyK1TtvSRQ3dce9TffmdCEWS1xQ4i7KMBvZnax1KjU
         Pir0EFKhzdrZ7VQdtv7xzGbLTxQ76iUOcNj4rBTjNplbjFQCWoqJRU0zlrkluExVD/5p
         TuLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UsEi7nj+gIWpohML70hey3/GRg+ovwcWW0/uBKwbaX0=;
        fh=Hiv2thv8sdWVYBntz2wnDWMFmnlp7j9s2Fqg2WK7T6E=;
        b=Nn6gW60nK/1aOr9qrO8ghprcDhjkDUXlxIyKExFWITOeMM7cBhmN71x+Clp2CZEhGy
         Vh962rzgLeYX9jnvT3SpLNHMxouiispbdKT0tbX+wRiHrVIqmUv06yICJD2dHwUr+u7h
         EDAngBPjuuQbTm6DADbVe9w9blFEdMkkreCMg1LyB1llYFc0MpiSmYqWiKx/M/FvtB2x
         rDj7/2Yfr8c8atXAvfI5WnJD4J4mZ9t+pLROW4TQ4eaSRgxitVdw3BzFCSkIo+ObfQ5t
         ZwpMq/MahpOVaI4ae6viWmhKJWceyVWHsMTrnEXqzA2HDQP85RDOj4pfCWXOPVIvJqWk
         Qifg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794852204; x=1795457004; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UsEi7nj+gIWpohML70hey3/GRg+ovwcWW0/uBKwbaX0=;
        b=I6mqVMTG7TOW0QEwtuel8eM52dKEJwwHsF405R3hjerJsFHBrNmZbXj1231hyCM8t6
         lqbZTqy/W7RE6mA/aFf6Hg9AYwm6rN790YoLWLHRk8TLVbiDwMFzyhmLSGClLvIpmNF2
         Fd1UV/CIckE73CtjGGY+0jZ2X7dcdvGciqVfMht+mmpUzFUMO+dLUMlCFCQaKyMepbGG
         F8ohtkkUT7s7bFlbRNN/LGCQB4vCchBsVeQNAA3l8+Gj7s7oTeck1iQ/5Q79M9IA0TO1
         Zyy7QFC3lWeB7VhNxN8iUb0z+6DXNIMXIKoic7ZeJEN5l6GIoGek36/tcXyIzG7bt/kg
         1Tfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794852204; x=1795457004;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UsEi7nj+gIWpohML70hey3/GRg+ovwcWW0/uBKwbaX0=;
        b=MHIK1MlL/VQb/neZ05TnOGEwTV8GMrOXQ8pzimdKIvAZ4kJ/hbDiOIvns4/dyV4Bct
         5zJbLEauRqVmRCvC2HAWFVqUqPyfCUvK2dBe7KaNOALWJ6DyCnVl56EyFT6JY4YHgter
         TKkxQ8WWcEQ5wCny1QyBHBV32EDUn9mxUparkJgcepLAmavhs80OvS9q2ifhB0N7SaY7
         w7UNUgTMFV2VIJp8i3HBJLNGYd+uTGod2p1vwNruQUwRSkvR7hRCfE85u9FYNbobZDK1
         pBY8mdEpyN5GOsD5Q+2hyJg1hG+114Sm28KZFksKNoEcWmrvYRlhhhnH22BldHmEhKCk
         tOQg==
X-Forwarded-Encrypted: i=1; AL+hErHY1rYVXWy0ZJ3QGXBLO6mbl0V9bUXDPrcL3fTrhs/97nA8m1djbjhJDHlX7aB5aTRVm6iZchKWNOikuw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+7loKwDqIsUhN9gxRsvML+RF93gn6QuzCsL1gTiK+a+Wbwr9Y1
	zC1WHnTTZX6Bao/YfCWzo69tbRwTlSGQz0Z09UG9HmoB1CogaiW5tCr7fuYfZDO/wwP7vYwO/PU
	HkZNlEFo91H9BxUA9Mg6nS8A/4b0k+AGUFjQqQeL2
X-Gm-Gg: AYBFou0057q1AOykPZ9Cq0ZwMVeXWeDJnsEKQQY6771+KwsjQDFt/EBaVeIZX7HC4mJ
	hE7qpRM5L/cQoMaB//b4BosL7FcLEN991uk/75vHchN3Z+qTk8uOzo4AZgqpLNhzI2/reIk2Lyh
	KTM68P8c2GOkggLKOZjHN5+ulJHm0fQBFYgVXGQk6AXsb3XmCtD6BcNVAGls34QyT0vSAekXucA
	oPwa+YejzCUeHW+IS54709zybgVjcFW9Wg1df55kBcBturmTpSavbLysWzpL08wDqYvMxoOvZPq
	buKah5X87zTmtXjfwldiI3Bd6UwytvRbfv0INXxanHPfMBgsEO+pqFL7owyNzKQKs0cozsSz9Bz
	Hko0y3HOR5d2b8LuLPJq949weah/9on5n+f5UfMom9SOjJB1zp8DnO51ChIQ=
X-Received: by 2002:a17:907:ea92:b0:c49:cdc8:10cf with SMTP id
 a640c23a62f3a-c50963df2ccmr868161066b.40.1794852203026; Mon, 16 Nov 2026
 10:03:23 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111192411.4133780-1-dmatlack@google.com> <avYjFfqr3T/U7lvn@devgpu015.cco6.facebook.com>
 <DMTK99TDM9AM.SAM3Z4COP9WS@google.com> <20261115231946.GB1239159@nvidia.com>
In-Reply-To: <20261115231946.GB1239159@nvidia.com>
From: David Matlack <dmatlack@google.com>
Date: Mon, 16 Nov 2026 10:02:56 -0800
X-Gm-Features: AclHuK98Rk-099iLtslJwrWtAxHkQR-ncmpykOH17KTcOCuNGBfykDUUL8uCEbE
Message-ID: <CALzav=efnA_ABCZVicX0QeTmHknaEbMeWOy8cS+zHYVhm5z+iw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] vfio: selftests: Add peer-to-peer DMA selftest
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Mastro <amastro@fb.com>, dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, 
	kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Josh Hilke <jrhilke@google.com>, Kevin Tian <kevin.tian@intel.com>, 
	Leon Romanovsky <leon@kernel.org>, Logan Gunthorpe <logang@deltatee.com>, Matt Evans <mattev@meta.com>, 
	Matt Evans <matt@ozlabs.org>, Mina Almasry <almasrymina@google.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 3:19=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Thu, Nov 12, 2026 at 01:47:03PM -0800, David Matlack wrote:
> > On Thu Nov 12, 2026 at 12:35 PM PST, Alex Mastro wrote:
> > > Hey David,
> > >
> > > On Wed, Nov 11, 2026 at 07:24:04PM +0000, David Matlack wrote:
> > >
> > >>     Is requiring userspace to re-issue IOMMU_IOAS_MAP_FILE the expec=
ted
> > >>     uAPI behavior?
>
> Yes. Even if we wanted to the locking is doesn't allow trying to do it
> automatically.
>
> > The way I designed the P2P selftest support requires 2 things:
> >
> >  (A) initiator: A device that has a VFIO selftests driver.
> >  (B) target: A device that can provide a memory BAR (vfio_pci_find_mem_=
bar()).
> >
> > So far I haven't found a single device that can do both. But you are
> > right that theoretically a single device could satisfy both
> > requirements.
>
> mlx5 can do both

Looks like GPUs and NVMe can do both as well.

How would we implement vfio_pci_find_mem_bar() for mlx5? BTW for the
target device, by "a memory BAR" I meant "a region of a memory BAR
that behaves like normal RAM". Sorry that was not clear.
