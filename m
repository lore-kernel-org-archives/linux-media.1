Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462033AFB11
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 18:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784571118; cv=pass; b=DpIdHCbpe0f3qM7cUt2SIp/K1TUQZ9kpxfx8wM4QHVHoXzpe0TYP04xOce/BUHZGGIjmbjPAqDIFSIL+je1PxthzplrAfSq0IkZrX2oII0kpKnU5qXyP/y2XUiGpIUhjLg8tlzNH9JUT8MYmCu2eejIfUixksZKyL8DAK+yrrO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784571118; c=relaxed/simple;
	bh=JAjXHOi+mA5sLbGUiviDveQxxklnyDZVQ4AeXIMFrHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GURG9kM6ecWRj4qIl4IjbUqOe3IZF7RdULv7jXTNlTlyedr5rkaRj/jKWhOiKqCj7imSIR2wxIo+gmojHmdPTX7OSQrc1oWJHAvFgTMUbvK4vw3rtV5FbzwPOshsAM/WjoYNyxzfYFGsPOHEis3bjY5mgCfZiJW44WUe8tXgJEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q7yUp9Lz; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q7yUp9Lz"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cede6375caso355075ad.0
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 11:11:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784571116; cv=none;
        d=google.com; s=arc-20260327;
        b=gshxK17ZI/oiG5ldk7OnTS2r4SDsmRojEseao+JZ8vGy8TF5DELlcRfVoWL1/7ijuh
         omoidKN3XykhJSQ4pybR+ZgSIvLiK9mCsZ+Uwz4z3BGV+4mCZk4srYX1VokIa3sT4IMm
         rwmLcCaqQskPOi1RGSkYLHH6hXdobh7ssatl/ocCl21sW5bnSBiklR4Rdt+AYA0NjyOh
         /ypJXOaMOFCalE4YxtjAVaaBgtqo6EtpivY99z9tDqkH3GnRHLnper/kF0jyBsYlPfun
         sb+pQjVeeRaVUrKHto9S0pphQ6H+lGoRA/IMgriTxWVgi7H1849Rp8+K0B8+5I70A0PV
         Xo8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1CKlYAx3ZqeDb0/tpWFTjgJVt3tNaV59m+Y0rInN34s=;
        fh=fTePmxeVDbM7zXDaCS08McUVfABjZiongB5f41/3mvE=;
        b=VeLdfmcn4y+1krb6Nwn/bmbGBAHx8Zr2p1AyAu0nhX6YfkE0Uddyb+CkWKHTVqGaPQ
         9FqqQCN1naA6z1wZlbFuOkL9uVuJWFzFg8rDg1h8wHAE6bJoF49ZBnDN81A00NG+Hy7s
         N2sEn3PXlyuBEyGSDMKqfH8ZXHwPa9ryyabMP+ERZtGxdgRDY5uSjpwz1TaIpQC5pOCw
         sV48FEguz3VQry64FKz3eUgAmV3P1NjGitiJAisdCweWCIR6CgEh+lyZJXDjl2JBj6OT
         XOQcOPcO+id0hSvRXob83BRwr9bdSnYZrBlnhQByyjgsMdvwGInUNopSJaE+tScegAUO
         LWhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784571116; x=1785175916; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1CKlYAx3ZqeDb0/tpWFTjgJVt3tNaV59m+Y0rInN34s=;
        b=Q7yUp9LzEKVu9IrnR/tOjhZwtGhrQND1W7RH22iSWrUs4vVl9lORi6AHvtGFFvK5mA
         F7bxXZc62XaqaxNyj/krEkqXC0lm/KrTB1jTs54PxQYssNpiR6ZvRRzguCs7mwzm9RHW
         sSdJshP7Xqf9mksLxYNL5qNyAnucR31rfqNrPE5+rDY6yZ2vMt5RSUUAB5o/PyfIaqvQ
         BCm8ouvrO0X8B9fNDQmHOx1zfXahwDKwmZwcQvi04FFRqlbfjRCY027X0Gv+2bKYP4Z1
         403IHvezaZegPtcYWec0OR2dsItPYSGKyaqyIJd2BYpoe1mcmzFsjllYcSVMp/656858
         HftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784571116; x=1785175916;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1CKlYAx3ZqeDb0/tpWFTjgJVt3tNaV59m+Y0rInN34s=;
        b=AhfJYaZKtZMAWKBXIgdycDSAJYYkYkSSO6y/NgeiHA2kFRq7iV1SWxGBjLcdQhmrNV
         Inotq/ifunN4BslssZ5KV00YlSLS1v+CxG4SQ6qJG3dN2Zsnto6+MhqL0tr/Y1KFz3Zs
         ZAt8VHqTMAQAbdds2cOhoLHp4gSHcS4OHUrMbznNQ9oGvqB8B5mf0O5WfmktwuQC8elY
         p0TQelRZy/KAkIKM0KlRLgK+hnNDkKIuvWO89TewnuVQY7t+xFzK0hoJni1odA+SjHlx
         y4IMGywhFlvQMn9HwRlDff6Pkw3l5b5Cfe4SLJMWlXiTM7xJoqeOfU/YTzAlwcyXYirg
         uI4Q==
