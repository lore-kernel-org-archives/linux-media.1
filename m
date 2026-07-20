Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF613B38B1
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 20:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784578037; cv=pass; b=TmXjmIHZ0G3MyLJ7bbni2mZX+xKppmYTm+o/Pn6S50vm5+E820WRAfS5716Da8dmRMP6WQ25WV9mfIkfI1gTjULwD5lUTcv7mN/+gr1VP0n0L1+4dEctMOrRkIMhQY42nIV4PKhuG2RPFzG+KzfGsLIZtSlI63OysDp2L3eIfuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784578037; c=relaxed/simple;
	bh=SqL3degzZLHUkXp9EwtnnbweSN4ovzuW0PiF1qi0rCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QEMThbH+fiXvN1hNT5ZM8LZldxP2GQ9jNY/kSVh4AL5mu8B3yKZqV6M0RahGHvu3V/QHVOSlecak2Za9I8kjPHXWNhuRSA6EzSaysDcxQxL6BhkayW1zHQCPUmjn1q/IhjSfJ9+zVuf1mLNiFp4HGJdoCRrbl2Q8UD3vQi7TkBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jbjQuAhT; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jbjQuAhT"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cacef7d299so411815ad.1
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 13:07:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784578035; cv=none;
        d=google.com; s=arc-20260327;
        b=e7pfJ3WnhN4G9qNrQa3zzBSZPbjlu1WlGHuxNK95htNaYDoKKIzBKQAkSsS2My5Q/J
         RRwYCVqcnarMWq1lsLEC34v0U2dknlv7IOyQ4aaQqm79mGSXSlE3a4XGgesLGSTIq2GZ
         d533YdPw6pKSLXdYTtnFdg9wf37fuSVOeDvPXvW/8hWm5kV36q56bqwwGSojH+wI3Bai
         MC3zuRNV5ZUbC4C9fjwMYL9cOuNfJuxd5Bfankgi7izaW/VON49EUbk9LGKV6/sKhdQi
         m2cUfdLX2HV4EHN512ZtvRPwfdx87qk3w4tUChEkTdhCbwX1/TjKyml97HrEsM5OAd3g
         TbaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A/ClODyeOdd7PaXyNWgToVcSHxDJZKiN7tuU3APQ5w0=;
        fh=n4P5jfXH+zrRAHuM66icjyv6ngUlWjlcezgqgAGXmFE=;
        b=BqDeKNyE9Y8QOeBh54cevT29yoWt5iQEysMsPII/oHUhBuw9UdgdqSxM4mxdX6wf0X
         EFa70q0KrJZFD9mDRGTnVIzrkxGhzyIKqWr+OnbLFI9d4IA7/oXvSRzHCvOUMqkeO7lJ
         TS4uxnr6TTCjWDbDeNovdm7B3nRS4Z4BoypZ7FA+d5SBI6j4SDwuXHnqcDFh14pH+r6c
         qMnu5kcouG50Gv87H+GLiTi86LX1UDX5LB2WyzwE3Z/wH6Yoxyuy71XCo1ncRzj0U5dD
         cdoG8ZkPN8n7I4442B9SEfW3f0qXIT2zxQDM/LO5Q8LqeGgAhxkPBcGLOkYezrtiYGce
         nn8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784578035; x=1785182835; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A/ClODyeOdd7PaXyNWgToVcSHxDJZKiN7tuU3APQ5w0=;
        b=jbjQuAhTZ1zfb6mKMBAWROKfWKfABE7VdLVwP841nPlNSPA3kpAquc5M5eKCzTA3Ls
         S7t5o56nM4vh/+N3UvRZ+ajglabjD5fpZrXXv+i+6Nvnv/ESwuNM9N3nhy60Q56hRc0x
         pDfJbe/TVUM2fOk2FTOMLxYGIL0uAZJyTpDJbbZsgScJ5Nf7gAg75RkCMRkaudI1L6X3
         5TuXxIEy1n8bn2vL110Ld1Iutf+bx7ffNDoOXCZ81yPUSJe8IeO4QSzOjnOrSfTLxCof
         qW0t1b+6kECm0RDuNQRfhOs7tMrgKxz0ozak8KiE3ujcCp5FqAYMCOgxO2odRsxDKf5K
         FSWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784578035; x=1785182835;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A/ClODyeOdd7PaXyNWgToVcSHxDJZKiN7tuU3APQ5w0=;
        b=Bwm0hUk4QJD/LVZulKi6juHHGyMd0KOOCPR+grlw1IOYcjKwy0JB+YogS3KX1ZOILl
         PgIYLM4bJnd7l80orHaaINA//6uSvvCC5lzjv/1GHf/Jrg1Ho31ECrbjThCnFR2sGSGZ
         3a2Ykj9ugtzCA32kMvbbRMNPDkLA/H1jbNpO2mfsptp1S+7cJQ7jhWltXtsVUGPLEzsj
         v99sj6ScaFLLugU+/pLTjkL8xM/iUfOJAFAUnBeI6rRzXwSWd1T4RMbW/S9NczkAdS/k
         bqGkF7RfKAMmlR/IW1KbM2J1orKJa/Ak81IqCZSnz/IZBwSdmDB/mA+UnKUvTRcS7qfS
         UeSg==
