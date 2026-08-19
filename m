Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5D1426D2E
	for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 09:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787130464; cv=pass; b=nB5Wt8kyGBAcMXxw/Z0fbSMTMtbAhWZ/og6HRsBxcz96bDPdCYeSFHOxlaJTg3wlHb1K3A3SvF2Wfo3kdPB8BdbYwslLZXjD6a1cvDzBD8mqS/NIBT9Cdkxs4d3GKLiYfOE3jPddoIl1ATGIlJ3cit5BorlsokSGap4AK1UUVhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787130464; c=relaxed/simple;
	bh=44RnieGb31sETghWfhYnhJASb5MTKZspETW5jfPDRRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B5QjaLba2DTi7qwXidF2RGoETJ29WgLJh7JyQJtYRwKcJ2ySoubQbkBw1fkVbtg+SvUTRnO65SZjwI0BLc2kOpzziZmBE3ypqCisjb3SreHPET4hV2XCySBTOOfGPpUkfKh+uytrp9J+gQnl0u+qcFletQoRyZaVZ/6i7CgWUYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TCj0xMMq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=IaT8fFpL; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TCj0xMMq";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="IaT8fFpL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787130462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=44RnieGb31sETghWfhYnhJASb5MTKZspETW5jfPDRRs=;
	b=TCj0xMMqz2kGRBIEm56Y+e0nIrEmEGPU/KxvBEGMUgpVUj+5ARfbX1cKG4BhcVlNkDhRJU
	QxTPYgC76ViVmLfy5jQF2djuiDvGLpwfyMFzEFPI+vpMlVs2dqY2bY3DC9wssu/mbrl8+g
	6yXBkaQnCZ+L4cULmVP0fgi0WVBdT9M=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-XoFjJ-aPNl-pHUhjICAKHg-1; Wed, 19 Aug 2026 05:07:35 -0400
X-MC-Unique: XoFjJ-aPNl-pHUhjICAKHg-1
X-Mimecast-MFC-AGG-ID: XoFjJ-aPNl-pHUhjICAKHg_1787130455
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4af9bf0f53bso1003941b6e.1
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 02:07:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787130455; cv=none;
        d=google.com; s=arc-20260327;
        b=csoHXc1Zn4g961nACLlhxYx8JeYHSWqjni4OQtHKOKnSByPjDb3R6A+WO3OpesNE5a
         gnFVwJQMpwoi3nnlKVWu3KsTuad7MynpQBd6ZSv9+Oqc1XaGHfUZMVIRNCr4H3qnoUga
         uxFcKlzxc8nbQZLSP3YL6i1drgenLXMs7FvrkH9KaEktuVTYipfEuqrueM5TKrHxurV5
         zsuVONlik1UD6b/duGekHmAFV6fEYnt5JVVABO6fmVclGgd2AmaJ6HF/TkMWP5/IWJ22
         b2E43Y8Qc0HjFQNhoK4zaWAWlNTbiW48lkgHC83XLlnmuceEw8oXMr1uuhq5sqJ3+2mB
         xerQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=44RnieGb31sETghWfhYnhJASb5MTKZspETW5jfPDRRs=;
        fh=Cq1UQV6nyDsmf3m7lut0ux9wJ5YOvN6Z8ImmU632d+0=;
        b=MAzt2ehlDUF1AKZiKBgmNrrKcsB2mBUzEzfaeO2SaEvCwWNhPUSn87x/Xo7JHeP1VW
         fsHckeDe9AdL0XTzpafkHzRL1C9/+mf0SUsIkwGoTIUTIhT+QL2dsAUtLxixkYDo1lLb
         Y1l43OB55cQY86HdY/x0VcWCB8Wm5fIATtbCHGzowa+5mN0TR6W4Qe1ZXHOBcexYK6bn
         SpOlzP3QEVE78cNWwRD7tSr5ksvQOyq3wk4HfhQKxrYp6l03hkfa4m2ZyQ34omw7EsdY
         HKo5vdfq0AW1EyMe+R0c81wwXsgomEFv4VdPfCd4JcXEBlRixoL+HKy3FEvE1wUzzZCi
         LTDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787130455; x=1787735255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=44RnieGb31sETghWfhYnhJASb5MTKZspETW5jfPDRRs=;
        b=IaT8fFpLkgHtZSQzTvgMcIW7vULN15Sl0tOclVvl5SHwGgsoGGZwXJFCH5wky140c1
         07e5SSAQ9owZ1xbaECk2DOj4XyWsat35tXVsdJttC1RT6zO7k5BKpgAfFteOFgKjJybp
         CLfrSEYfJz2kQCZPn5sHhxlZgWIThO2GoghuA92dXR5u7xiSdq4Tmifigpj39kfBHAy6
         M56OCiamalyleg1v6EIlW2leOpYy5yCucyVmPxU+L6K4har9s8WdQpPG/gZ94AMy5Jhx
         irYEwUcMdSDLXDP98KN1dcXTV9Gwmb/YhmVtBk6BPJ8BETdd4pvRHQbHyhZe/mHLv0Lh
         QpmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787130455; x=1787735255;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=44RnieGb31sETghWfhYnhJASb5MTKZspETW5jfPDRRs=;
        b=Eb1O/zvOhTTn//DltsVcE9bYHb+0c5s6nhH2oW2JZROhErQ8suLjM9rv9FMNewzFRD
         mdeYZkVEPDVKbyGqG5TvAR64CPQa5OuLJNMwtBxpkXkEEn+VPR8IRZxGGw6bjhzABTrr
         ybIapFv/qCqVTVwVWm3j6jQYy8zJwXwar9GfNrzqQLXZpP2PZoP34iaPBvGGSTePlzsa
         xN/4QWBgRZlUZpLrsye73BDm+rLaDvTW1jWckDHrVjnHdo0yXiYx2G+MK6ka2FItEomu
         CLujM4VdKsanqNSpWtjFlpyBd7bJC5FPT2qCI5w2xslADXb1mXH9tq9nfkXc8j9WhnCF
         wiwQ==
