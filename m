Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795009124;
	b=ZN6c31o6w0Pk3dbfdrpzAhZID3vqLRgUxsihzIIgwm3CdDw2VSYGY4voKWCNZXHTvH1V
	 4GuiamGwop+fgxMuvR71KkeoFqrOlGcrYHdm2Es4yxx6k+8umWl8EolLHCGfYbW+zUFl1
	 X24yTh1Q4k2t7SlPZJAdyJg3ygBZ/NpV1vuHE3coLkmDxDLK7pTvnCMZXT6YATipQdwIe
	 iKBRFk+MuWJk9c9kng4bprK0kE2gfPD2n7Bziw/HM/VJNNuBLx7ovUiNchpbVXf+ASczm
	 p5Q1X7PCQE2TS8jrQNxWgZVVRVTyNu1aroKtTYf5PuFlXjAqcaPsYgI4aOdu41lbMEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009124;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=h50xYCZDbBstrT/18dKKndyJ3XtJH6sY5/J/QnXGpDQ=;
	b=0Ee8pIDR1YqVmjBkLrsz7nPyrOQPR+/57agUdC8HXsveioI1GpczqHeMGjigBsKxbbrR
	 EP721KaefRHPs7fj33l6z1kR4q7mmfx7DE3+dOVN43kaOmsQIv6kouFiBGgYBah1OBaot
	 +6jmz9JeVuHY1IWiCB2BT622qqwd3xZqtanF5J0vq6kv5fZjAVDaXv8gSx/HD5up4OyNr
	 HwdaodVyZ1jGy9g7y7w67cWGENomWkQrHErZbAexL8+1Dw9F1PjnuU0gH5Qp2tUGJaoRq
	 eJ+QeB46ZEVxrkhYWnJv5lucbmDD67jNCVKWHaXSTHTL4FA/wJfc50y5ja81x+qohFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fe12Lp1Z;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="m1U/f12J";
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51F360A2603
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D51F360A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fe12Lp1Z;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=m1U/f12J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795009122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h50xYCZDbBstrT/18dKKndyJ3XtJH6sY5/J/QnXGpDQ=;
	b=fe12Lp1Zrc3jZjKIO/xQJhFxwIRVd/dPqKU5wEIms0tzzRBR8II5lPrHI28IhHdKFK2DU8
	98he96vFnC9Y39yJxeyEhFMnh9ta9GBDAnaJi0ci9FiYJ7s9hYxsXE0FybpETdd3R54uDT
	8JuqUvCNuZf+kVRCHqOTf45HmsJgP38=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-XEqT2ze2Nkep6UKfmzdUmw-1; Wed, 18 Nov 2026 08:38:41 -0500
