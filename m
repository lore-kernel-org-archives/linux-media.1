Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1B02DCF61;
	Sat, 30 May 2026 00:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780102001; cv=none; b=HB4vjJ5ssltt7R6JpQdNOKUJsY35uHWOLcIpjYtx/tOft6le0J80sMfcOeT/x8xb3+wc9w0HUBqqvQQgIoXL+9qXn9iVNM0K4fo/PJQ4+Pq4HWiHwJJJpfEhx4hCsC0Lw0UYgjEk2yPPGuRvslusHh9rS/lYtbEaFH//OcQhqKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780102001; c=relaxed/simple;
	bh=hfpTaZvn33+yOPmtHvggD0+5z1rfJM8hHDMan5Q0vEg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AEN02yK6wRy9On8c1s9IJHHqAa9HAvlX2E4THJp6I4xpeOu6d1hdeTto6UvYfcnREB8AsR7uH425bJ2KC8OjqNTGyCKuM+ALzkrGnuchg27c4n2S/iKbOaToEpZ0rUeM4xUM4JNpnYsl7yyFfQC06sG1HoHJbBuTc6w91pIp+Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HrZSw9un; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HrZSw9un"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E46731F00893;
	Sat, 30 May 2026 00:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780102000;
	bh=BbnvkCCISx3ipoou36RCqkeykQw6BK37gvZE7eE5aus=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HrZSw9unuhrvtE4sE9mNsJWzpl3csxd7uC+KKtIR7pQJNTw2UNg/k06H40/15p4o1
	 rwUuHhEDgezY7NnMPNZjOX4sg9w/jFpUSX+5D0oOsxdM1UHC6zcdJYhSwhpukUNjEC
	 hvuXUKVynOn+Xvrbfeq1a5hCJPoKxNuztCYqPmZLF8aibF2cNMuEss1fskMOGHvsQz
	 8KlpGO2o6n4x0JFY5SRMNzMvpEP22K0Oo/ctXNuMaMGEmfYWPiO32LSOokg485Z2QN
	 MvaMfwRSNdEBeJqIZUGkmQYr+Rk/yy/vO68t+rTyh/KI7mRLZPrFw2ZFaYNeK4mjW9
	 PpCbifpR1W0xQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 10/15] media: qcom: Switch to generic PAS TZ APIs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sumit Garg" <sumit.garg@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260522115936.201208-11-sumit.garg@kernel.org>
References: <20260522115936.201208-11-sumit.garg@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:46:39 +0000
Message-Id: <20260530004639.E46731F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unconditional call to `qcom_scm_mem_protect_video_var()` after rel=
axing probe deferral checks to `qcom_pas_is_available()` leads to a NULL po=
inter dereference on systems using non-SCM PAS backends.
--

commit c279727d5017499db9e28d15aedc68710604c9b9
Author: Sumit Garg <sumit.garg@oss.qualcomm.com>

media: qcom: Switch to generic PAS TZ APIs

This commit updates the Qualcomm media client drivers to use the generic
PAS TZ APIs instead of the SCM-specific ones. This allows supporting
multiple TrustZone implementation backends like OP-TEE in addition to the
QTEE-based SCM PAS service.

> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media=
/platform/qcom/venus/firmware.c
> index 1de7436713ed9..3a38ff985822f 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c

[ ... ]

> @@ -218,7 +219,7 @@ int venus_boot(struct venus_core *core)
>  	int ret;
> =20
>  	if (!IS_ENABLED(CONFIG_QCOM_MDT_LOADER) ||
> -	    (core->use_tz && !qcom_scm_is_available()))
> +	    (core->use_tz && !qcom_pas_is_available()))
>  		return -EPROBE_DEFER;

[Severity: High]
Can this lead to a NULL pointer dereference if SCM is not available?

By switching the availability check from qcom_scm_is_available() to
qcom_pas_is_available(), the driver can now proceed if an alternative PAS
backend (like OP-TEE) is used.

However, if content protection is configured, venus_boot() still calls
qcom_scm_mem_protect_video_var() further down in the function:

venus_boot() {
    ...
    ret =3D qcom_scm_mem_protect_video_var(res->cp_start,
                                         res->cp_size,
                                         res->cp_nonpixel_start,
                                         res->cp_nonpixel_size);
    ...
}

Looking at qcom_scm_mem_protect_video_var() in qcom_scm.c, it
unconditionally accesses the global __scm pointer:

qcom_scm_mem_protect_video_var() {
    ...
    ret =3D qcom_scm_call(__scm->dev, &desc, &res);
    ...
}

If SCM has not probed or is absent on the system, wouldn't __scm be NULL,
causing a crash when qcom_scm_mem_protect_video_var() is called? A similar
pattern also appears to exist in iris_fw_load().

> =20
>  	ret =3D of_property_read_string_index(dev->of_node, "firmware-name", 0,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522115936.2012=
08-1-sumit.garg@kernel.org?part=3D10