X-Forwarded-Encrypted: i=1; AHgh+RpEaSOvK0DPO6ON1HWLUGBarLQcgYeK+CauWGlx1li47R9ZCGlRscqQ4asS0olCDFcGIfqnkNUtTXczGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXnn15c+bFCVG3RkwTnr38x9paGIos947H2tJ+LXG11AtvfdJY
	tVLyDcrm8JzKhSJjJs3CS+uvumWrK26MVcC+Y9N/CvJW9PalfkTkfw9SW9KH2+Ri0JtJJXJPN1a
	BQtbyarXviFNmOS1RutvGbM9RbKAjCtZbS+ojV51ynb14vmLx26eKP3kkSg==
X-Gm-Gg: AR+sD11DefyVgUt9OqaYLvwBeSOJh1+NdPeZV20wg0PEHypqsT6N0OqQOzVxhM1/PyA
	nh23swsqEiVy/B8S2LD9wn424XTzZD0rtzukB9xIBmO7YmdUvJq2sK7WoY5/06vyb7YTSQWzo/B
	rGQg2viEmtZfmAH+MCEja3NYC6Bzcm+YmLSkJW/bpsq4uL+T3KhijL29FOCYX1GAI9NjBhvN5LM
	4rVQ7gKbrFIHh1iwcEa1cqCAnga3L8DtwcOu8fH0nwauJQwSDvQQ4pmD9y1izV+w0RWRM4=
X-Received: by 2002:a17:903:41ce:b0:2b7:b03d:9dce with SMTP id
 d9443c01a7336-2cf7b68e33amr2522855ad.18.1784578034191; Mon, 20 Jul 2026
 13:07:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622204343.1994418-1-briandaniels@google.com>
 <20260622204343.1994418-2-briandaniels@google.com> <20260712092836.488acb8d@foz.lan>
In-Reply-To: <20260712092836.488acb8d@foz.lan>
From: Brian Daniels <briandaniels@google.com>
Date: Mon, 20 Jul 2026 16:07:02 -0400
X-Gm-Features: AUfX_myO5O3VrBnnpTc_5BC1JAiM2Vdq0nne5eHsfXFhzb508mfxB2BxpRGJ62Q
Message-ID: <CAD4i_GSDAF8o+ky6ddd5tig+icT3GaVruPUFMVUNpoOdRraK+A@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] media: virtio: Add protocol
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, acourbot@google.com, adelva@google.com, 
	aesteve@redhat.com, changyeon@google.com, daniel.almeida@collabora.com, 
	eperezma@redhat.com, gnurou@gmail.com, gurchetansingh@google.com, 
	hverkuil@xs4all.nl, jasowang@redhat.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mst@redhat.com, nicolas.dufresne@collabora.com, 
	virtualization@lists.linux.dev, xuanzhuo@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 12, 2026 at 3:28=E2=80=AFAM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> On Mon, 22 Jun 2026 16:43:36 -0400