X-MC-Unique: XEqT2ze2Nkep6UKfmzdUmw-1
X-Mimecast-MFC-AGG-ID: XEqT2ze2Nkep6UKfmzdUmw_1795009121
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b4d09fefd7so8992487b3.1
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 05:38:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795009121; cv=none;
        d=google.com; s=arc-20260327;
        b=MIG+vtzguLVdoL+n788oA1v2kBFLSWbxJ+K2YMk9rTsPEpacCCZKuh5OZLxA3wQpIA
         wnUvXYhs+YnjH8AXqnz8wa1Ab3DXAeg6Fdr3iqzapq56JrztgkLPuy1BvKRUQbe+7qG8
         oelQHpX5gxgUCaMsTeVcqwvc6Bq9zw8Sq8olnLvUhEK2gVUtSRiQrTju9n+M8Tmuki9N
         CxRz12P804yiUqCDiZ3cCzNhh6kMW8yTmNJpVvPKHZmqcrA+/gR/X9BON2r897Bwf1Pf
         Gmal+zKnhYwPZI+iNGm4hmuE+9vhTVM27c22BZJ0FDS2i73osdjxnMCy/Y7CWp1wbP0e
         4AaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h50xYCZDbBstrT/18dKKndyJ3XtJH6sY5/J/QnXGpDQ=;
        fh=rM5uMMLKDj7d1U4nVpeh5F3FxfshRry3XW1wdxAdWGM=;
        b=pWNTziF3tTs6QTWGmdcEiiOMe/19UfajqimBuzvBX3vS7EKgM0/j9I4JTvDQx+/SRH
         544X+D3PQ54YztBujjL1YKS3Nxf9vT8ki9gYDTBm3lKXcAUvz4sJSnhnPwlhVlVKJdVV
         Rt6f67S1j8I8T35tWyDh7z0FdmCDpmlXI3WTD3swERqeDXUcQVj5VLaG7qdtjHXlAPFt
         XTgij5eRQdJHPG+380NwpG7Z/xcbW8yt7uPlFGyRtDzM9Smg6iDtWWmfzCK9N0OTOT1X
         43i21PHqsiaPCKRBuk/QuV48jDH8OvwigTiA4fCuGa+3qsf095nDDiDrGFSIELQ4mFiF
         51iw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795009121; x=1795613921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h50xYCZDbBstrT/18dKKndyJ3XtJH6sY5/J/QnXGpDQ=;
        b=m1U/f12J+ShUTGTGggJRi8KWH5geQbIoUtFMFOrndyGwP0Lkjvyue4j595npuKQp7v
         UynlTtWXc/N0WgxJO1Eh9B0rgmNUcUCd/fe2y2aqqhwEQc5sz7XB3d3BF8blaFQQsm6l
         BIFKk/wJx3tUMG+ZzqdOa04aWuQnHC9c3eHjYq77Zs5R6PpyZS6fg5pUCCDzRlxbuqeL
         6TWfG8AGCYSHLpH+pLf9WpAQ9HEa4rOwR2cAEOBu/tri1gSzxl1aXRj3xSBR9pXZKIMm
         9sqYw0Eu6CMouTg16/H3YR/idZKQXNHpJbp9J077XuX6pp7ekW4DOfM8so6CkAaAAyiW
         esFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009121; x=1795613921;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h50xYCZDbBstrT/18dKKndyJ3XtJH6sY5/J/QnXGpDQ=;
        b=CypWaNlIry3oCSIP/+zZMkO1/1c8ADQ5WtBQKSSFZlVQpi2/oZ/EImJV0xcRfgfC01
         PoR61O2BMFMYYgz0nt3HfxcuOIpdL/ZlB7Y8wxeja0toLQXllUn/RagZ8w7nBp0kcFRI
         agQ2f/PAyE/7vM5K8dPsNGf9uQobNcUXvsgd5uz26gp8+M/frIGSzJQ4GyOfti+507jg
         7tdPP70unQ4k/AdfOa9g9w1Jyq0BI4tK4Ta4nypzed3FoY3L+3bRrVtzjPSrvj2Etboy
         8EAMr9g9y9HEeRUYe3htPv8pAxEBy02jJn6/URyC3uttpZc9aIBppZ7YgCUTJn94SDgd
         5wjw==
X-Forwarded-Encrypted: i=1; AL+hErGCTw9it+SO3D2dBg1ANVEa8Cey3R9s781nxYZYfGVeQ7oq22h+O0UQ1uFpnODyBRIyH6F67uRI+IGB2A==@vger.kernel.org
X-Gm-Message-State: APuU4Z9bMXmg7hymkgbmrZ7MemjFaWqBAMtsTLzo2Bl8wYO7Y11cYfUx
	JS9HHIPJOP0wx7PW23A3YBMNqTFO38/mf339McoerjZASUncg8sjxCwZwxDN61zMnaCy/uYrWn7
	X0luXtl9kmKcPteXO1HQsR63ftL7uHIWxurIu8GZ0X3J6KUKamBv1fmJ8e1LXLRODDhcxA2ohG/
	dU6emLNe4m4Gn4LDmhNKsMRm46ehYhDbNksBf0/cE=
X-Gm-Gg: AZFdTZd1HQ+yTYs6fxU7SXIxbnzZm9+v6YVea2PBekw+RR9X7vYfPFloZD5/a/D2RxE
	VoBliBk4O6UAFQI9UcIIT64XPO8eg+5IxapsRathTtqI3N0bJDL2nb1hTS3ROaMqjxxXZwRzOBN
	41oXiNzT/f1e2ZgUPeV0wvn/ZgJiKHZ6F/DgYxYFJo6DxH5ystjo8qngUh
X-Received: by 2002:a05:690c:368a:b0:873:5bb2:6bfd with SMTP id 00721157ae682-8b4fed83351mr10018037b3.39.1795009120696;
        Wed, 18 Nov 2026 05:38:40 -0800 (PST)
X-Received: by 2002:a05:690c:368a:b0:873:5bb2:6bfd with SMTP id
 00721157ae682-8b4fed83351mr10017817b3.39.1795009119849; Wed, 18 Nov 2026
 05:38:39 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-v2_20230123_tjmercier_google_com-v5-0-1ce975f2a9ad@redhat.com>
 <4356992ac4fb7876fb5759189ba4b492@paul-moore.com>
