Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794956091;
	b=4bD/oq4bmDmeWhZ0/2nePTgZBdch/zciLHK1BLi8cnOhaxacGnVzBT4O2UKCCAvqCa8j
	 T4OU0DEiziYxewfWxMhpaJ3Iid4ET3WC0/qtK1UeuMeJM4L9Ppj5Ubm3MZbu5pmAndnDa
	 5jMJxXa07GR1LqXpGDRxFInVAxZjT5RyOs4SBg0L5yAyp1rb2WwyQdqhwGZ3QpS9BbTVu
	 eVPwE2wtG0pSpZKy8EZKkmuo1smoCJqcDejxGOCS73YU0QZzQ4SKwUhv0gJDTLtIchV9U
	 WlZU1nSyrcnJlnlH9tvXIExmCFTWWgzUNdzbrioBzBkDwTvPY00Xb8dibHgniHRNDFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794956091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:From:To:Cc:Subject:References:In-Reply-To;
	bh=k7/QLUvYDzH8xZxy3OOm+8SYpFBmpzd+eC/ISXSLxiA=;
	b=05IBiJ5DG7KvmrodT8n43b08GmM/AAUmeN15frv5DuiVDhfjyL7fHw1q3GGpEqA8BWJ7
	 Bug51HYVHYpUndh6dgFV1gkRwRCPAPUrxxn0TyImP1a+SNbPo9ZJTTcub/ZDnypSG3fO3
	 nvZgWZc1Hbi93g/Hb1PXlzgLzqDyFCXtWyHDcqEOmVV2y4+KovHnzdLf4TY/zwIsMYZsf
	 S7tcHtbOG7QZXdcFJwE9KhWGPGk7M94EHqv3lGbJwSy6BqKFUm+lQkGq/LwxloTLkbe9b
	 Dg0CuRsKEMc3AK8comKnd3y+/aQkaWh/R5GBT5Mi7YKw9BHHOJcjs3oLmy48dNKqFAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=DIOqvTtw;
	arc=none smtp.remote-ip=209.85.219.50
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C81606A331
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 22:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24C81606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=DIOqvTtw
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91f1e3dd08cso977236d6.3
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 14:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1794956089; x=1795560889; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k7/QLUvYDzH8xZxy3OOm+8SYpFBmpzd+eC/ISXSLxiA=;
        b=DIOqvTtwgZ5ItvYEoe2KZqcsY3ZGLQ+HaihmoLRuvlSTEm54jSBGFp7446G3/I8rQV
         jdaaePJOPptbJB/iycrO1+C9CK7f1Lzi0/ZtjLgb3g74xLYezSMe33/lJcnXDXHCH2QR
         nPspoy5WRs3Kr/RdCST5lRUxeJijzn91kv7ip8tpuZvGiqXVwaGEyqsdCZ4UzGopcOig
         odhAaVLPfkteT28BObGagg1mfMyZi1OKOhsJXcZRCsolfwMYJPBhlTEF26Wy/fGeH2g/
         6GB9fJ+t+azZKqhhqQ/sH3UiAz8tKQMSv7Y+PqcaopnbJ1qBu03DBRydnqkMiL70S4pM
         2u+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794956089; x=1795560889;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k7/QLUvYDzH8xZxy3OOm+8SYpFBmpzd+eC/ISXSLxiA=;
        b=Ws3CN17BBCm1RttLLTcI5eNRACzv76J8QpKRc8+UQlr4nhzcrOu3XML+b3u/hwBUdp
         dPN2XxEJZ6VGIP1xxNlCpEP3HO+yACVafsK6dpEHBOk07uDKaRY2xwre3oqLapG/Os7L
         cyQaYygLxC1tLh+qVp7pJN3xXsQxlur7+x5djXYSv45Q660A4E9174xRyvO5v52l0Jod
         Hs9bVs3oi4uIna8cWjqeKQmTkD5ee5hezaGn9hVBkWYD/3XnU8s7rcayL6BQpkXzU68X
         07d+Fi9VEg4RV/8DQsLBJ4ZhK02K27rjOu9wbWtLUEysruEyiWpPB0MwxLaj71sda+th
         0+pw==
X-Forwarded-Encrypted: i=1; AL+hErHEw9VAqjkh1NrpXHzJnYjpiQLzEYi6IyWO9xCD4kDSaRBxi6N6tRuwvASDVnTJ3AThn03aWBUAi9qEXQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8FgLYUvoXDuDoUED8HfrjT3mYdxdLonIlgBgfYlyouulCXUBOY
	ViJmR+TKhCJoBFu3EQsBXdHNFYdBuZAaQQqZ/WyDhWOvvM5JPH8ZI3za7+C4Pu5pBQ==
