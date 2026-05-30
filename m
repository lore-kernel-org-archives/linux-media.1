Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594F818C2C;
	Sat, 30 May 2026 00:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780101998; cv=none; b=uxpE9IjlY4IsmP0KuFjpsKajn0CLGHnObCKUJfzX2Z13JMfDAmbYLdKtdq2IrBi9BeVQ84IrLCAvG6XR3Ih886WAg6McsS7/eJVcgO3HvKiqb/rN2mY0H0or9D6dLarNnXwngPOMEDs0zvS+kZ3T7n50YWXPK+JdLbV5KSSkisg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780101998; c=relaxed/simple;
	bh=uXpSYkywdYt++Gl/5tHHIfj+WBj6l9EVRSXaIF/9DHs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hvKPT7XH4eIaMy5yLsM08+VSmHX3kPYaCIii4nH5EMha3+DZG0i3EhSQfWWGSztyJrcxkSgpt6aDMk0WV/YRn3ozvkpapHyVaiYWDlVGlY2pD7j6cz3zOEvuUper8xWLpynm2Lpssutobrsa0+5awSamuXE+xzNX0cOKTBRdfi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fyi+WdkW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fyi+WdkW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED4D81F00898;
	Sat, 30 May 2026 00:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780101997;
	bh=ePui/27xlli0UoqkxwZUMytsrQ76wYX1ZBCfqyKWkk4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Fyi+WdkWudZON04/MAmIPc0l0axNBkkHLfD9xB2fh021On+pl/ayYn8iEEo42fi8l
	 a+phJa95CL2xt+8ZMVbOFvh6+3vnBamvJwSb8cMtN0cK/7nVAjyrcEZ6xdnKIkcL1y
	 4DsoWJZpPwnWBnufkmNbMZ5kOcp3ca+xuclACC5nEfj/kJAI6Z2oE8m1N5tT6NNtkG
	 RcS0imGlzxFFOaN08UdlPwilirQKoAlzvkaKAWoE7Q26BmWwKb4Glq45RyLFW7NCfM
	 tZRjEETmueiDsnd6yON5AHrdZb7j8ZIfqJbgqVQK88YnzoxX8hJAqEOG8DnTmbiFZo
	 9l+/BuCK81o+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 02/15] firmware: qcom: Add a generic PAS service
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sumit Garg" <sumit.garg@kernel.org>
Cc: linux-media@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260522115936.201208-3-sumit.garg@kernel.org>
References: <20260522115936.201208-3-sumit.garg@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:46:36 +0000
Message-Id: <20260530004636.ED4D81F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] API wrapper functions access the global `ops_ptr` without `READ_ON=
CE()` or memory barriers, leading to potential double-fetch NULL pointer de=
references.
- [High] Racy check-then-set registration of `ops_ptr` allows concurrent re=
gistrations to overwrite each other and introduces a TOCTOU panic in the er=
ror path.
- [High] Missing module reference counting for the backend PAS provider all=
ows it to be unloaded while actively executing callbacks, leading to Use-Af=
ter-Free crashes.
- [Medium] API wrappers unconditionally invoke backend callbacks without ve=
rifying they are implemented.
- [Medium] Unbinding the PAS backend while client drivers hold active conte=
xts causes silent metadata resource leaks.
- [Medium] `qcom_pas_ops_register` returns `void`, failing to communicate r=
egistration failures to the caller.
--

commit fbd66283be80c4a4f3882b0762f8f95d31e370dd
Author: Sumit Garg <sumit.garg@oss.qualcomm.com>

firmware: qcom: Add a generic PAS service

This commit adds a generic Peripheral Authentication Service (PAS) interfac=
e.
It acts as a common layer for TZ backends, supporting both legacy SCM calls
and newer TEE bus based PAS implementations.

> diff --git a/drivers/firmware/qcom/qcom_pas.c b/drivers/firmware/qcom/qco=
m_pas.c
> new file mode 100644
> index 0000000000000..bc6c42f2b3c61
> --- /dev/null
> +++ b/drivers/firmware/qcom/qcom_pas.c
[ ... ]
> +int qcom_pas_init_image(u32 pas_id, const void *metadata, size_t size,
> +			struct qcom_pas_context *ctx)
> +{
> +	if (!ops_ptr)
> +		return -ENODEV;
> +
> +	return ops_ptr->init_image(ops_ptr->dev, pas_id, metadata, size, ctx);
> +}

[Severity: High]
Since ops_ptr is a global variable modified locklessly, can the compiler em=
it
multiple loads here?

If ops_ptr is unregistered concurrently between the !ops_ptr check and the
dereference in the return statement, the second load could yield NULL, caus=
ing
a kernel panic. Should this load ops_ptr exactly once into a local variable
using smp_load_acquire() before checking and using it?

[Severity: Medium]
Also, does this function (and the other API wrappers) need to verify that
ops_ptr->init_image is actually implemented before calling it?

If a backend fails to provide an implementation, this would cause a NULL
pointer dereference.

[ ... ]
> +void qcom_pas_metadata_release(struct qcom_pas_context *ctx)
> +{
> +	if (!ops_ptr || !ctx || !ctx->ptr)
> +		return;
> +
> +	ops_ptr->metadata_release(ops_ptr->dev, ctx);
> +}

[Severity: Medium]
If the PAS backend unregisters and sets ops_ptr to NULL while client drivers
still hold active contexts, will this early return permanently leak the
metadata resources (like DMA mappings) since the backend's metadata_release
callback is never executed?

[ ... ]
> +void qcom_pas_ops_register(struct qcom_pas_ops *ops)
> +{
> +	if (!qcom_pas_is_available())
> +		/* Paired with smp_load_acquire() in qcom_pas_is_available() */
> +		smp_store_release(&ops_ptr, ops);
> +	else
> +		pr_err("qcom_pas: ops already registered by %s\n",
> +		       ops_ptr->drv_name);
> +}

[Severity: Medium]
Is there a way for the caller to detect if registration failed since this
function returns void? A backend driver might incorrectly assume it has
successfully initialized if another driver is already registered.

[Severity: High]
Without a lock, could multiple drivers register concurrently, all observe
a NULL ops_ptr, and overwrite each other?

Additionally, in the else branch, if ops_ptr is cleared by a concurrent
unregistration immediately before the read of ops_ptr->drv_name, could
this cause a NULL pointer dereference?

> diff --git a/drivers/firmware/qcom/qcom_pas.h b/drivers/firmware/qcom/qco=
m_pas.h
> new file mode 100644
> index 0000000000000..8643e2760602e
> --- /dev/null
> +++ b/drivers/firmware/qcom/qcom_pas.h
[ ... ]
> +struct qcom_pas_ops {
> +	const char *drv_name;
> +	struct device *dev;

[Severity: High]
Does this structure need a struct module *owner field?

Without module reference counting (using try_module_get() in the wrapper
functions), could the backend module be unloaded while a client thread is
actively executing inside one of these callbacks, leading to a use-after-fr=
ee
crash?

> +	bool (*supported)(struct device *dev, u32 pas_id);
> +	int (*init_image)(struct device *dev, u32 pas_id, const void *metadata,
> +			  size_t size, struct qcom_pas_context *ctx);
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522115936.2012=
08-1-sumit.garg@kernel.org?part=3D2