In-Reply-To: <4356992ac4fb7876fb5759189ba4b492@paul-moore.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 18 Nov 2026 14:38:28 +0100
X-Gm-Features: Aa3M54php6hihR6Ihi3l34Ri9nQdKaLYB3Ss2kJeRmi5f3v9ab0vBjDa0q2nnvI
Message-ID: <CADSE00JyTwrbNh4r8PZWLqOHWpepyHkaL+9fkc+AbVRmCc-f-g@mail.gmail.com>
Subject: Re: [PATCH v5 0/8] memcg: dma-buf cgroup accounting and charge transfer
To: Paul Moore <paul@paul-moore.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Christian Brauner <brauner@kernel.org>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Shuah Khan <shuah@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	=?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>, 
	Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>, 
	Philipp Stanner <phasta@kernel.org>, airlied@gmail.com, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	echanude@redhat.com, mripard@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 11:54=E2=80=AFPM Paul Moore <paul@paul-moore.com> w=
rote:
>
> On Nov 17, 2026 Albert Esteve <aesteve@redhat.com> wrote:
> >
> > Shared-memory allocator services (e.g., Android's gralloc)
> > allocate dma-bufs on behalf of client processes in different
> > cgroups. Today those allocations are charged to the allocator's
> > own cgroup, leaving client cgroups with no visibility into their
> > actual memory consumption and defeating resource limits.
> >
> > This series adds memory cgroup accounting for dma-buf allocations,
> > building on T.J. Mercier's earlier series [1] and incorporating
> > feedback from previous versions and LPC discussions [2].
> >
> > Patch 1 introduces the MEMCG_DMABUF stat and the
> > obj_cgroup_reserve_dmabuf()/obj_cgroup_cancel_dmabuf() and
> > mem_cgroup_commit_dmabuf()/mem_cgroup_uncharge_dmabuf() helpers
> > in mm/memcontrol.c
> >
> > Patch 2 wires up the charging policy: dma_buf_export() stores
> > exp_info.objcg and updates the stat, a new charge_fd field in
> > DMA_HEAP_IOCTL_ALLOC accepts a pidfd or cgroupfd to identify
> > the target cgroup, and __GFP_ACCOUNT is removed from system-heap
> > allocations to avoid double counting.
> >
> > Patch 3 adds DMA_BUF_IOCTL_XFER_CHARGE, a general ioctl on any
> > dma-buf fd to transfer charges post-allocation. This covers the
> > double-hop allocator case (SurfaceFlinger -> gralloc -> kernel)
> > and works for buffers from any exporter that opts in. Charging
> > is gated by dmabuf->objcg being set at export time, ensuring that
> > transfer is only applied for buffers backed by system memory where
> > size reflects actual bytes. If the receiving cgroup lacks capacity
> > for the charge, the ioctl returns -ENOMEM and the original charge
> > is preserved.
> >
> > Patches 4-7 add access control for cross-cgroup charging. Letting
> > userspace decide who to charge needs to be a privileged operation
> > because it has material impact on OOM decision and resource limits.
> > Charging outside the caller's own memcg subtree requires
> > CAP_SYS_RESOURCE. On top of that, LSM hooks gate the two charge_fd
> > flavours: security_memcg_charge_task() gates the pidfd path (target
> > identified by task credentials) and security_memcg_charge_cgroup()
> > gates the cgroupfd path (target identified by cgroup directory label),
> > with SELinux implementations using process2:charge_to and
> > cgroup:charge_to permissions.
>
> I'm probably misunderstanding the description here, but in both cases
> (the pidfd or cgroupfd case), ultimately the cgroup is charged, yes?  In
> the cgroupfd case it is more direct, but in the pidfd case it is still
> the cgroup associated with the process identified by pidfd, yes?

Your understanding is correct here.

>
> If that's the case - and it very well may not be (!) - it probably makes
> more sense to combine the two SELinux access controls into one.  Yes, the
> LSM hooks and callbacks would likely need to be different due to the
> mechanics of it, but the permission check "cgroup/charge" could be the
> same.

Combining SELinux access controls makes sense to me. I kept them split
because I wanted to preserve granularity between the two flavours, and
process2 seemed like a natural fit for the pidfd path, but I guess it
can still be achieved with a single permission through the target
types.

I'll rework for v6. So, in the pidfd case the check target would
remain the process's domain:

   allow allocator_t client_t:cgroup charge_to;

where allocator_t is the domain requesting the charge (i.e., the
central allocator), and client_t is the domain of the process the
pidfd refers to. The groupfd path would check the cgroup directory
label like so:

  allow allocator_t cgroup_t:cgroup charge_to;

Would that be ok?

>
> > Patch 8 adds selftests. The tests and vmtest script were mostly
> > written by an LLM, closely following the style of the surrounding
> > tests and the virtme-ng setup. All code has been reviewed and tested.
>
> I think we need to have selinux-testsuite tests to go along with
> this, especially as this would be the first patchset to add cgroup
> controls.  Historically I've pushed back on piecemeal cgroup additions,
> pushing for some basic design of how to manage access controls for
> resource management first, but since evidently no one wants to do that,
> we really do need tests.
>
> https://github.com/SELinuxProject/selinux-testsuite

Agreed! I was already playing with it between the last version and
this one. I have some tests drafted, more or less. I was unfamiliar
with the testsuite, so instead of offloading the work to an LLM, I
tried to follow along and proceeded too slowly.

I will link a PR when sending the next version.

>
> > Known limitations:
> >
> > - Single-owner model: a dma-buf carries one memcg charge regardless
> >   of how many processes share it.
>
> Once again, I'm sure I'm misunderstanding things, but are you saying
> that multiple cgroups can end up sharing the same dma-buf despite
> only one of the cgroups taking the accounting hit?

Yes, you are correct. A dma-buf (its fd) can be shared by multiple
processes from multiple cgroups, but only one holds the charge. With
this series it can be transferred, but never shared.

Sharing could be a follow-up series. Perhaps splitting the charge
equally? But sharing is a big problem on its own, so I preferred to
keep it out of this series.

>
> Hopefully the charged cgroup is deterministic?

Yes, the charged cgroup is deterministic: it is set at allocation, and
only moves via an explicit ioctl.

>
> > - Only memcg accounting. CMA heaps would additionally need dmem
> >   controller integration.
>
> Do you have a rough idea of how that would work?  I ask only because I'm
> interested in seeing if that would require an additional LSM hook or if
> there is some way we could leverage the same hook(s) used here.

Rough idea, yes. Today, no dma-buf allocation charges dmem at all, and
of course no target charging either. The first goal for CMA is simply
getting those heaps accounted. In that regard, Eric Chanudet has a
series making CMA allocations memcg-accountable with per-area counter
[1], and is working on extending that approach to dmem. It's a bit on
hold waiting for the feedback on this series.

But afaik the cross-cgroup charging and central allocator problem is
mainly a system-memory one. Whether dmem ever needs the same
cross-cgroup attribution (e.g., DRM central allocator wanting to
charge clients' dmem budgets) is not clear to me.

Nonetheless, if it does, the internals should be mostly the same;
everything, including the permission checks is controller-agnostic.
Only the controller performing the charge changes. I expect no
additional hook is required.

[1] https://lore.kernel.org/all/20260821-cma-memcg-regions-v1-0-d21b165b844=
0@redhat.com/

>
> > - If a transfer of an uncharged buffer fails, the buffer remains
> >   charged to the original cgroup. The allocator (userspace) is
> >   expected to handle this (retry, free, ...).
> > - The LSM hooks are intentionally narrow. Broader cgroup access control=
s
> >   (e.g. for the memfd/kexec handover case [2]) could be a separate effo=
rt
> >   reusing the same pattern.
> > - Only system heap sets exp_info.objcg today. Other exporters
> >   (DRM, V4L2, etc.) can opt in by setting it, but are not
> >   covered by this series.
> > - Related to the above: lazy backing-store allocation is not supported.
> >   This can be extended later, e.g., by adding a flag on the dma-buf
> >   struct for explicitly marking when memory is committed.
>
> Similar to the CMA case, any rough ideas on what this would look like?

Yes, again I have a rough idea. We already separate reserve and commit
operations, so the idea is to delay when a charge is committed. For
that we can use a flag in the dma-buf struct to mark when the memory
is committed. The limit is still enforced up front (so a lazy exporter
cannot overcommit), and the stat reflects the actual allocation.

The permission model is also unchanged for this case. The flag only
affects when the stat will reflect the charge.

Thanks!
Albert.

>
> > Note on TTM/GPU accounting [3]: that effort charges system memory
> > allocated for GPU buffers per page, with its own stats (gpu_active
> > and gpu_reclaim). This series charges at the dma-buf level, for
> > memory with no memory.stat category of its own; exporters whose
> > memory is already charged by their allocator must not opt in, so
> > the two do not overlap.
> >
> > [1] https://lore.kernel.org/cgroups/20230109213809.418135-1-tjmercier@g=
oogle.com/
> > [2] https://lpc.events/event/20/contributions/2416/
> > [3] https://lore.kernel.org/all/20260706052330.1110909-1-airlied@gmail.=
com/
> >
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
>
> --
> paul-moore.com
>