> Brian Daniels <briandaniels@google.com> wrote:
>
> > From: Alexandre Courbot <gnurou@gmail.com>
> >
> > Add the identifiers and structs used to implement the virtio interface
> > as described in section 5.22 of version 1.4 of the virtio spec:
> >
> > https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-cspr=
d01-diff-from-v1.2-cs01.html#x1-82200022
> >
> > Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
> > Co-developed-by: Brian Daniels <briandaniels@google.com>
> > Signed-off-by: Brian Daniels <briandaniels@google.com>
> > ---
> >  drivers/media/virtio/protocol.h | 287 ++++++++++++++++++++++++++++++++
> >  1 file changed, 287 insertions(+)
> >  create mode 100644 drivers/media/virtio/protocol.h
> >
> > diff --git a/drivers/media/virtio/protocol.h b/drivers/media/virtio/pro=
tocol.h
> > new file mode 100644
> > index 000000000..5878d107c
> > --- /dev/null
> > +++ b/drivers/media/virtio/protocol.h
> > @@ -0,0 +1,287 @@
> > +/* SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0+ */
> > +
> > +/*
> > + * Definitions of virtio-media protocol structures.
> > + *
> > + * Copyright (c) 2024-2025 Google LLC.
> > + */
> > +
> > +#ifndef __VIRTIO_MEDIA_PROTOCOL_H
> > +#define __VIRTIO_MEDIA_PROTOCOL_H
> > +
> > +#include <linux/videodev2.h>
> > +#include <linux/bits.h>
> > +
> > +/*
> > + * Virtio protocol definition.
> > + */
> > +
> > +/**
> > + * struct virtio_media_cmd_header - Header for all virtio-media comman=
ds.
> > + * @cmd: one of VIRTIO_MEDIA_CMD_*.
> > + * @__reserved: must be set to zero by the driver.
> > + *
> > + * This header starts all commands from the driver to the device on th=
e
> > + * commandq.
> > + */
> > +struct virtio_media_cmd_header {
> > +     u32 cmd;
> > +     u32 __reserved;
> > +};
> > +
> > +/**
> > + * struct virtio_media_resp_header - Header for all virtio-media respo=
nses.
> > + * @status: 0 if the command was successful, or one of the standard Li=
nux error
> > + * codes.
> > + * @__reserved: must be set to zero by the device.
> > + *
> > + * This header starts all responses from the device to the driver on t=
he
> > + * commandq.
> > + */
> > +struct virtio_media_resp_header {
> > +     u32 status;
> > +     u32 __reserved;
> > +};
> > +
> > +/**
> > + * VIRTIO_MEDIA_CMD_OPEN - Command for creating a new session.
> > + *
> > + * This is the equivalent of calling `open` on a V4L2 device node. Upo=
n
> > + * success, a session id is returned which can be used to perform othe=
r
> > + * commands on the session, notably ioctls.
> > + */
> > +#define VIRTIO_MEDIA_CMD_OPEN 1
> > +
> > +/**
> > + * struct virtio_media_cmd_open - Driver command for VIRTIO_MEDIA_CMD_=
OPEN.
> > + * @hdr: header with cmd member set to VIRTIO_MEDIA_CMD_OPEN.
> > + */
> > +struct virtio_media_cmd_open {
> > +     struct virtio_media_cmd_header hdr;
> > +};
> > +
> > +/**
> > + * struct virtio_media_resp_open - Device response for VIRTIO_MEDIA_CM=
D_OPEN.
> > + * @hdr: header containing the status of the command.
> > + * @session_id: if hdr.status =3D=3D 0, contains the id of the newly c=
reated
> > + *              session.
> > + * @__reserved: must be set to zero by the device.
> > + */
> > +struct virtio_media_resp_open {
> > +     struct virtio_media_resp_header hdr;
> > +     u32 session_id;
> > +     u32 __reserved;
> > +};
> > +
> > +/**
> > + * VIRTIO_MEDIA_CMD_CLOSE - Command for closing an active session.
> > + *
> > + * This is the equivalent of calling `close` on a previously opened V4=
L2
> > + * session. All resources associated with this session will be freed a=
nd the
> > + * session ID shall not be used again after queueing this command.
> > + *
> > + * This command does not require a response from the device.
> > + */
> > +#define VIRTIO_MEDIA_CMD_CLOSE 2
> > +
> > +/**
> > + * struct virtio_media_cmd_close - Driver command for VIRTIO_MEDIA_CMD=
_CLOSE.
> > + * @hdr: header with cmd member set to VIRTIO_MEDIA_CMD_CLOSE.
> > + * @session_id: id of the session to close.
> > + * @__reserved: must be set to zero by the driver.
> > + */
> > +struct virtio_media_cmd_close {
> > +     struct virtio_media_cmd_header hdr;
> > +     u32 session_id;
> > +     u32 __reserved;
> > +};
> > +
> > +/**
> > + * VIRTIO_MEDIA_CMD_IOCTL - Driver command for executing an ioctl.
> > + *
> > + * This command asks the device to run one of the `VIDIOC_*` ioctls on=
 the
> > + * active session.
> > + *
> > + * The code of the ioctl is extracted from the VIDIOC_* definitions in
> > + * `videodev2.h`, and consists of the second argument of the `_IO*` ma=
cro.
> > + *
> > + * Each ioctl has a payload, which is defined by the third argument of=
 the
> > + * `_IO*` macro defining it. It can be writable by the driver (`_IOW`)=
, the
> > + * device (`_IOR`), or both (`_IOWR`).
> > + *
> > + * If an ioctl is writable by the driver, it must be followed by a
> > + * driver-writable descriptor containing the payload.
> > + *
> > + * If an ioctl is writable by the device, it must be followed by a
> > + * device-writable descriptor of the size of the payload that the devi=
ce will
> > + * write into.
> > + *
> > + */
> > +#define VIRTIO_MEDIA_CMD_IOCTL 3
> > +
> > +/**
> > + * struct virtio_media_cmd_ioctl - Driver command for VIRTIO_MEDIA_CMD=
_IOCTL.
> > + * @hdr: header with cmd member set to VIRTIO_MEDIA_CMD_IOCTL.
> > + * @session_id: id of the session to run the ioctl on.
> > + * @code: code of the ioctl to run.
> > + */
> > +struct virtio_media_cmd_ioctl {
> > +     struct virtio_media_cmd_header hdr;
> > +     u32 session_id;
> > +     u32 code;
> > +};
> > +
> > +/**
> > + * struct virtio_media_resp_ioctl - Device response for VIRTIO_MEDIA_C=
MD_IOCTL.
> > + * @hdr: header containing the status of the ioctl.
> > + */
> > +struct virtio_media_resp_ioctl {
> > +     struct virtio_media_resp_header hdr;
> > +};
> > +
> > +/**
> > + * struct virtio_media_sg_entry - Description of part of a scattered g=
uest
> > + *                                memory.
> > + * @start: start guest address of the memory segment.
> > + * @len: length of this memory segment.
> > + * @__reserved: must be set to zero by the driver.
> > + */
> > +struct virtio_media_sg_entry {
> > +     u64 start;
> > +     u32 len;
> > +     u32 __reserved;
> > +};
> > +
> > +#define VIRTIO_MEDIA_MMAP_FLAG_RW BIT(0)
> > +
> > +/**
> > + * VIRTIO_MEDIA_CMD_MMAP - Command for mapping a MMAP buffer into the =
driver's
> > + * address space.
> > + *
> > + */
> > +#define VIRTIO_MEDIA_CMD_MMAP 4
> > +
> > +/**
> > + * struct virtio_media_cmd_mmap - Driver command for VIRTIO_MEDIA_CMD_=
MMAP.
> > + * @hdr: header with cmd member set to VIRTIO_MEDIA_CMD_MMAP.
> > + * @session_id: ID of the session we are mapping for.
> > + * @flags: combination of VIRTIO_MEDIA_MMAP_FLAG_*.
> > + * @offset: mem_offset field of the plane to map, as returned by
> > + *          VIDIOC_QUERYBUF.
> > + */
> > +struct virtio_media_cmd_mmap {
> > +     struct virtio_media_cmd_header hdr;
> > +     u32 session_id;
> > +     u32 flags;
> > +     u32 offset;
> > +};
> > +
> > +/**
> > + * struct virtio_media_resp_mmap - Device response for VIRTIO_MEDIA_CM=
D_MMAP.
> > + * @hdr: header containing the status of the command.
> > + * @driver_addr: offset into SHM region 0 of the start of the mapping.
> > + * @len: length of the mapping.
> > + */
> > +struct virtio_media_resp_mmap {
> > +     struct virtio_media_resp_header hdr;
> > +     u64 driver_addr;
> > +     u64 len;
> > +};
> > +
> > +/**
> > + * VIRTIO_MEDIA_CMD_MUNMAP - Unmap a MMAP buffer previously mapped usi=
ng
> > + * VIRTIO_MEDIA_CMD_MMAP.
> > + */
> > +#define VIRTIO_MEDIA_CMD_MUNMAP 5
> > +
> > +/**
> > + * struct virtio_media_cmd_munmap - Driver command for VIRTIO_MEDIA_CM=
D_MUNMAP.
> > + * @hdr: header with cmd member set to VIRTIO_MEDIA_CMD_MUNMAP.
> > + * @driver_addr: offset into SHM region 0 at which the buffer has been
> > + *               previously
> > + * mapped.
> > + */
> > +struct virtio_media_cmd_munmap {
> > +     struct virtio_media_cmd_header hdr;
> > +     u64 driver_addr;
> > +};
> > +
> > +/**
> > + * struct virtio_media_resp_munmap - Device response for
> > + *                                   VIRTIO_MEDIA_CMD_MUNMAP.
> > + * @hdr: header containing the status of the command.
> > + */
> > +struct virtio_media_resp_munmap {
> > +     struct virtio_media_resp_header hdr;
> > +};
> > +
> > +/* The values for these events are set by the virtio-media specificati=
on. */
> > +#define VIRTIO_MEDIA_EVT_ERROR 0
> > +#define VIRTIO_MEDIA_EVT_DQBUF 1
> > +#define VIRTIO_MEDIA_EVT_EVENT 2
>
> As I mentioned on v3, media also has events. Some userspace apps may
> need them to do some optimizations related to buffer sync, source
> changes, motion detection and such. See the specs:
>
>         https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/=
vidioc-dqevent.html#event-type
>         https://linuxtv.org/downloads/v4l-dvb-apis-new/driver-api/v4l2-ev=
ent.html
>
> As the virtio driver may end needing such events in the future,
> it needs to start numbering its private events after:
>
>         #define V4L2_EVENT_PRIVATE_START                0x08000000
>
> which is where driver-specific events should be placed.

The VIRTIO_MEDIA_EVT_* event IDs are supposed to be seperate from the
V4L2_EVENT_* event IDs. The virtio events are for the private use of
the virtio driver and are never directly exposed to the V4L2 framework
or the user. They're events for the VIRTIO transport.
The VIRTIO_MEDIA_EVT_EVENT is used to pass through the V4L2 events
(shown in section 5.22.6.2.4 of the virtio spec
[https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csprd01=
-diff-from-v1.2-cs01.html#x1-8620004]).
As an example, here's the virtio message for passing through a
V4L2_EVENT_VSYNC event:

  struct virtio_media_event_event {
      struct virtio_media_event_header hdr; // hdr.event =3D
VIRTIO_MEDIA_EVT_EVENT
      struct v4l2_event event; // event.type =3D V4L2_EVENT_VSYNC
  };

The virtio-media driver currently doesn't send events to the V4L2
framework unless they were sent to it by the host device (through
VIRTIO_MEDIA_EVT_EVENT). However, if this changes in the future, I
anticipate we would have a function that mapped the virtio events to
the v4l2 events if that were necessary.

Does that make sense to you? Or perhaps I'm misunderstanding?

> Thanks,
> Mauro