X-Gm-Gg: AZFdTZcyOAdAYrKYFtPm/KfJpC4OfvUr6xGAMzXlfm3i/thNvQWutXV8mm/rcKlpKxr
	lNIoyfZpHET48YQQaCZtnNzoc475aaITRIgeJYcchHNYFeV5KcDIxo0Fp8sKq0g7w+2MmhbwzKw
	s/yWYVJ2jMQZqAiOo4iI3mjHnKRQ5FBFp9nkuOSFJYFIc+jTIYZB91/ueQXBb9R4fCbyuqanhuI
	x8hlejCm0Vv1xO8abL4DPyKCIYlkb+l4zRA1N7Jjz3Ko16cUcX/uaklJKnVOsovOZTM+kCBUA/X
	p1pg7gdIPJndkpZ7JK1QiiIAJ4YdkPA2W3VXi/G1x7iLz3NKwjnmVFobhX3ZKzGyNeupSmz6WVe
	ckHZQMGEf7M1cQ8lGsd3xyFeH/tMFnBhfjawNb9bnLuwiirrYqGxezyWS9dj0NUXcjrNmXTeeNe
	BP7Ot6J/OYmAU/4bw4F/H8QFgccEuafOykoiQaT+G7eqitdD1sFP3p12/JElsxSbziuwAmE0i5p
	/omTmbkkpBCaLPaio47qEOoxJBnUUmm4CrLAw2e8m/KnAF67iXvM5Rw6KEvDr/YrvXQrsuzcEoB
	BC5ZCwQ8Rv9PS5YeZGUNVKmEv6GcsUmIK+1j+YgBqce5SABpKe5M1vm+2HTKg4ZWFbu6FJVHII6
	JrlOJJl1zYbYdEN5o8H7HKvRaeB2rpw==
X-Received: by 2002:a05:6214:4981:b0:921:9ed:ee6 with SMTP id 6a1803df08f44-92114dd0d06mr10225486d6.20.1794956088668;
        Tue, 17 Nov 2026 14:54:48 -0800 (PST)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d53b7fsm5495766d6.26.2026.11.17.14.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:54:48 -0800 (PST)
Date: Tue, 17 Nov 2026 17:54:47 -0500
Message-ID: <4356992ac4fb7876fb5759189ba4b492@paul-moore.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20261117_1552/pstg-lib:20261117_1552/pstg-pwork:20261117_1552
From: Paul Moore <paul@paul-moore.com>
To: Albert Esteve <aesteve@redhat.com>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
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
	Philipp Stanner <phasta@kernel.org>
Cc: airlied@gmail.com, cgroups@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, linux-kselftest@vger.kernel.org, op-tee@lists.trustedfirmware.org, Albert Esteve <aesteve@redhat.com>, echanude@redhat.com, mripard@kernel.org
Subject: Re: [PATCH v5 0/8] memcg: dma-buf cgroup accounting and charge
 transfer
References: <20261117-v2_20230123_tjmercier_google_com-v5-0-1ce975f2a9ad@redhat.com>
In-Reply-To: <20261117-v2_20230123_tjmercier_google_com-v5-0-1ce975f2a9ad@redhat.com>

