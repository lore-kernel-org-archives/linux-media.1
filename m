Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EA63876B0
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 18:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786473262; cv=pass; b=lS0r4DXzeOLVHh9WbUyJhnCiXsD9loquJf1jmgCfqBTwaXBJYRIqhxJwJ1rMp6d9GFD3J9w2qFBCd2gb/7j59wMBP2A8MKUq0+HBTNnk0BT2DP6bOOULJ3WiZ0F7xpiERw/WaHlxUq4Pi5zRN/eJGcLYjUZdvVRgT9RRM7ghZSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786473262; c=relaxed/simple;
	bh=kLCANoNRd4l6pDLkn5bqVm7bHB+PCvgLtEbTkT1Q00k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oM8S58nXtgfvyLGpezcPKxfUWqzFwuy9DxcIa/sFl8t0KZwYUHU8PO1XcALS8TjsnQVp6B8Jfi6tZ+PMyyTflDHJjsz27m43CeWzJi2KAtnf060GVmuRzdqTQHG7hhNUG+dZH3e8QoDf0v+029g3JGS/HDtuK61bNtkuCn21XD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hkOwlG4k; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hkOwlG4k"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cab97c86bdso16185ad.1
        for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 11:34:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786473259; cv=none;
        d=google.com; s=arc-20260327;
        b=lbRYNH9NcZQNIDKAwH8uXBI0DqlvHWNYQ298TUpaayBJqVk5Ue/yy+wkfyc/yU/rN8
         1l1NbTJqpSmWQM0IliHnVSZicrYM/sjuX5yn8SNzW5ex7A6rGbhP37JUnGCsN18AHMAH
         PW6z7smo26wx0rETQt+5WcPUpmPD7uAiPV3S3OB7hkAWS/9Bld4nsMjmKjk9Ltd6UEcJ
         WGQl+ArnUmNOLk3WzOPF9MdO/C81hG3FPiAXrci5wRyrtf05SavSDMM2/dFRFDlC3EV7
         bkHX0a4uRnFzIxq6HDty3hEku1ZhH5rJsNYii+c/lQz+3yUc7UdEJwHi2jwOVc3BLwS+
         y8Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kLCANoNRd4l6pDLkn5bqVm7bHB+PCvgLtEbTkT1Q00k=;
        fh=E8JIL3Ll1mhdzMvLdRD9zX9vl3pDJu8+FtfiQizK86g=;
        b=LFIVR6O4hxusL0yLaHQ5iXzSIKY8nzaticN/GVjQbumtfogIWNqcivBuU8gUbdR6q9
         uy073JX1XMZDwZKGADwRg1u39KWgHrAvBgAljpsRFM51LNACojarFAChyWC7szy2hC0k
         1WIldYmsuBDopSTWJ19gjXfehHN1Uzd1M1Piz1wRgmHm38c8PT+NkY+ofcEJTkn+bMfY
         JRgLT5tyhsvIdLpBOODWje5kkJvPzzdmRhyPt5vslhpwTjdLTSjG32TcpYjNWvB7Pm3/
         fmCSntSSEm0na64lWHc3CtYCESCN125b5pVGa7WicXyIto90effN8Plsh0luP2a5fDor
         d1Yw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786473259; x=1787078059; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kLCANoNRd4l6pDLkn5bqVm7bHB+PCvgLtEbTkT1Q00k=;
        b=hkOwlG4kqySCFz0YXYVkuJjYF9qZHMy4tjuqN36+RjuI/xVwClOJk5UKz5YuqM+A+a
         p+grAY9ZNOfQxKgqJtMrEWEU9XiZw2H3E3DJ5OqZZOuxqaSKgAzllyDoEJnAus+ky4vO
         V9p3d9MDdbTZsI4OrxaVscR8wa5ImBlOwp9ccmTs+HN3fmD8CAhoJDjrXCfoFBx10NdQ
         j3ERZUGXqsbM2u4yRel+MuFlqKEDoruJ0QDtKkY9jkYzovbjJjThpUJS9YDuqrRnFJpI
         Xhed7sVQaCHRqjPTJJGQi1nA7a7A7136bV1EKRWywuB89jh4WTt4FUhv9i89twkYQvYn
         IVjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786473259; x=1787078059;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kLCANoNRd4l6pDLkn5bqVm7bHB+PCvgLtEbTkT1Q00k=;
        b=n2eAG/WC5tDcJbRLad7o4AVGOeId841nv2j9EiQNBVuHbZghLBXOtsCNUXQA9ju4+X
         yu2XbBXAmO4uJ61kGMeGSmWlCtdYV9CSKAj4isCca9YSKJctyPUMnIBsH9FKc4/Cn6MX
         WuIlTKCcFxalSLgjto5T/ul2qJMMvk/LXnU7Gyh5cqyI/cjSaLNhg7FcgGOUAFpAH549
         yZ8lWLT+LNpC1FxEsoeGLgnmcrOMvofbw3X2ta04ToiWyJlnOHDTodBu2FcM7vei/WAq
         Eqk3+j/HhCUyj06x8374CwoGvo/+MgwuCZ+IOwdYRgnEgzw0utfPxYSS1ztqyEwrFp63
         jutA==
X-Forwarded-Encrypted: i=1; AHgh+RpSmOtNclHNB+qNEDId5GxXm62DMkzBsSxSjIocd9Dqcm6f+4faIuFRsQ4tU1gUT8w2lb+nKGlAAFRlMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwASX5hTZpEQtxuCtZWXXG38l8skSAsID0QiAovOPAqFQ10xixb
	/HSR31gKALldWqo2OaZ5rS0hY6Fs4J1EMo4upUrOW8Z/b/EshQQXqzxJHTd4ECC91zkGZ5Lism+
	2WpFElazm+mFZmk4VXXc2OzS1Bnm8nGe1b2/W81g=