X-Forwarded-Encrypted: i=1; AHgh+RqwGWyffcQLGkCkRP7zIal77t/J7uKfsiwKAKtgXX+hox3ZL0YNyUcV6QXa7Cv6QaNGdIeZran6RUdt9A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7CCCOH2Pa8MAzrItZ1yp3BylK8AuUqBdD5orqX7AGG1qtxUBE
	BoLo6k21kc87C8AOnkqCrebJH3wbmZBHHGQ+K7GGzO06YC0RT1pQTwDKYrkFeh1vp1ovrthvoTF
	zTxbHAALpzC0PP0IYGENvgfK3elOrMOE7ZcVJC50=
X-Gm-Gg: AR+sD10usZd3hcc+nh2hMbfXIasfAblnZM1eAxE9bs3cU4aHa4CSjY+VXwKcwBaTqto
	/sXEMOV5a8ybSfDdMTPkUmXKWElV6DPEc4EFWfxtSSshuw/yflrqTI2nIL0qCwOKSuYmHs1dxpV
	sgCDBkwp7D1dZLljGfrQcRviBGRZwW+OSaxuCH2TBm/LQ9QYs5Lo7389F6gKtMEkHWiBy9nKbJG
	A4ZmPEw66M4z6XaAKlMRBSDVk4BxTDq9kiyWpwAJdmqBHr45IoEgphbPJDd
X-Received: by 2002:a17:902:f54c:b0:2ce:7ae6:2a23 with SMTP id
 d9443c01a7336-2cf7b702c3dmr1769225ad.27.1784571115038; Mon, 20 Jul 2026
 11:11:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622204343.1994418-1-briandaniels@google.com>
 <20260712091036.5b0f170c@foz.lan> <CADSE00JkzGmN8Hvo1fuAsO1o9TKMrPwpmag-dtcFH1+NvkP6HA@mail.gmail.com>
In-Reply-To: <CADSE00JkzGmN8Hvo1fuAsO1o9TKMrPwpmag-dtcFH1+NvkP6HA@mail.gmail.com>
From: Brian Daniels <briandaniels@google.com>
Date: Mon, 20 Jul 2026 14:11:42 -0400
X-Gm-Features: AUfX_mxjKSfqJr5UYn-MifRznqumqpOeJGfSnFSM3EQHWuVZoKEjfxE2uw5OwrE
Message-ID: <CAD4i_GT7_K8LZea-Pk+LwpWSPiu6TO3WVi2ETxM-ET7f-ubQOg@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] media: add virtio-media driver
To: Albert Esteve <aesteve@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, acourbot@google.com, 
	adelva@google.com, changyeon@google.com, daniel.almeida@collabora.com, 
	eperezma@redhat.com, gnurou@gmail.com, gurchetansingh@google.com, 
	hverkuil@xs4all.nl, jasowang@redhat.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mst@redhat.com, nicolas.dufresne@collabora.com, 
	virtualization@lists.linux.dev, xuanzhuo@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2026 at 3:00=E2=80=AFAM Albert Esteve <aesteve@redhat.com> =
wrote:
>
> On Sun, Jul 12, 2026 at 9:10=E2=80=AFAM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > On Mon, 22 Jun 2026 16:43:35 -0400
> > Brian Daniels <briandaniels@google.com> wrote:
> >
> > > From: Alexandre Courbot <gnurou@gmail.com>
> > >
> > > Add the first version of the virtio-media driver.
> > >
> > > This driver acts roughly as a V4L2 relay between user-space and the
> > > virtio virtual device on the host, so it is relatively simple, yet
> > > unconventional. It doesn't use VB2 or other frameworks typically used=
 in
