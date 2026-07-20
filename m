Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7042638AC8E
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 20:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784580651; cv=pass; b=nNKvj68U80uYf8H1dIfLetLsdSqYjOfF/RKA8GY0SBdQN8DVh0B72+5+WGzqwfn3a3bWwLboc8rQxzfyQte4c4XVmYz5Y5pxCposxOY0QPVsAKByJVJewkLa9tZ95sBVlrFbOqnNs1aZKR5q4vKGz1SxTixHWbGKynarYXKawMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784580651; c=relaxed/simple;
	bh=ajlfvdFqEsO7H2RzLN4i6I8NrjqBzMH99tmpheL6pHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f/4ELqz7WJRoOqhjcTSX94v0MYfxAHt8PLO7HU+AndNXB2UKLrXPj61dLl42hWYWhlBgz8wDGkSvB4ZclS5o2DhQw61GJD97SO/WKnuBJ3EZbSEAw2LS3GukavRZGmyYSTUZbCJam25EUAD/Dmf/Blp7rByYdDWJaz0qUrSCG/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j5dDQhQb; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j5dDQhQb"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ccdf36f63dso429025ad.0
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 13:50:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784580649; cv=none;
        d=google.com; s=arc-20260327;
        b=gV8lRjoQYIKsi4eyKAzT0uz3V8RyY/VWUzVYRFBr18QwOTV+vHMOb+W0cCoiQOCUFl
         /j0YBI7DdgT8hiYlO6dxmbz2OQgdgx8bmDg6D/Fy2tOwjOu656BpKnXakhykMyUc9eki
         19BOTOYknlhHcGTGCb3xhbukhGGMGv4ia+UIlCbLoYtesRcSvLPckAkAOX2QY5EAkHj0
         Xr+Hes/nCi5/vs0ZE/mtdh1uofydlFd5VLiO2ZxPt8BkcCdoa1FOa4/dkRYKjc8rcQDt
         dQWsdj06j9XU7RqvMuQ/ymkp5FxS2q0+vHbWYVT5htOThD92wet3YwNDN4XnL2jtpwKs
         N2Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BhxOaCPl2L/7wmOgFqcKsHp9qSRzMF8ERmKEPbRreik=;
        fh=AA8nwzaNg0eqKFMUcsOr1hNUWfxx/oqKojwv8zpjeuA=;
        b=i3IWwNxg6hwjbYM0QxVVh+V6MNE32ssMbX6Tbv55K/frKSdN4CkxOqHZRdiZme2BqG
         8CLP5yiAE7BVvrVd0I5NpeySr337VK/Y5ArkdPk0awEGyvFCY4f1gGYC+OPfWKBngnOm
         LUWYynphDTM+HdXXV6sryq6jGNwKce/2tpPVCN6KdJTBv4VnSFnf9cGJVAkgafYbbkBb
         N7fOUEPjD4ZCnAIvb4pLBfbHVhtr14jFnInZGP230o7NJCWTaYhXWpThb1AXuEt665WF
         nDGz13OeKM9TdcnyddA/pJA4/oJPSNarTvDRZJjs210vsJJCefHeAH9n67r6ouXDlH3B
         7I+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784580649; x=1785185449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BhxOaCPl2L/7wmOgFqcKsHp9qSRzMF8ERmKEPbRreik=;
        b=j5dDQhQb9wsL4a+h2C37lgWGc6jOtfSWZmBR5XIDsQeUDpJas7rwnGufDpK8vm/itK
         O/ReuiQcpt9KJsCJleH1gN8X6eqOzpePtqFmhyX5Uw41p0eq1zaANd08AthDKcRFuPdO
         CgzlCiLMRt/HRsZuwRmvzCgn+WLA+YEM/KCsYI23m0ICQqnSWXhyuYBTPyhw7cMOlWqR
         XXYf+xDmyyXghr6YFLcJSRLv7IW91X3psivCq77821VoQHJ/2ELumrb6RzuRxcW5dCON
         Jydp3EU4xdbwHHpTQsI6wiJmgxfhwDoymfJW7LNO4B7l0FDazJ5MaJ4tejO0UMCBfyvz
         +7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784580649; x=1785185449;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BhxOaCPl2L/7wmOgFqcKsHp9qSRzMF8ERmKEPbRreik=;
        b=ngKGTvIvCN4zblZROZMaQ7AufhnB5J0tfPH+EewKJBvYH6zrPokzpW9JPE7LopBjXH
         u2nDRXFPwKlOTs39Nwkago/sd+Uol+d4H0c2dFzE+VgAVlFnostpOLqjPwxm1mjsKsnU
         tQlxn2D14kHlIwtaNM8k9rSg9aMC5QeLrYeRn8Ni2619yvWngBiS4nIhAfIvrlzxp5KX
         1fChZOcb8fuKDHrPkBw1pd0FhG7yUipa/sbmbjmWMDXAlBlDt83iYnZy8SeNiURVMJW+
         ZsJ3E5cEJ6YlGWH7UsOMOnngs66n2U7uNxs4AzjK40RjQiX6uA4qtTtyVxYi724rH8PN
         UNVQ==
