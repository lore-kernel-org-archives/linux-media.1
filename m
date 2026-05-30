Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8881E231835;
	Sat, 30 May 2026 00:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780102000; cv=none; b=F6jwtAT+7kUPrvycl/Gvb8eXWgS0E4F1HGYtKmF0slzkwfBzgYTobWVyNgCz3aHrbZVtgKTnVvo8cnoBO9RlbJqRdHxaacl3T8a2XIqcH4cBCXa+DZ5tUb7u7Za7pzjn9J//ntMm3+uq0XFsdIVDurSJK/n89tUyulV4s+4Cekk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780102000; c=relaxed/simple;
	bh=Psfr/ckPJk8zTQ+R1gsU9wtUd2EiQDz8HHcfCS4bSvU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BLZFwXfqvJ6B6Qh2/dxcXpuBg2AmnBq0h8jm9Jbxiu+AgWSlEL/VafDRlxAOoUt0UbwK8be5xsY4mbO5D4gl0rJqna6+lmUqIBcMyMGworn5SafCAwjKMwWQ9N+BnrHFsmFC0E+XmU6ox7VeMJIjSRpKgpExgTKIru5X96bNa0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EVv+JYYO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EVv+JYYO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 408191F00898;
	Sat, 30 May 2026 00:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780101999;
	bh=Re9A7o/WP/gOrmM2UzeScLbXaI5m/21+pfvpSTOHfOE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EVv+JYYODKaQGG/tampCPIsI5OCvky5tDmaWx5ZFbDPKvIQ/VUxLpW5xDgJOAdFIj
	 Uv9NBM2NQGI9TgnKH04dNGC+DZGl8BUrVGsk1EOQXE7IxbMol5CtasH4cU1EalcWF/
	 w6B2KMcYNY9RlflZ6YrSsCWKK0hH8ynG7QYQ/zFLjqe0DNpMrGk15l5R6DW5s1JMEv
	 w5jO+IW7n2atk1RYkdUHn6DAWSqOet2xIfLOePhioRGrdSCm03Dholl05IjTUS/2DX
	 WE2pbT87IE1S7dGaw9W6ux3XV4Tsf6PnaECzxcH6HTJUsOzl8S/xkB/Tl1cDQY1Tp8
	 ACMUYMXGPxDyg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 06/15] remoteproc: qcom_q6v5_mss: Switch to generic
 PAS TZ APIs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sumit Garg" <sumit.garg@kernel.org>
Cc: robh@kernel.org, linux-media@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260522115936.201208-7-sumit.garg@kernel.org>
References: <20260522115936.201208-7-sumit.garg@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:46:38 +0000
Message-Id: <20260530004639.408191F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Incorrect probe deferral check on PAS instead of SCM leads to pote=
ntial NULL pointer dereferences and infinite probe deferral loops.
- [High] Lockless and unprotected access to the generic PAS backend API can=
 lead to Use-After-Free or TOCTOU races.

Pre-existing issues:
- [High] Missing probe deferral for platforms that require PAS memory setup=
 but do not require memory protection.
- [High] The driver fails to initialize `qproc->need_pas_mem_setup` from th=
e device match data, skipping PAS memory setup entirely on platforms that n=
eed it.
--

commit 1d2ed84159dbf869652e837f7c8e10ba7f8e650b
Author: Sumit Garg <sumit.garg@oss.qualcomm.com>

remoteproc: qcom_q6v5_mss: Switch to generic PAS TZ APIs

Switch qcom_q6v5_mss client driver over to generic PAS TZ APIs. Generic PAS
TZ service allows to support multiple TZ implementation backends like QTEE
based SCM PAS service, OP-TEE based PAS service and any further future TZ
backend service.

> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom=
_q6v5_mss.c
> index ae78f5c7c1b69..96888007faa88 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c

[ ... ]

> @@ -1480,7 +1481,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  	}
> =20
>  	if (qproc->need_pas_mem_setup) {

[Severity: High]
This is a pre-existing issue, but does the driver fail to initialize
qproc->need_pas_mem_setup from the device match data?

In q6v5_probe(), various fields from the desc match data are copied to
the qproc structure, but desc->need_pas_mem_setup is completely omitted.
Since qproc is allocated via devm_rproc_alloc() using kzalloc,
qproc->need_pas_mem_setup will always be evaluated as false here, skipping
the required setup for all platforms that rely on it.

> -		ret =3D qcom_scm_pas_mem_setup(MPSS_PAS_ID, qproc->mpss_phys, qproc->m=
pss_size);
> +		ret =3D qcom_pas_mem_setup(MPSS_PAS_ID, qproc->mpss_phys, qproc->mpss_=
size);

[Severity: High]
Can this lead to a Use-After-Free or TOCTOU race if the PAS backend
module is unregistered concurrently?

Looking at qcom_pas_mem_setup() in drivers/firmware/qcom/qcom_pas.c, it
uses a lockless ops_ptr variable that is checked and dereferenced
sequentially:

int qcom_pas_mem_setup(...)
{
    if (!ops_ptr)
        return -ENODEV;

    return ops_ptr->mem_setup(...);
}

If the PAS backend module is unloaded concurrently, ops_ptr could be
nullified between the check and the dereference, without any device
links or module references preventing it.

>  		if (ret) {
>  			dev_err(qproc->dev,
>  				"setting up mpss memory failed: %d\n", ret);

[ ... ]

> @@ -2077,7 +2078,7 @@ static int q6v5_probe(struct platform_device *pdev)
>  	if (!desc)
>  		return -EINVAL;
> =20
> -	if (desc->need_mem_protection && !qcom_scm_is_available())
> +	if (desc->need_mem_protection && !qcom_pas_is_available())

[Severity: High]
Does changing this check to use qcom_pas_is_available() break the
guarantee that SCM is fully initialized?

The desc->need_mem_protection flag indicates the platform requires
qcom_scm_assign_mem() to configure memory protection, which directly
dereferences the global __scm->dev pointer.

If an alternative PAS backend like OP-TEE registers the PAS service,
q6v5_probe() will proceed even if SCM is absent. When
q6v5_xfer_mem_ownership() later calls qcom_scm_assign_mem(), it would
dereference an uninitialized __scm pointer, leading to a panic.

Conversely, could platforms that require SCM memory protection but lack
a PAS backend be trapped in an infinite -EPROBE_DEFER loop?

[Severity: High]
This isn't a bug introduced by this patch, but is there a missing probe
deferral for platforms that require PAS memory setup but do not require
memory protection?

For platforms where need_pas_mem_setup is true and need_mem_protection
is false (e.g., MSM8937, MSM8940, MSM8953), the driver skips the
deferral check entirely. If the remoteproc is started before the PAS
backend initializes, qcom_pas_mem_setup() will fail with -ENODEV and
prevent the remote processor from starting.

>  		return -EPROBE_DEFER;
> =20
>  	mba_image =3D desc->hexagon_mba_image;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522115936.2012=
08-1-sumit.garg@kernel.org?part=3D6