X-Gm-Gg: AR+sD12jc3cvIxpoWp4AI0y/XM9zyoxAiozOe2c3oIhPNue7+NMflys1/9fkob3P4m8
	YS7VGG6INfb7p6qvxVA4XSmeBm6Uxg01lYbnITBJ9ApzL3gebVmw+g8I3dGQG+BJbohEnp+uIfa
	Pexo1veHdD0pBcWktyxPTl6NFv3n+Cbe6ce/CMgJHRIl995C6awI743P469h/QGPA216aVO9+WF
	kj/UDzDksBaoN+6ivM9O+3juEnh+Nkg4nhvuCJONmj1Frr5XgWE/7kI7S6oBXzYxIWx49cgjMdN
	oaeU7WF/MObK+8bZMJaJ+T4UGdjHO2AwnDmT4zLImxsUPChMif6OOPKhHxJd2v0zf3dCVdvYpmC
	V1gk=
X-Received: by 2002:a17:902:c40e:b0:2c0:defb:557e with SMTP id
 d9443c01a7336-2d33a963518mr1426215ad.1.1786473258400; Tue, 11 Aug 2026
 11:34:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACzuRyy8_x2XW4hbWn6uzZZjj4LbxpMN_a81Tub-=WSop4anhg@mail.gmail.com>
In-Reply-To: <CACzuRyy8_x2XW4hbWn6uzZZjj4LbxpMN_a81Tub-=WSop4anhg@mail.gmail.com>
From: Brian Daniels <briandaniels@google.com>
Date: Tue, 11 Aug 2026 14:34:06 -0400
X-Gm-Features: AUfX_mxPh1QeCdRNQsNlfbzsj86xBjIyw-ELTDIVTWXToZomyGre9ZVhhK3ENGk
Message-ID: <CAD4i_GTB9Uk=Kd=zZPAdXNZv0Xjvb5i8oHJHLA-ieCxLJHbmzg@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] media: add virtio-media driver
To: Dorinda Bassey <dbassey@redhat.com>
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

On Tue, Aug 11, 2026 at 4:43=E2=80=AFAM Dorinda Bassey <dbassey@redhat.com>=
 wrote:
>
> Hi Brian,
>
> I've been working on a vhost-user frontend for virtio-media
> in libkrun[1] and tested this series with vhost-device-media[2].
> A few things I noticed:
>
> 1. Wrong constant in vfl_dir detection in virtio_media_driver.c:
> >
> > + if (vd->device_caps & (V4L2_CAP_VIDEO_M2M | V4L2_CAP_VIDEO_M2M_MPLANE=
))
> > + vd->vfl_dir =3D VFL_DIR_M2M;
> > + else if (vd->device_caps &
> > + (V4L2_CAP_VIDEO_OUTPUT | V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE))
> > + vd->vfl_dir =3D VFL_DIR_TX;
>
> V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE is a buffer
> type enum, not a capability flag. So it should be
> V4L2_CAP_VIDEO_OUTPUT_MPLANE.

Good catch! I've staged the fix in v7.

> 2. Kconfig architecture support
>
> > + depends on VIRTIO && VIDEO_DEV && 64BIT && (X86 || (ARM && CPU_LITTLE=
_ENDIAN))
>
> ARM64 is missing here, so the driver cannot be selected on
> aarch64. Also, CONFIG_ARM is 32-bit only, so 64BIT && ARM
> can never be true; that branch is dead code.

I was able to confirm that you can't build it for ARM64 as written in
v6, I've updated it for v7 as you suggested, thanks!

> Since the driver
> has no platform specific code, this could just be:
>
> + depends on VIRTIO && VIDEO_DEV && 64BIT
>
> as it already covers x86_64, ARM64, and any other 64 bit
> architecture without listing them individually.

While it covers the 64 bit requirement, it does not cover the little
endian requirement.

The virtio spec states that the v4l2 structs transferred should be in
little endian format (section 5.22.6.1.5) [1]. Currently, the driver
does not do any translation on big endian guests, so for now the
driver should be restricted to little endian guests.

As far as I can tell, ``CPU_LITTLE_ENDIAN`` isn't specified for all
architectures (importantly, it does't cover x86). Perhaps this could
be made less restrictive with:

+ depends on VIRTIO && VIDEO_DEV && 64BIT && (x86 || CPU_LITTLE_ENDIAN)

I'd lean on others' expertise here if they have suggestions.

I should note this driver has only been tested on x86 and ARM64
platforms, so I can't make any guarantees on compatibility :)

> 3. Error sign convention:
>
> > + resp_header =3D sg_virt(sgs[out_sgs]);
> > + if (resp_header->status)
> > + /* Host returns a positive error code. */
> > + return -resp_header->status;
>
> The comment in the driver and the protocol spec contradict
> each other. The protocol.h describes the status field as
> "one of the standard Linux error codes" without specifying
> a sign. It's probably worth making the protocol spec explicit
> that the host returns positive error codes to match the driver's
> assumption.

I'll update the comment in protocol.h to explicitly state the error
code is positive in v7.

> [1] https://github.com/libkrun/libkrun/pull/811
> [2] https://github.com/rust-vmm/vhost-device/tree/main/vhost-device-media
>
> BR,
> Dorinda.

Thanks again for testing and for sending fixes!

[1] https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-cspr=
d01-diff-from-v1.2-cs01.html#x1-8360005