X-Forwarded-Encrypted: i=1; AHgh+RopGP3oaLjg51gDBha9XzxLUv73adnOQUy4sF7U7hV69Jie8ft5OOLKfSXUwGw0Lwh/8behC/PPvunJZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcFHKSV9sS5iX6aKyUD4yUBROcnKuiHwzp9UyNDyeV/qPFKYCf
	6bkKfvTM+ExlPszOZoqwwukuDzzV5XgEdYVTNhRWjRBMbarQvZWeoWboWVW14nxR8cfJBiZsZdP
	rpYVD4vYbv8W16Si/+/TM3Hqv14fchYSEf3nSTMQ=
X-Gm-Gg: AR+sD125mpcPO7U6erUp8ty6OIkXjIxaPLiD2gS0pq6fBSiifm7jVtFB3cHlEZjsr8u
	XKsTklL+Kvq/DAC3YEfeW6chdN3i6JSoPR4+crs4YRh/+jddXfXpVR4pq/C6yDrlNOYjg4RXRPS
	xN4xYrGcb8l/Ni5ib9EcblUBrH10/SxI0hQwJHvgWk/iQG3JjkySSE7C0qdZkUV7tDsYkqccXtx
	LhipKdlRJhxCnD/UwmqOLhlI2pv8h2Ogi1XrRBaKBfHVZjr0YfyKrFBQIPw43VtQ8Sg6pA=
X-Received: by 2002:a17:902:e809:b0:2ca:6bf:5bac with SMTP id
 d9443c01a7336-2cf7b526eb3mr2607655ad.8.1784580648065; Mon, 20 Jul 2026
 13:50:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909111216.18d5f78c@foz.lan> <20260529160314.1224731-1-briandaniels@google.com>
 <20260712082408.49de652a@foz.lan>
In-Reply-To: <20260712082408.49de652a@foz.lan>
From: Brian Daniels <briandaniels@google.com>
Date: Mon, 20 Jul 2026 16:50:36 -0400
X-Gm-Features: AUfX_mwXbZbUL7zpneFDwzbmVcHt8hoN_ki6XZSBZu4Lr43MrLgflM3PQqqai-Q
Message-ID: <CAD4i_GTVTmuHqGivQRikd6N0j_DPAC6f6HV2YgjN9qBm9VDVOQ@mail.gmail.com>
Subject: Re: [PATCH v3] media: add virtio-media driver
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: acourbot@google.com, adelva@google.com, aesteve@redhat.com, 
	changyeon@google.com, daniel.almeida@collabora.com, eperezma@redhat.com, 
	gnurou@gmail.com, gurchetansingh@google.com, hverkuil@xs4all.nl, 
	jasowang@redhat.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, mst@redhat.com, 
	nicolas.dufresne@collabora.com, virtualization@lists.linux.dev, 
	xuanzhuo@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 12, 2026 at 2:30=E2=80=AFAM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> On Fri, 29 May 2026 12:03:04 -0400
