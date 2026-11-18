Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795010139;
	b=AJW5leTuoMZqYzMPZxjQ42wbJGNLVctn6txTpvfogzs1AEaEgl1Hu71PAivMLQJq+J0I
	 7unx33Hb0hjcDMQE+8rV/n+uO/hVKzMs1N7gtLLnof4IP50uaL06dwTNg18+uYbVNJ6kX
	 40SsVOHfu05rzeQzZwj5rMWeCvWS4K2dWeNOlnFKPToEIAj0ch6MqmZwCek95l9abd43L
	 A+YS8heZrQpAVj/ojFylKdg/zUshto4xkr5MsOGU6ZDahT2oAX8Y6TfsQoA3ZfgWmQHPf
	 0RYnVPRhqZKSVsGv2zpAFoRsbKlxf/tYQga9Htq+F47OuVwlmMWLABk9NzOliINMhLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010139;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=Q93IOK+81L655tUS3XT9KzQ8Uws4KOL15ej2huBrpiw=;
	b=KoylvLpqjxq/28bIbGG8aezsQm95Pe7jBJlJ0ki9VhGUasoAQZwIv9vV+wD6eWp21gQ1
	 b2h6lJFTvdwNMz/hl+6IAWOUcTlWPySOgYeJEnlVls/rpomZ4n8GadYfYNhUYW0p7kH0B
	 BpsWfiCukLqZI5zMlW54LsFNgXAceqXVVH4cIHFI9GyjKJmYTioGG8P+3JmpHWzH3ZN4H
	 kMWUTC9f0BfTsu5bVfZUdIVW/34P7GZLAkWo29BI8KOZxA41lMm6pYuCOQJdGW2ddd5LN
	 iE5RxUHMzwc5dM+YzC+NvJqpr1YPhOmz2ugMujXnlKxtGGB2zxVGJj1/mQ6bQqS4OoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QXfsJqiv;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="YdeGXNs/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AA9606A325
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3AA9606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QXfsJqiv;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=YdeGXNs/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795010137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q93IOK+81L655tUS3XT9KzQ8Uws4KOL15ej2huBrpiw=;
	b=QXfsJqivqBNqfL8AggaLxuMEBU7EfXUwQ79yX9mkY0DsyoJKv14Jj/OiqP17IwmtwHUvtm
	hDttkoYGz0xiCc9jOMzkOF5g6m+QAdI/wa8hDJ5BtVIpXff4tFeOjBu8nPrel8lbwUuT3W
	PR8WTtsSxNEPBpbDUz0KfAdFrL/sUoM=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-325-MvrYe_3wOVmEra6wTvtPCQ-1; Wed, 18 Nov 2026 08:55:36 -0500