> > > a V4L2 driver, and most of its complexity resides in correctly and
> > > efficiently building the virtio descriptor chain to pass to the host,
> > > avoiding copies whenever possible. This is done by
> > > scatterlist_builder.[ch].
> > >
> > > This version supports MMAP buffers, while USERPTR buffers can also be
> > > enabled through a driver option. DMABUF support is still pending.
> >
> > In practice, USERPTR was used on several drivers that wanted to
> > share buffers between V4L2 and GPU (so, a previous approach before
> > DMABUF implementation).
> >
> > On my tests with this driver, I was unable use a 1080p camera with
> > V4L2 and GPU on crossvm. Lower resolutions worked. No idea if this
> > was a limitation of crossvm (I only used it to test this driver)
> > or if it is due to a poor MMAP implementation.
> >

I followed these instructions to test with crosvm on my wayland machine:
https://crosvm.dev/book/devices/wayland.html

Note that I built with `cargo build --features "gpu,media"`, not just
`cargo build --features "gpu"` to ensure virtio-media was enabled.

My crosvm command was as follows:

./crosvm/target/release/crosvm run \
  linux_upstream/arch/x86/boot/bzImage \
  --disable-sandbox \
  --block old-debian-12.img \
  -p "root=3D/dev/vda1" \
  --net tap-name=3Dcrosvm_tap \
  -m 8192 \
  -c num-cores=3D16 \
  -s /tmp/crosvm.sock \
  --v4l2-proxy=3D/dev/video0 \
  --gpu=3Dcontext-types=3Dcross-domain \
  --wayland-sock $XDG_RUNTIME_DIR/wayland-0 \
  --serial type=3Dstdout,hardware=3Dvirtio-console,console=3Dtrue,stdin=3Dt=
rue

The path to your kernel, block device image, and /dev/video* device
may be different
depending on your development setup.

In the guest, I launched qv4l2 with the following command:

sommelier --virtgpu-channel qv4l2 -platform wayland

I had to disable OpenGL rendering under the "Capture" menu (otherwise
the rendered
window just showed up as white) but other than that it rendered 1080p
smoothly using
the MJPEG format.

Here's a video showing 1080p working smoothly:

https://www.youtube.com/watch?v=3Daw03pM_-7oA

> >
> > > Compliance Testing
> > >
> > > This was tested using v4l2-compliance. Since virtio-media serves as
> > > a proxy to host devices for the guest VMs, we expect the guest
> > > compliance test to essentially match the host compliance test for the
> > > same device.
> > >
> > > NOTE: v4l2-compliance changes its test behavior depending on the driv=
er
> > > name. In the guest, the driver name for virtio-media proxied-devices =
is
> > > always "virtio-media", even if the actual host device has a driver na=
me
> > > of e.g. "uvcvideo". To ensure the test is consistent between the host
> > > and the guest, I created a patch for the v4l2-compliance tool that
> > > allows you to override the driver name. All test results that follow =
use
> > > this patch:
> > > https://lore.kernel.org/r/20260528163448.4031965-1-briandaniels@googl=
e.com/
> >
> > As mentioned before, please submit this with their rationale in
> > separate as a [PATCH v4l-utils] to linux-media ML.

Sounds good, let's continue the discussion on my existing [PATCH
v4l-utils] thread:
https://lore.kernel.org/all/20260528163448.4031965-1-briandaniels@google.co=
m/

> > >
> > > All tests used a Logitech USB Webcam C925e.
> >
> > Please test it displaying inside crossvm - or even better to QEMU if
> > you manage to add virtio-media support to it.
> >
> > Being at QEMU makes a lot easier for everyone to test it.
>
> Hi,
>
> Regarding the QEMU support mention, I created this series in QEMU to
> add the virtio-media PCI device:
> https://lore.kernel.org/all/20260630112310.552606-1-aesteve@redhat.com/
>
> Testing was done using an older driver version at
> https://github.com/chromeos/virtio-media/tree/main/driver as described
> in the cover letter. But I can try testing it with this series. Either
> way, the procedure for using QEMU is in the cover letter, so anyone
> can try it.

If you'd be able to test again with this series and post your results
that would be great, thanks Albert!

> BR,
> Albert.
>
> >
> >
> > Thanks,
> > Mauro
> >
>
