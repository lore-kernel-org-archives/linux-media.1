Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795528213;
	b=E11qVIog4srkBBZAak/qe6pG0E/m98j3GoOt+NC3b8AYAhGAZYar3o1tPz1FQoQL5zrR
	 cSrFp5zCtzbms8z9jji51BuWHl3mkBETE4Pr7hxvCEYqWAe9VKzDnUPPRlmR7YlQRyh5x
	 Z+bd34ZYuv5P12B4YcI7fcj/LOA/yhNb99xOOlLmikPwFEZ/nAHHW1UmD4GJpiYU6jtKx
	 wq7tp9DseSEhsoA9ZFoZjKBB4+iGzGOby108OiJbJNNQ9fA350xbubEnNX+lPVGBVk0HR
	 U9/LzSq6FrecC7SbShnjXr/lxEdrFmCuOsAkPAogUcmd4b6CYdCDbd0pE9YrIrfhiOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795528213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=XTPCHg4unEN6vtUDvCIgxfYMZVabwQIC4dv3+3CL15w=;
	b=4Q2k/BWWySYOyEXzAyHrsOs6S+6LZhHOq91G2Ezuo71INKcRSTHGLlkW7NJoeMPodl1h
	 H71AfvfROMtiURUx5H3QfkayL3H+mJ18poXIawK0C8BQS3SGr3iHgAS6W7Co6KNO/XBOq
	 StPJ8EPlvYVITFrXmJcUJ1U6WopBM+WSnnznz5j8eEv7jecNwNb9pEhvOvClOTC+HVjVR
	 AKFRQgFvEgveQ28RktpF+hb6mk2t/iu9lOTKw9pT/rAmRXIuHrlymzo7TeInMfI6sf1Xk
	 kEDgPjC5mfQRRtxcP6AIVS2vzXtpicFhiPpjg7BfU2uqj+pVm26mshU6dgOAtBEglwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=A8I4Yhd3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AE9606A321
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 13:50:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86AE9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=A8I4Yhd3
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-49412eb1474so2933771f8f.3
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 05:50:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795528211; cv=none;
        d=google.com; s=arc-20260327;
        b=IQsjJf1cs8hmG2CawSRLC2c8F76rTSf0XVRDj9I+8KHIHEnUhmmkgu/zxbVsJ7vRna
         TbvbzU9tMtM479xeBrRqzcf8xjFA4Aegnz9NixoxOUpVqA0o/pulJi38UEkHA/Iaqz3Q
         ERJz0qmlIcOsdgZO25amgI7/Pd1QVgEFEmONBDT4DDL5WwyLEe+e4trK0i3HzI3DkRjD
         YvgtZ9IqkHhUIxmxv/09Xbk/4/FlsjUxCByX1sFNguhYf2kPnq25PF0V15h2xOEmMjVZ
         eYAoSXTCKa9ChoH59mRNfdY9r/8nxcTUuVxm9EBFXsFdPBWFZbPBa+dx8zSAm3ThfH9V
         hVQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XTPCHg4unEN6vtUDvCIgxfYMZVabwQIC4dv3+3CL15w=;
        fh=tyz0QZZGjaYZ2ei6eJ/gZFwnVrSXJETwMtzIiayDjKI=;
        b=XvZroZUxOu4o7piZ2b+TrggyvCQDVMit39vuqy14Ro3bSlKd69/Pl8XzfbKRRfjMFV
         kNuwRhXWFt8DAjc6GfH+AIr0rv9Q6s3QFbqZy951ydF16af6azhckiiqdhEaOxyOeY7z
         olzvv2S+hMqN2C5PKgg8qBeng13/XlnbqLoEMy3U4/Ry7bcsWwSSVrvRDwErGgfQQhq4
         15/fDBMUMSWfi4yB8iPgZzXHq04MFFY4T9hdj9xw8cw6mZvKdE16jPX2phRSGWA7Rtb/
         l6LMF0konGaNbtObWJw36fkdVRtycmN97FGwjMr7itjgCVQYRM52A16vzGi8rI72xcEB
         STVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795528211; x=1796133011; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XTPCHg4unEN6vtUDvCIgxfYMZVabwQIC4dv3+3CL15w=;
        b=A8I4Yhd3hz3WrVqqp6QMzsDrRJ3HJpUPxahpoSPUafEcj3SFymXcsAZEIf+a8ALG0Y
         V6s6xA+Ay4lWI9NhS7nxfL6F29mbmiE0uOfCYQxnOZUS20qgiOGqYoApJy9HRpK68tu/
         HSDE3IpIQJQ4GKB5Z7mVIff3PBnaum/E2gzkgJ+jFNG6YlWz7P5hX0VEOjoFbkoF1lDn
         8Ndrqr7MabRwOciYR7MGfzUJA7NWdJsl6TU8hPnym7YlbmO7JaMnO34+0kr0IDyXTgzd
         2RYMtv2kGAXDO2iT8hQ8hVHgIcSefON4ja9k6LVugyoh7mCZfqIgxnZvX+r5RFBAMb5n
         NOnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795528211; x=1796133011;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XTPCHg4unEN6vtUDvCIgxfYMZVabwQIC4dv3+3CL15w=;
        b=N/VmIl4nJ0x3F2JHUAxR2SvK/AEVcrDdsKE1MgLKd2H5Y4wDyuSqorsKls3N1bUj5X
         Zjr1naRZHWtOB876gC+lE2mJzG5Xh77SZzkPs2KUFdQplrnhLI0o4HdDeGa6yRuKUim0
         oVSAGB4/lgAFsnt8NXC2T3aR7VBHSOPSKyf7Bym657hRpcsjrnm5q4nQfDg3c1+lWIYm
         ZT9yX1Ssm0qPCygCEzXvdI9/bGbA2txQCJvQ81qDb528t+MuBPNhPtVlGUzEVs1tUYGP
         DZiH/gZDFw3wLSDfmAgPWVjiNM6wU7NUivNkURGDYh/8z8bmKRZlhOJbU5qP4EJeRkwj
         tCVw==