> Brian Daniels <briandaniels@google.com> wrote:
>
> > Hi there! My name is Brian Daniels and I'll be taking over upstreaming =
this
> > driver from Alexandre Courbot.
> >
> > I've consulted with Alexandre and my plan is to upload a v4 set of patc=
hes
> > shortly based on the feedback from this revision.
>
> As you promised a v5 to Michael, I'll wait for it to review the new serie=
s.
>
> For now, let me address the replies from you on the top of v3.

Thanks very much! I'll try to note any comments that we can move to
the v4 thread so we can consolidate our discussion.

> > Before doing so, I'd like to address some of your comments:
> >
> > > Hi Alex,
> > >
> > > I didn't see on a first glance anything that would cause locking
> > > issues here, but, as I pointed on my last e-mail, testing with
> > > qv4l2 at the max res of my C920 camera, it ended keeping 24 CPUs
> > > busy without showing any results with qv4l2 (via ssh at the same
> > > machine). So, I suspect that there are issues somewhere, but I didn't
> > > debug any further.
> > >
> > > Please do some tests with a high-res camera, using either ssh or
> > > GPU emulation to see how this behaves with real apps.
> >
> > I did some testing with a 1080p USB webcam over ssh using ffmpeg and I =
was able
> > to stream video to disk without any issue. Let me know if you'd prefer =
I test
> > with a specific setup.
>
> You need to test it displaying on a X11 or Wayland window inside the VM, =
not
> just via an app like ffmeg.

I was able to test this successfully. Please see my comment in the v4 threa=
d.

> >
> > > > +config MEDIA_VIRTIO
> > > > + tristate "Virtio-media Driver"
> > > > + depends on VIRTIO && VIDEO_DEV && 64BIT && (X86 || (ARM && CPU_LI=
TTLE_ENDIAN))
> > >
> > > Why are you limiting it to x86_64 and arm64 little endian?
> >
> > The little endian requirement comes for the section 5.22.6.1.5 of the v=
irtio
> > v1.4 specification [1]. The limitation to x86_64 and arm64 is for two r=
easons:
> >
> > 1. The specification requires all v4l2 structures to use the 64-bit lay=
out
> > 2. This driver has only been tested on x86_64 and arm64 so far
>
> I don't like non-portable interfaces. If the spec is not good, it needs t=
o
> be fixed; if the problem is at the API interface, you may need compat32 o=
r
> similar to ensure that the interface will work independently on host/gues=
t
> CPU differences.
>

For guests that are not natively 64-bit little endian, the driver
would be required to perform the translation. This is done in other
virtio drivers (e.g. virtio input: in drivers/virtio/virtio_input.c,
you see `cpu_to_le*` and `le*_to_cpu` doing the conversions).

This driver currently doesn't perform this translation, which is why
the Kconfig includes the restrictions. Does this need to be addressed
in the initial version? Or can the translation be added in the future
for expanded platform support?