X-Forwarded-Encrypted: i=1; AHgh+RobQDBfyc3BP/YnxUA8d5hCzDp8jXd5DL4kwcyf+JBLFBzChhyTxUmNjuhUYMurRAB+zdm7ydPj87/JJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YziQ6R1iLPuX06Hk/BnzEraC9bqPYGWF5tAT0moO9DCPAovdI+q
	JNXn9XB/q+C+YcT5JfK7PaEM3cwJBV01PP1ZvaT1oVwV5CogrPz3WZcH8lffWLDHdwnTbJuN+gF
	vPmujVoHHm+VmuJAXKqP+QdASDC0zI0RADfcDxqjByFf8RNtGqpsFCGQXoeAStcOxoyiM/chbJh
	hayTbIn6r/Xgy4BcfkhEEwUyGDW+LPejDjAQ27v+4=
X-Gm-Gg: AR+sD11f6oUV7lRp0FHCNsGQBzLDxBMcURQoQ77RBoO1yd0ACMRrU+0pKL2FB2CYokC
	XnSYQZyV6Ca6OJ4gL+Rp5FjB4I926mZ03YJbtU4owhZDnbsizLgpgLJPz+FtgvhKCJzS/LoQ6iJ
	kq9uObnkMZxrJS6/jDskCQO+KPeNaxLF91HFBrE6LlHhusQAsD3nj9LzLrNQ1K6KoS9DQzlTGDC
	cFWgXFi7uYGmKIfZDuCpeCcPDEQyarjw383X5/oLStvaRpf
X-Received: by 2002:a05:6808:c1d8:b0:497:d3d6:6a40 with SMTP id 5614622812f47-4b2bc8ea2a3mr2540305b6e.3.1787130454941;
        Wed, 19 Aug 2026 02:07:34 -0700 (PDT)
X-Received: by 2002:a05:6808:c1d8:b0:497:d3d6:6a40 with SMTP id
 5614622812f47-4b2bc8ea2a3mr2540257b6e.3.1787130454472; Wed, 19 Aug 2026
 02:07:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACzuRyy8_x2XW4hbWn6uzZZjj4LbxpMN_a81Tub-=WSop4anhg@mail.gmail.com>
 <CAD4i_GTB9Uk=Kd=zZPAdXNZv0Xjvb5i8oHJHLA-ieCxLJHbmzg@mail.gmail.com>
In-Reply-To: <CAD4i_GTB9Uk=Kd=zZPAdXNZv0Xjvb5i8oHJHLA-ieCxLJHbmzg@mail.gmail.com>
From: Dorinda Bassey <dbassey@redhat.com>
Date: Wed, 19 Aug 2026 11:07:23 +0200
X-Gm-Features: AcwNN1VuMYUzwHyXshgKG4bENNzTtVl3AZDjms6xiRRyRcksX6wAR-vMczhIByA
Message-ID: <CACzuRyxRsUYVGv97vo9hsK=37=pcVjK+7=gF0JS3Ngx-SmiK7Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] media: add virtio-media driver
To: Brian Daniels <briandaniels@google.com>
Cc: acourbot@google.com, adelva@google.com, Albert Esteve <aesteve@redhat.com>, 
	changyeon@google.com, daniel.almeida@collabora.com, 
	Eugenio Perez Martin <eperezma@redhat.com>, gnurou@gmail.com, 
	Gurchetan Singh <gurchetansingh@google.com>, hverkuil@xs4all.nl, 
	Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, 
	Michael Tsirkin <mst@redhat.com>, nicolas.dufresne@collabora.com, 
	virtualization@lists.linux.dev, xuanzhuo@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> As far as I can tell, ``CPU_LITTLE_ENDIAN`` isn't specified for all