X-Forwarded-Encrypted: i=1; AL+hErFKkLmDdGurM2xnu0H8EHlhojIMqV3bFmZ53GVgcTJ9Li4Nx32obENsiiXraPA4kX89M4tmlALEH/dXig==@vger.kernel.org
X-Gm-Message-State: APuU4Z8fT7/JQff2C1WWVniVPaPQ4yRrON4AZ1Bld+nXQZloREkiUY3F
	uEZ8KjhqjZ3EvNkNkpnBRMBrMZ8LLHbuHteKrY5KLfhqk1Nl5mWErvK3Hl6te87haPJj1xh9jxX
	uDsrPEBxQPovtfIAnTlm+L9SgQBgdXIA=
X-Gm-Gg: AZFdTZdoME9Xn2ufqo1SfWoPUGqMteS0wTUU8up67dAqoLpCsa+JyUsCe3WTiT8eHZY
	SzXRAa8haoLutJLJhGbz30dmBRytiLHM0JtWE8Nj+JG8OtZAhHQWRSvJ95yt4fO4JOeUqNwCPBq
	ieiLm248BHBpOkAN9tjATXAOqbpCJ6RQTcrLgXBt7jspr7FXTkGPu/thkXRr4OEUZ727lpux9DV
	qC/zdI1YDLO5PeQpJrkNX8y7/q6yCPfGTlujro9C2mC6Gi6W9SN3WRI44WSrrepNFMrsP0GJyeN
	SVJTuPJ/rSqG1y4A201IxcghIH+j8kq2P4Ln3NcEzmjNmnaBSqG5tLQ/foqRZuczaoX24QWVE1e
	mY43EQOI/STquZbK9sFMrx/xWHCvcQeKjgO+zREFUSntUhIwyTtif
X-Received: by 2002:a05:600c:800e:b0:4bb:7757:fe58 with SMTP id
 5b1f17b1804b1-4bb8881b9d7mr305306125e9.19.1795528210579; Tue, 24 Nov 2026
 05:50:10 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124-v2_20230123_tjmercier_google_com-v6-0-dce12fa03ad6@redhat.com>
 <20261124-v2_20230123_tjmercier_google_com-v6-6-dce12fa03ad6@redhat.com>
In-Reply-To: <20261124-v2_20230123_tjmercier_google_com-v6-6-dce12fa03ad6@redhat.com>
From: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Date: Tue, 24 Nov 2026 14:49:55 +0100
X-Gm-Features: Aa3M54qkPJ8C4GRzLQzCC_QtBShd4rpGnT89RPbtOkkrzzkAiMVQPjTTZfQmmls
Message-ID: <CAJ2a_DeDF+9pbLKS9pcX4Tot4xZZ-K7HydKnDjW6TWC5bvREzQ@mail.gmail.com>
Subject: Re: [PATCH v6 6/7] selinux: Restrict cross-cgroup memcg charging
To: Albert Esteve <aesteve@redhat.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Christian Brauner <brauner@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, =?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>, 
	Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>, 
	Philipp Stanner <phasta@kernel.org>, airlied@gmail.com, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	echanude@redhat.com, mripard@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Nov 2026 at 14:05, Albert Esteve <aesteve@redhat.com> wrote:
>
> The security_current_memcg_charge_task() and
> security_current_memcg_charge_cgroup() hooks allow security modules to
> control which processes may charge or transfer memcg memory to another
> process's cgroup, named by a pidfd, or to an arbitrary cgroup named by
> a cgroupfd, both passed in charge_fd. Without a policy implementation,
> either hook is a no-op and the restriction is not enforced.
>
> On SELinux-managed systems the only limit is CAP_SYS_RESOURCE. A
> domain that holds both dma-heap access (today's only exporter that
> opts-in) and that capability, can charge memory to any cgroup outside
> its own subtree. Since the capability is all-or-nothing, SELinux
> policy cannot express which targets such a domain may charge to.
>
> Implement both selinux_memcg_charge_task() and
> selinux_memcg_charge_cgroup() using avc_has_perm() with a new cgroup
> object class and a new charge_to permission. Both charge_fd flavours
> ultimately charge a cgroup, so one permission covers them and the
> target type keeps the distinction: for the pidfd path the target is
> the referred task's SID, as there is no cgroup object to take a label
> from; for the cgroupfd path it is the cgroup directory's inode SID,
> which comes from the genfscon entry for cgroupfs unless the directory
> is relabeled.
>
> The checks run when the charge target is resolved, before the
> CAP_SYS_RESOURCE baseline is evaluated, and apply to every explicit
> charge_fd target, including the caller's own subtree, so policy needs
> a rule even for self-charging. Policy authors can then grant
> cross-cgroup charging selectively, for example:
>
>   allow allocator_app_t client_app_t:cgroup charge_to;
>   allow allocator_app_t cgroup_t:cgroup charge_to;
>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
>  security/selinux/hooks.c            | 19 +++++++++++++++++++
>  security/selinux/include/classmap.h |  1 +
>  2 files changed, 20 insertions(+)
>
> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> index 6c4c64d6e904..76a714107ae4 100644
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@ -2204,6 +2204,23 @@ static int selinux_capable(const struct cred *cred, struct user_namespace *ns,
>         return cred_has_capability(cred, cap, opts, ns == &init_user_ns);
>  }
>
> +static int selinux_memcg_charge_task(const struct cred *to)
> +{
> +       const struct cred *cred = current_cred();
> +
> +       return avc_has_perm(cred_sid(cred), cred_sid(to),

Small nit:
`cred_sid(current_cred())` could be simplified using `current_sid()`

> +                           SECCLASS_CGROUP, CGROUP__CHARGE_TO, NULL);
> +}
> +
> +static int selinux_memcg_charge_cgroup(const struct file *file)
> +{
> +       const struct cred *cred = current_cred();
> +       struct inode_security_struct *isec = inode_security(file_inode(file));
> +
> +       return avc_has_perm(cred_sid(cred), isec->sid, SECCLASS_CGROUP,
> +                           CGROUP__CHARGE_TO, NULL);
> +}
> +
>  static int selinux_quotactl(int cmds, int type, int id, const struct super_block *sb)
>  {
>         const struct cred *cred = current_cred();
> @@ -7683,6 +7700,8 @@ static struct security_hook_list selinux_hooks[] __ro_after_init = {
>         LSM_HOOK_INIT(capget, selinux_capget),
>         LSM_HOOK_INIT(capset, selinux_capset),
>         LSM_HOOK_INIT(capable, selinux_capable),
> +       LSM_HOOK_INIT(memcg_charge_task, selinux_memcg_charge_task),
> +       LSM_HOOK_INIT(memcg_charge_cgroup, selinux_memcg_charge_cgroup),
>         LSM_HOOK_INIT(quotactl, selinux_quotactl),
>         LSM_HOOK_INIT(quota_on, selinux_quota_on),
>         LSM_HOOK_INIT(syslog, selinux_syslog),
> diff --git a/security/selinux/include/classmap.h b/security/selinux/include/classmap.h
> index 90cb61b16425..1f1f2fc4d35d 100644
> --- a/security/selinux/include/classmap.h
> +++ b/security/selinux/include/classmap.h
> @@ -181,6 +181,7 @@ const struct security_class_mapping secclass_map[] = {
>         { "user_namespace", { "create", NULL } },
>         { "memfd_file",
>           { COMMON_FILE_PERMS, "execute_no_trans", "entrypoint", NULL } },
> +       { "cgroup", { "charge_to", NULL } },
>         /* last one */ { NULL, {} }
>  };
>
>
> --
> 2.55.0
>
>