> >
> >
> > > > +/**
> > > > + * enum virtio_media_memory - Memory types supported by virtio-med=
ia.
> > > > + * @VIRTIO_MEDIA_MMAP: memory allocated and managed by device. Can=
 be mapped
> > > > + * into the guest using VIRTIO_MEDIA_CMD_MMAP.
> > > > + * @VIRTIO_MEDIA_SHARED_PAGES: memory allocated by the driver. Pas=
sed to the
> > > > + * device using virtio_media_sg_entry.
> > > > + * @VIRTIO_MEDIA_OBJECT: memory backed by a virtio object.
> > > > + */
> > > > +enum virtio_media_memory {
> > > > + VIRTIO_MEDIA_MMAP =3D V4L2_MEMORY_MMAP,
> > > > + VIRTIO_MEDIA_SHARED_PAGES =3D V4L2_MEMORY_USERPTR,
> > > > + VIRTIO_MEDIA_OBJECT =3D V4L2_MEMORY_DMABUF,
> > > > +};
> > >
> > > I'm not a big fan of renaming USERPTR to SHARED_PAGES and
> > > DMABUF to OBJECT, as it makes harder for reviewers and contributors
> > > to remember about this mapping. Also, everybody knows exactly what
> > > DMABUF means, so, it sounds to me that this obfuscates a little bit
> > > the driver.
> > >
> > > Also, why are you encapsulating V4L2 names into VIRTIO_* namespace?
> > > This just adds extra complexity for reviewers without any real
> > > benefit.
> > >
> > > Besides that, doing a grep on the patch, it sounds that this ma
> > > is not used anywhere.
> > >
> > > So, please drop this mapping.
> >
> > Agreed I don't see it being used anywhere, I think this was included or=
iginally
> > since it's part of the virtio spec. I will remove it.
> >
> >
> > > > +#define VIRTIO_MEDIA_EVT_ERROR 0
> > > > +#define VIRTIO_MEDIA_EVT_DQBUF 1
> > > > +#define VIRTIO_MEDIA_EVT_EVENT 2
> > >
> > > OK, here, media events are different than virtio events, so having
> > > a virtio-specific events make sense. Yet, better to add a comment
> > > about that.
> > >
> > > Also, V4L events are defined as:
> > >
> > >     #define V4L2_EVENT_ALL                          0
> > >     #define V4L2_EVENT_VSYNC                        1
> > >     #define V4L2_EVENT_EOS                          2
> > >     #define V4L2_EVENT_CTRL                         3
> > >     #define V4L2_EVENT_FRAME_SYNC                   4
> > >     #define V4L2_EVENT_SOURCE_CHANGE                5
> > >     #define V4L2_EVENT_MOTION_DET                   6
> > >     #define V4L2_EVENT_PRIVATE_START                0x08000000
> > >
> > > As one may end wanting to map them on some future, I would change
> > > the definitions above to:
> > >
> > >     #define VIRTIO_MEDIA_EVT_ERROR V4L2_EVENT_PRIVATE_START
> > >     #define VIRTIO_MEDIA_EVT_DQBUF (V4L2_EVENT_PRIVATE_START + 1)
> > >     #define VIRTIO_MEDIA_EVT_EVENT (V4L2_EVENT_PRIVATE_START + 2)
> >
> > These event values (VIRTIO_MEDIA_EVT_*) are set by section 5.22.6.2.1 o=
f the
> > virtio v1.4 specification [2]. I don't believe we have the ability to c=
hange
> > these values as suggested without changing the specification. That woul=
d most
> > likely be a lengthy process, so I'd prefer to keep it as written if tha=
t's not
> > an issue.
>
> The specs you pointed seem to be specific to V4L2. I can't see any reason
> why not adjusting it to provide an interface that doesn't conflict with
> V4L2 existing events.

I added a response in the v4 thread where you brought it up as well,
let's continue the discussion there. Thanks!

> >
> > > > +#define VIRTIO_MEDIA_MAX_PLANES VIDEO_MAX_PLANES
> > >
> > > Here: why renaming it to VIRTIO_* namespace?
> >
> > This matches the name in section 5.22.6.2.3 of the virtio v1.4 specific=
ation
> > [3]. And Alexandre stated the reason why it was renamed from VIDEO_* to
> > VIRTIO_MEDIA_* was from an early piece of feedback to avoid V4L2-specif=
ic names.
> > Even though virtio-media reuses the v4l2 structures and API, its possib=
le to use
> > virtio-media with a different media implementation other than v4l2.
>
> In thesis, it would be possible, but it sounds unlikely that this would
> ever happen, as other OSes may have completely different media APIs.
>
> So, in practice, if one wants, let's say, a Windows host to run a media
> virio, it would either need to implement V4L2 internally or will need
> different virtio drivers using a different API.

As far as using a non-Linux OS as your host, then yes you would need
to implement v4l2 internally,
or at least a subset that can interact with v4l2 drivers.

For your original question about why VIDEO_MAX_PLANES was renamed to
VIRTIO_MEDIA_MAX_PLANES, is there any action to take here? Or can it
be left as is?