> architectures (importantly, it does't cover x86). Perhaps this could
> be made less restrictive with:
> + depends on VIRTIO && VIDEO_DEV && 64BIT && (x86 || CPU_LITTLE_ENDIAN)

Thanks for the fixes, Brian. The endianness point makes sense
and your Kconfig suggestion looks right to me.
I'll test v7 with libkrun.

BR,
Dorinda.


On Tue, Aug 11, 2026 at 8:34=E2=80=AFPM Brian Daniels <briandaniels@google.=
com> wrote:
>
> On Tue, Aug 11, 2026 at 4:43=E2=80=AFAM Dorinda Bassey <dbassey@redhat.co=
m> wrote:
> >
> > Hi Brian,
> >
> > I've been working on a vhost-user frontend for virtio-media
> > in libkrun[1] and tested this series with vhost-device-media[2].
> > A few things I noticed:
> >
> > 1. Wrong constant in vfl_dir detection in virtio_media_driver.c:
> > >
> > > + if (vd->device_caps & (V4L2_CAP_VIDEO_M2M | V4L2_CAP_VIDEO_M2M_MPLA=
NE))
> > > + vd->vfl_dir =3D VFL_DIR_M2M;
> > > + else if (vd->device_caps &
> > > + (V4L2_CAP_VIDEO_OUTPUT | V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE))
> > > + vd->vfl_dir =3D VFL_DIR_TX;
> >
> > V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE is a buffer
> > type enum, not a capability flag. So it should be
> > V4L2_CAP_VIDEO_OUTPUT_MPLANE.
>
> Good catch! I've staged the fix in v7.
>
> > 2. Kconfig architecture support
> >
> > > + depends on VIRTIO && VIDEO_DEV && 64BIT && (X86 || (ARM && CPU_LITT=
LE_ENDIAN))
> >
> > ARM64 is missing here, so the driver cannot be selected on
> > aarch64. Also, CONFIG_ARM is 32-bit only, so 64BIT && ARM
> > can never be true; that branch is dead code.
>
> I was able to confirm that you can't build it for ARM64 as written in
> v6, I've updated it for v7 as you suggested, thanks!
>
> > Since the driver
> > has no platform specific code, this could just be:
> >
> > + depends on VIRTIO && VIDEO_DEV && 64BIT
> >
> > as it already covers x86_64, ARM64, and any other 64 bit
> > architecture without listing them individually.
>
> While it covers the 64 bit requirement, it does not cover the little
> endian requirement.
>
> The virtio spec states that the v4l2 structs transferred should be in
> little endian format (section 5.22.6.1.5) [1]. Currently, the driver
> does not do any translation on big endian guests, so for now the
> driver should be restricted to little endian guests.
>
> As far as I can tell, ``CPU_LITTLE_ENDIAN`` isn't specified for all
> architectures (importantly, it does't cover x86). Perhaps this could
> be made less restrictive with:
>
> + depends on VIRTIO && VIDEO_DEV && 64BIT && (x86 || CPU_LITTLE_ENDIAN)
>
> I'd lean on others' expertise here if they have suggestions.
>
> I should note this driver has only been tested on x86 and ARM64
> platforms, so I can't make any guarantees on compatibility :)
>
> > 3. Error sign convention:
> >
> > > + resp_header =3D sg_virt(sgs[out_sgs]);
> > > + if (resp_header->status)
> > > + /* Host returns a positive error code. */
> > > + return -resp_header->status;
> >
> > The comment in the driver and the protocol spec contradict
> > each other. The protocol.h describes the status field as
> > "one of the standard Linux error codes" without specifying
> > a sign. It's probably worth making the protocol spec explicit
> > that the host returns positive error codes to match the driver's
> > assumption.
>
> I'll update the comment in protocol.h to explicitly state the error
> code is positive in v7.
>
> > [1] https://github.com/libkrun/libkrun/pull/811
> > [2] https://github.com/rust-vmm/vhost-device/tree/main/vhost-device-med=
ia
> >
> > BR,
> > Dorinda.
>
> Thanks again for testing and for sending fixes!
>
> [1] https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-cs=
prd01-diff-from-v1.2-cs01.html#x1-8360005
>