X-MC-Unique: MvrYe_3wOVmEra6wTvtPCQ-1
X-Mimecast-MFC-AGG-ID: MvrYe_3wOVmEra6wTvtPCQ_1795010136
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-86c3a053d9bso13316987b3.0
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 05:55:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795010136; cv=none;
        d=google.com; s=arc-20260327;
        b=hDf4LbcduTcaDYwFe9YbDDKE20OHYIfyPQ/XskYR0K3Rh5dq/NoNXLqMlcEwR9sD6q
         be9P3oZwfGaWO0opqO3gtAFHzpc9AxSYOiU/oQSLTGOn6MEfIs6k3WvOIwT3d950U/vO
         JM2wHuRLuw96fFUAN+vz9u/Qv++Q136f0kkFCyz1l7/hxWrbPljq0eLQNJ7oF8jLdu1s
         Acbr0ymZ8gYgGJddUNpL5IDql5WmNqQbwgw2y2veTIeW3aNvXBmOOU0vVemP9RxZZKDO
         RmWkiWtEkGnW+YPlolUmBTWnz3zMQo0ciYNCm/CpySlwAI3tb1veUVKARNf+MWOyPnQP
         6Nwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q93IOK+81L655tUS3XT9KzQ8Uws4KOL15ej2huBrpiw=;
        fh=2nv0q4G832q7NTfK798wEKmG2I87N4bAOTPZJli8NIU=;
        b=cklJ9XbwWz8CcRvkh9ExQJGrS7AXi3ZQydxDhy/QgZag225cWj+3Z21lFH+tOfZQdv
         C9EIu7APfORNh1J/kU1QMLRBTN1g78EMlwooY8jGTBgcLgMuam4ZD14y8RQzsnjAdrAx
         V0453SMFmOw8wykt+wsurSU56FR3UTZGPKHvRZ6tu8+/lwBf6R2VkXDBhEeUs8DGNcR1
         Vqo0DqlGCfbORHf02e8p1xg6dSXoqGpSLYmydFVDMqqQqLOtt97IEDByJbUsGkqyWUL3
         RtgaGz2NZE//LqKwGIZrZN/ozEndpemnD9Pyh7ffaUS/LHFgRwrkCmDVE0VjV8c3+162
         /rLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795010136; x=1795614936; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q93IOK+81L655tUS3XT9KzQ8Uws4KOL15ej2huBrpiw=;
        b=YdeGXNs/g+hxp03HRbQSUUfYwpG+Q463Psgnm5pI6nowFTE0GT/AT+9Eba8UqJXu2F
         Rjm7s6KZtfcTE+jLnJqY9Yha9DiDRbhjBVk9n/zG7Tl/p4QVD4cOVryiVPrvuioWjJ2V
         kC4s94SucOy//FSYm1394CoCF5UK5zXU1gxH2PfPcfRIkd2mTJdDSJhVy7FSL4lT5EZc
         m+HBczANYjijzYP43BM9ZWyF2lkON43QQgIwWQhgllRW+41fvFVuY2rQaXLV1H9y0Dqo
         Sq+5Nt2E0oRySNF5RHc6s28Fs0dEBL+ug6DeSjIEnvBqVwZGg+FdASv6oArpfSCSBBSS
         kWvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795010136; x=1795614936;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q93IOK+81L655tUS3XT9KzQ8Uws4KOL15ej2huBrpiw=;
        b=SEmbC6kc6aav5JzdPTiDwEMZN9NMR+63rh8XteHQDi6cazOYWk7M1cs7fY41otglbC
         ukwj88BV1YSjZ+/b7IFO43zu9csR9eY65LdNabJuZiFlaInvvZIcEE2UzHPvazbThXs/
         bYaTyOVY4j2rjwTqXxkmhuuuWwSVWRZGxk2qA/UjOUzR8uTUK6xEzXfiF56x0BUShs/P
         I8SsHRr84FqjxKqRB1YShbpQIV8bMePvHKjUKmTc1J3zOGwk101RJzgOXp6QIUAAfmqz
         YEpKQTD8liGjokWl+4MZG+6gRPAQFbX5reP5scX3ihMKXu49AqsX2A49+9p5hL9D1f/b
         WSkA==
X-Forwarded-Encrypted: i=1; AL+hErF9UjUGn/tOP1tyNda1BTMyCmQ8RNG26oZLPbjIHAAyPtcfQjrQVMT0xuG/24mbVNcMvs+sfXgfkH1+zQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9cEkR8dxFE0Un2eTSpywIBrv7r6VguNzkouk3zfkabA/1FaAUU
	r23AXLxcV8Z/XqD3DU4WiWf/RjpQZ/G5ZkXHsB1Oju5uLeyDOXfJTBfvTDOlb78y68D3RVMnDdX
	sjh0B0z/2a0HR4C8eZhJjWguYmh8TroBMvr2ov97rKfNe6/J3xXO15UUluCbonmqpUGt1K6rG9s
	j/5wRgtE1qDJcFYI6u4EH+jPR5oCGkYQ4Bo2TbgcU=
X-Gm-Gg: AZFdTZedaXN2duO+0eofNhdu3D6FZ4zUDOGmfYIEo7No2AIb2bcxh7ZZsY9RYNEIV92
	RhchQvFfkeubvHbyv7purN/Jrz+Q849U7WIojNL6b44cBGk95KuiHIbNPeN/zFPa3/hAZvaem3C
	/Oj5F+YzN08QIazI52WH7HNd6GIGXgIdHopE+zEa7UmO3NAMx5yJcUcqdU
X-Received: by 2002:a05:690e:1387:b0:67b:f249:5b16 with SMTP id 956f58d0204a3-67dd3fdee8amr1338627d50.55.1795010135926;
        Wed, 18 Nov 2026 05:55:35 -0800 (PST)
X-Received: by 2002:a05:690e:1387:b0:67b:f249:5b16 with SMTP id
 956f58d0204a3-67dd3fdee8amr1338592d50.55.1795010135440; Wed, 18 Nov 2026
 05:55:35 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-v2_20230123_tjmercier_google_com-v5-4-1ce975f2a9ad@redhat.com>
 <44c0c45c0e2f47ed77bc45be47ebb3fb@paul-moore.com>