On Nov 17, 2026 Albert Esteve <aesteve@redhat.com> wrote:
> 
> Shared-memory allocator services (e.g., Android's gralloc)
> allocate dma-bufs on behalf of client processes in different
> cgroups. Today those allocations are charged to the allocator's
> own cgroup, leaving client cgroups with no visibility into their
> actual memory consumption and defeating resource limits.
> 
> This series adds memory cgroup accounting for dma-buf allocations,
> building on T.J. Mercier's earlier series [1] and incorporating
> feedback from previous versions and LPC discussions [2].
> 
> Patch 1 introduces the MEMCG_DMABUF stat and the
> obj_cgroup_reserve_dmabuf()/obj_cgroup_cancel_dmabuf() and
> mem_cgroup_commit_dmabuf()/mem_cgroup_uncharge_dmabuf() helpers
> in mm/memcontrol.c
> 
> Patch 2 wires up the charging policy: dma_buf_export() stores
> exp_info.objcg and updates the stat, a new charge_fd field in
> DMA_HEAP_IOCTL_ALLOC accepts a pidfd or cgroupfd to identify
> the target cgroup, and __GFP_ACCOUNT is removed from system-heap
> allocations to avoid double counting.
> 
> Patch 3 adds DMA_BUF_IOCTL_XFER_CHARGE, a general ioctl on any
> dma-buf fd to transfer charges post-allocation. This covers the
> double-hop allocator case (SurfaceFlinger -> gralloc -> kernel)
> and works for buffers from any exporter that opts in. Charging
> is gated by dmabuf->objcg being set at export time, ensuring that
> transfer is only applied for buffers backed by system memory where
> size reflects actual bytes. If the receiving cgroup lacks capacity
> for the charge, the ioctl returns -ENOMEM and the original charge
> is preserved.
> 
> Patches 4-7 add access control for cross-cgroup charging. Letting
> userspace decide who to charge needs to be a privileged operation
> because it has material impact on OOM decision and resource limits.
> Charging outside the caller's own memcg subtree requires
> CAP_SYS_RESOURCE. On top of that, LSM hooks gate the two charge_fd
> flavours: security_memcg_charge_task() gates the pidfd path (target
> identified by task credentials) and security_memcg_charge_cgroup()
> gates the cgroupfd path (target identified by cgroup directory label),
> with SELinux implementations using process2:charge_to and
> cgroup:charge_to permissions.

I'm probably misunderstanding the description here, but in both cases
(the pidfd or cgroupfd case), ultimately the cgroup is charged, yes?  In
the cgroupfd case it is more direct, but in the pidfd case it is still
the cgroup associated with the process identified by pidfd, yes?

If that's the case - and it very well may not be (!) - it probably makes
more sense to combine the two SELinux access controls into one.  Yes, the
LSM hooks and callbacks would likely need to be different due to the
mechanics of it, but the permission check "cgroup/charge" could be the
same.

> Patch 8 adds selftests. The tests and vmtest script were mostly
> written by an LLM, closely following the style of the surrounding
> tests and the virtme-ng setup. All code has been reviewed and tested.

I think we need to have selinux-testsuite tests to go along with
this, especially as this would be the first patchset to add cgroup
controls.  Historically I've pushed back on piecemeal cgroup additions,
pushing for some basic design of how to manage access controls for
resource management first, but since evidently no one wants to do that,
we really do need tests.

https://github.com/SELinuxProject/selinux-testsuite

> Known limitations:
> 
> - Single-owner model: a dma-buf carries one memcg charge regardless
>   of how many processes share it.

Once again, I'm sure I'm misunderstanding things, but are you saying
that multiple cgroups can end up sharing the same dma-buf despite
only one of the cgroups taking the accounting hit?

Hopefully the charged cgroup is deterministic?

> - Only memcg accounting. CMA heaps would additionally need dmem
>   controller integration.

Do you have a rough idea of how that would work?  I ask only because I'm
interested in seeing if that would require an additional LSM hook or if
there is some way we could leverage the same hook(s) used here.

> - If a transfer of an uncharged buffer fails, the buffer remains
>   charged to the original cgroup. The allocator (userspace) is
>   expected to handle this (retry, free, ...).
> - The LSM hooks are intentionally narrow. Broader cgroup access controls
>   (e.g. for the memfd/kexec handover case [2]) could be a separate effort
>   reusing the same pattern.
> - Only system heap sets exp_info.objcg today. Other exporters
>   (DRM, V4L2, etc.) can opt in by setting it, but are not
>   covered by this series.
> - Related to the above: lazy backing-store allocation is not supported.
>   This can be extended later, e.g., by adding a flag on the dma-buf
>   struct for explicitly marking when memory is committed.

Similar to the CMA case, any rough ideas on what this would look like?

> Note on TTM/GPU accounting [3]: that effort charges system memory
> allocated for GPU buffers per page, with its own stats (gpu_active
> and gpu_reclaim). This series charges at the dma-buf level, for
> memory with no memory.stat category of its own; exporters whose
> memory is already charged by their allocator must not opt in, so
> the two do not overlap.
> 
> [1] https://lore.kernel.org/cgroups/20230109213809.418135-1-tjmercier@google.com/
> [2] https://lpc.events/event/20/contributions/2416/
> [3] https://lore.kernel.org/all/20260706052330.1110909-1-airlied@gmail.com/
> 
> Signed-off-by: Albert Esteve <aesteve@redhat.com>

--
paul-moore.com