> > > > +/**
> > > > + * struct virtio_media_session - A session on a virtio_media devic=
e.
> > > > + * @fh: file handler for the session.
> > > > + * @id: session ID used to communicate with the device.
> > > > + * @nonblocking_dequeue: whether dequeue should block or not (nonb=
locking if
> > > > + * file opened with O_NONBLOCK).
> > > > + * @uses_mplane: whether the queues for this session use the MPLAN=
E API or not.
> > > > + * @cmd: union of session-related commands. A session can have one=
 command currently running.
> > > > + * @resp: union of session-related responses. A session can wait o=
n one command only.
> > > > + * @shadow_buf: shadow buffer where data to be added to the descri=
ptor chain can
> > > > + * be staged before being sent to the device.
> > > > + * @command_sgs: SG table gathering descriptors for a given comman=
d and its response.
> > > > + * @queues: state of all the queues for this session.
> > > > + * @queues_lock: protects all members fo the queues for this sessi=
on.
> > > > + * virtio_media_queue_state`.
> > > > + * @dqbuf_wait: waitqueue for dequeued buffers, if ``VIDIOC_DQBUF`=
` needs to
> > > > + * block or when polling.
> > > > + * @list: link into the list of sessions for the device.
> > > > + */
> > > > +struct virtio_media_session {
> > > > + struct v4l2_fh fh;
> > > > + u32 id;
> > > > + bool nonblocking_dequeue;
> > > > + bool uses_mplane;
> > > > +
> > > > + union {
> > > > +         struct virtio_media_cmd_close close;
> > > > +         struct virtio_media_cmd_ioctl ioctl;
> > > > +         struct virtio_media_cmd_mmap mmap;
> > > > + } cmd;
> > > > +
> > > > + union {
> > > > +         struct virtio_media_resp_ioctl ioctl;
> > > > +         struct virtio_media_resp_mmap mmap;
> > > > + } resp;
> > > > +
> > >
> > > Heh, the above is tricky, as to parse the struct, one needs first
> > > to check cmd.cmd to identify what values to pick from enums.
> > > Also, the command is stored as: cmd.[close|ioctl|imap].cmd.
> > >
> > > IMO, better to place the headers explicitly there, e.g.
> > >
> > >     union {
> > >             struct virtio_media_cmd_header hdr;
> > >             struct virtio_media_cmd_close close;
> > >             struct virtio_media_cmd_ioctl ioctl;
> > >             struct virtio_media_cmd_mmap mmap;
> > >     } send;
> > >     union {
> > >             struct virtio_media_resp_header hdr;
> > >             struct virtio_media_resp_ioctl ioctl;
> > >             struct virtio_media_resp_mmap mmap;
> > >     } resp;
> > >
> > > Also, currently, there are 5 defined commands:
> > >
> > >     #define VIRTIO_MEDIA_CMD_OPEN 1
> > >     #define VIRTIO_MEDIA_CMD_CLOSE 2
> > >     #define VIRTIO_MEDIA_CMD_IOCTL 3
> > >     #define VIRTIO_MEDIA_CMD_MMAP 4
> > >     #define VIRTIO_MEDIA_CMD_MUNMAP 5
> > >
> > > If the data struct is limited only for close/ioctl/mmap, please
> > > document it and point what structure(s) other commands use.
> >
> > Tricky indeed!
> >
> > However, I don't believe its necessary to add an explict header member =
to the
> > union.
>
> My main concern is that the field used to check what is the content
> of the union is inside the union itself, e.g. virtio_media_cmd_header.cmd=
.
>
> So, if one does:
>
>         struct virtio_media_session session;
>
> it can't check what's the command with session.cmd or session.hdr.cmd.
> Instead, it needs to guess one type, like session.close.cmd to check
> if the command encoded there is close, mmap or ioctl.
>
> > Whenever the driver parses the union, it already has the necessary
> > context to determine which union member to use:
> >
> > - The struct virtio_media_cmd_* instances are always created by the dri=
ver and
> >   sent to the device, so there are no unknowns there
> > - The struct virtio_media_resp_* instances are always parsed in the sam=
e
> >   function that sends the corresponding command, so again there's no
> >   uncertainty about which union member to access.
>
> If it is always the same function that creates and uses it, you don't
> need an union. You can just use for instance
>
>         struct virtio_media_cmd_ioctl
>
> inside the instances that deal with ioctl resp (or ioctl creation).

I will look into this further in v5. It sounds like there are some DMA
alignment and padding requirements that need addressing for these
unions as well.

I can add the "struct virtio_media_*_header" to the unions if it helps
improve readability, but the headers won't be used by the driver
as it's currently written.

> >
> > For these reasons, I would hesistate to add the `struct virtio_media_cm=
d_header
> > hdr` as previously suggested. Please let me know if you disagree or if =
I've
> > misunderstood your concern.
>
> >
> > That all being said, I have added comments about which structures use w=
hich
> > commands in the upcoming v4 of the patches.
> >
> >
> > > > +/**
> > > > + * struct virtio_media - Virtio-media device.
> > > > + * @v4l2_dev: v4l2_device for the media device.
> > > > + * @video_dev: video_device for the media device.
> > > > + * @virtio_dev: virtio device for the media device.
> > > > + * @commandq: virtio command queue.
> > > > + * @eventq: virtio event queue.
> > > > + * @eventq_work: work to run when events are received on @eventq.
> > > > + * @mmap_region: region into which MMAP buffers are mapped by the =
host.
> > > > + * @event_buffer: buffer for event descriptors.
> > > > + * @sessions: list of active sessions on the device.
> > > > + * @sessions_lock: protects @sessions and ``virtio_media_session::=
list``.
> > > > + * @events_lock: prevents concurrent processing of events.
> > > > + * @cmd: union of device-related commands.
> > > > + * @resp: union of device-related responses.
> > > > + * @vlock: serializes access to the command queue.
> > > > + * @wq: waitqueue for host responses on the command queue.
> > > > + */
> > > > +struct virtio_media {
> > > > + struct v4l2_device v4l2_dev;
> > > > + struct video_device video_dev;
> > > > +
> > > > + struct virtio_device *virtio_dev;
> > > > + struct virtqueue *commandq;
> > > > + struct virtqueue *eventq;
> > > > + struct work_struct eventq_work;
> > > > +
> > > > + struct virtio_shm_region mmap_region;
> > > > +
> > > > + void *event_buffer;
> > > > +
> > > > + struct list_head sessions;
> > > > + struct mutex sessions_lock;
> > > > +
> > > > + struct mutex events_lock;
> > > > +
>
> > > > + union {
> > > > +         struct virtio_media_cmd_open open;
> > > > +         struct virtio_media_cmd_munmap munmap;
> > > > + } cmd;
> > > > +
> > > > + union {
> > > > +         struct virtio_media_resp_open open;
> > > > +         struct virtio_media_resp_munmap munmap;
> > > > + } resp;
>
> btw the same comment about the past union also applies here:
> if the code needs somehow to identify if the command is open or
> munmap, the field used to determine what command is there should
> be independent of open/munmap.

Yup makes sense. Let's see where our discussion above goes and assume
it applies here as well going forward.

> > >
> > > Based on struct virtio_media_session, I'm assuming here that
> > > this struct is used only for two commands, right? Please document
> > > it at kernel-doc markup and add a point to the other structure used
> > > for the other commands.
> > >
> > > The same comment about headers apply to the union here: place
> > > the header explicitly at the union.
> >
> > The same thing I said above applies here as well. I will add the commen=
ts as
> > requested in v4.
> >
> > [1] https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-=
csprd01-diff-from-v1.2-cs01.html#x1-8360005
> > [2] https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-=
csprd01-diff-from-v1.2-cs01.html#x1-8560001
> > [3] https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-=
csprd01-diff-from-v1.2-cs01.html#x1-8600003
>
>
>
> Thanks,
> Mauro
