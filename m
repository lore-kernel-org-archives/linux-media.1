Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865302E8B81;
	Sat, 30 May 2026 00:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780102003; cv=none; b=Qals25SLyr3XsNckqDlGz+SR8AMPTpuNgshWRO9FBNeOwfvLFhi70ZPAePgNGnuiPE2t4TAkPQUqYpMNDHLQomYIlaTVi9LkbZpIjaIZ9+bqGAmaJrMZMZ2jfirfoLUhjZHS9pcGHf8fmYV9LA+veAL+YNlWYJY5/KCZErcKeWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780102003; c=relaxed/simple;
	bh=FxWXLMC0hgWGI1n/2rhHTofNZkUhMCX0A6uUZLKc2eU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RYR/aOhpk7jwL5r6VboZnFu8vFC55wKT/hfqvur1SJot2cbweYFLRL6CcnJtk8Qplp1vdJQOftDoPwjbp4TTfs8kTmKCxPYgwuL5uiBFw02moopLmclCOOA+cz0ySKrthE3AigVkkmExWPiE0LKcoRQ9SVuhpbVe8ExYpPK6mWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LfRVBaW0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LfRVBaW0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 426441F00898;
	Sat, 30 May 2026 00:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780102001;
	bh=0uknB490YeUqEj5Klxk46OMiLB2YQii7itDUPxra3IA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LfRVBaW0HeGQDW6KMRJuGqkURMSfGy6lSHhoJeYdWrozTispj5UILa4Sfzg3Qcux1
	 B9lAchMyhlJZh1XH38RlKDzri9IG+arJDu+EMqYeA2l5hStHGjIBnVuA+SMkeBp9E4
	 J2D/kJtgSj2FiKZg/DWtkQ+AOtimslB9Je4gTlRztcGXC32m15pL7oUJNJI02/u7kM
	 FgkQHnQ9uhBqfJqwal94WtJqM1SHUzRScH7zHjmKc+T5Biv1wL52vtJngskpJrHS0D
	 bQCBxrc2FZkebVDtJbV5GlzmEKfxsXybDmxfj92I+oEVeiydRhWh/u33L/gNcZufZ1
	 nop6IuN4MCh5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 05/15] remoteproc: qcom_q6v5_pas: Switch over to
 generic PAS TZ APIs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sumit Garg" <sumit.garg@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org
In-Reply-To: <20260522115936.201208-6-sumit.garg@kernel.org>
References: <20260522115936.201208-6-sumit.garg@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:46:40 +0000
Message-Id: <20260530004641.426441F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Replacing `qcom_scm_is_available()` with `qcom_pas_is_available()`=
 breaks probe ordering with the SCM driver, leading to a potential NULL poi=
nter dereference in `qcom_scm_assign_mem()`.
- [High] Lockless access to the global `ops_ptr` combined with missing modu=
le reference counting allows the PAS backend module to be unloaded while in=
 use, leading to a NULL pointer dereference or Use-After-Free.

Pre-existing issues:
- [High] The dtb firmware object requested via request_firmware() is never =
released on the success path of qcom_pas_load().
--

commit 3637c6003564ac65554a8805148bf9af6b138d86
Author: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date:   Fri May 22 11:59:26 2026 +0000

    remoteproc: qcom_q6v5_pas: Switch over to generic PAS TZ APIs
   =20
    Switch qcom_q6v5_pas client driver over to generic PAS TZ APIs. Generic=
 PAS
    TZ service allows to support multiple TZ implementation backends like Q=
TEE
    based SCM PAS service, OP-TEE based PAS service and any further future =
TZ
    backend service.
   =20
    Since qcom_q6v5_pas depends on MDT loader for PAS firmware loading, it
    has to be switched over to generic PAS APIs in this commit to avoid any
    build issues.

> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom=
_q6v5_pas.c
> index da27d1d3c9da6..847249c28c1be 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
[ ... ]
> @@ -228,9 +229,9 @@ static int qcom_pas_load(struct rproc *rproc, const s=
truct firmware *fw)
>  	pas->firmware =3D fw;
> =20
>  	if (pas->lite_pas_id)
> -		qcom_scm_pas_shutdown(pas->lite_pas_id);
> +		qcom_pas_shutdown(pas->lite_pas_id);

[Severity: High]
Can the new generic PAS TZ APIs lead to a use-after-free or null pointer
dereference?

The backend implementation for qcom_pas_shutdown() and other generic APIs
seems to perform a lockless check of a global ops_ptr without any module
reference counting (e.g., try_module_get()) or synchronization.

If a user unloads the PAS backend module concurrently while a remoteproc
operation is in flight, could the pointer become null right after the check,
or the backing code be unmapped from memory?

>  	if (pas->lite_dtb_pas_id)
> -		qcom_scm_pas_shutdown(pas->lite_dtb_pas_id);
> +		qcom_pas_shutdown(pas->lite_dtb_pas_id);
> =20
>  	if (pas->dtb_pas_id) {
>  		ret =3D request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name, p=
as->dev);
> @@ -250,7 +251,7 @@ static int qcom_pas_load(struct rproc *rproc, const s=
truct firmware *fw)
>  	return 0;

[Severity: High]
This is a pre-existing issue, but does this function leak pas->dtb_firmware?

When request_firmware() succeeds for the DTB firmware, this function returns
0 without calling release_firmware(). There doesn't appear to be any
corresponding cleanup for this firmware object elsewhere in the driver's
lifecycle (e.g., in qcom_pas_unprepare() or qcom_pas_stop()).

Could this lead to gradual memory exhaustion every time the remoteproc is
loaded or restarted?

> =20
>  release_dtb_metadata:
> -	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
> +	qcom_pas_metadata_release(pas->dtb_pas_ctx);
>  	release_firmware(pas->dtb_firmware);
> =20
>  	return ret;
[ ... ]
> @@ -746,7 +747,7 @@ static int qcom_pas_probe(struct platform_device *pde=
v)
>  	if (!desc)
>  		return -EINVAL;
> =20
> -	if (!qcom_scm_is_available())
> +	if (!qcom_pas_is_available())

[Severity: High]
Does this change break probe ordering with the SCM driver?

If an alternative PAS backend (such as OP-TEE) probes before the SCM driver,
qcom_pas_probe() will now proceed instead of deferring.

However, for platforms that specify memory region assignments
(region_assign_idx), qcom_pas_assign_memory_region() is still called
during probe, which unconditionally invokes qcom_scm_assign_mem().

Since qcom_scm_assign_mem() dereferences SCM state without initialization
checks, could calling it before the SCM driver has fully probed lead to a n=
ull
pointer dereference?

>  		return -EPROBE_DEFER;
> =20
>  	fw_name =3D desc->firmware_name;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522115936.2012=
08-1-sumit.garg@kernel.org?part=3D5