In-Reply-To: <44c0c45c0e2f47ed77bc45be47ebb3fb@paul-moore.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 18 Nov 2026 14:55:24 +0100
X-Gm-Features: Aa3M54okPSWfJ_g3ixS3iw1yy5owTDFGTKhnOXZ64bND8Gaqu8R-9XYtSNGyOOw
Message-ID: <CADSE00LVsFVOmezzLgPrPWDd+L+SSGzGvqKTiX25waxRnVPh9Q@mail.gmail.com>
Subject: Re: [PATCH v5 4/8] lsm: Add memcg_charge_task LSM hook
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
> > Both DMA_HEAP_IOCTL_ALLOC and the new DMA_BUF_IOCTL_XFER_CHARGE ioctl
> > accept a charge_fd field that, when set, causes the allocation to be
> > charged to an arbitrary process's cgroup rather than the caller's.
> >
> > Charging is currently limited to the caller's own memcg subtree unless
> > the caller holds CAP_SYS_RESOURCE. But the capability is all-or-nothing=
.
> > A process holding it, along with a dma-heap device node or a dma-buf
> > fd can charge unlimited memory to any other process's cgroup, potential=
ly
> > exhausting that cgroup's limit and triggering OOM kills independent of
> > the victim's own activity or privileges.
> >
> > Add security_memcg_charge_task(), called in get_obj_cgroup_from_fd()
> > when charge_fd refers to another process. The hook receives
> > the credentials of the allocating process (from) and the credentials
> > of the process whose cgroup will be charged (to), giving security
> > modules a controlled enforcement point for cross-cgroup objcg
> > attribution policy.
> >
> > When CONFIG_SECURITY is not set the hook compiles to an inline
> > returning 0, adding no overhead to the fast path.
> >
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >  include/linux/lsm_hook_defs.h |  1 +
> >  include/linux/security.h      |  7 +++++++
> >  mm/memcontrol.c               | 11 +++++++++++
> >  security/security.c           | 15 +++++++++++++++
> >  4 files changed, 34 insertions(+)
>
> ...
>
> > diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> > index 03cd90d5e623..2e6fcbe14d43 100644
> > --- a/mm/memcontrol.c
> > +++ b/mm/memcontrol.c
> > @@ -60,6 +60,7 @@
> >  #include <linux/lockdep.h>
> >  #include <linux/resume_user_mode.h>
> >  #include <linux/psi.h>
> > +#include <linux/security.h>
> >  #include <linux/seq_buf.h>
> >  #include <linux/sched/isolation.h>
> >  #include <linux/kmemleak.h>
> > @@ -3198,10 +3199,12 @@ static bool mem_cgroup_may_charge(struct mem_cg=
roup *memcg)
> >  struct obj_cgroup *get_obj_cgroup_from_fd(int fd)
> >  {
> >       struct cgroup_subsys_state *css;
> > +     const struct cred *tcred;
> >       struct obj_cgroup *objcg;
> >       struct mem_cgroup *memcg;
> >       struct task_struct *task;
> >       unsigned int pidfd_flags;
> > +     int ret;
> >
> >       if (mem_cgroup_disabled())
> >               return ERR_PTR(-EOPNOTSUPP);
> > @@ -3226,6 +3229,14 @@ struct obj_cgroup *get_obj_cgroup_from_fd(int fd=
)
> >               if (IS_ERR(task))
> >                       return ERR_CAST(task);
> >
> > +             tcred =3D get_task_cred(task);
> > +             ret =3D security_memcg_charge_task(current_cred(), tcred)=
;
>
> Do you ever envision this "from" cred being something other than
> current_cred()?

Good point. No, I do not.

> If the answer is "no", we might want to consider changing
> the LSM hook slightly to help prevent misuse in the future:
>
>   int security_current_memcg_charge_task(const struct cred *tcred);

Agreed. I'll apply the same to the cgroupfd variant for symmetry (its
"from" is also always current_cred()).

BR,
Albert.


>
> > +             put_cred(tcred);
> > +             if (ret) {
> > +                     put_task_struct(task);
> > +                     return ERR_PTR(ret);
> > +             }
> > +
> >               rcu_read_lock();
> >               css =3D task_css(task, memory_cgrp_id);
> >               put_task_struct(task);
>
> --
> paul-moore.com
>

