Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2FE3264D2;
	Wed,  3 Jun 2026 14:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497983; cv=none; b=FuNIQckw0Clj9PeZinBoOLUQI9TiYX4Yyfwh8adNwfxAKbKp+oJ/++f2BUGaxo2icFmbdc/UJk/ejtna10eQR7fSYng39C2M0GEOAIRCS/cLan5EfAhnRFeO6Uoos/H6H/wilPm0v0Acw1PbkgSsrdypHO2173IzQnmS8j3mqXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497983; c=relaxed/simple;
	bh=SPPA0r2WvpDiNaWyj6C6cEpTzrT04kmn0TzHx6BqQwQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tL5qrLV0DtJjBezliUUiv80+2q6JPaJzi67j6cOGXsSkPeDLbliJFtvV/N5WlA8la95CwKgMEbqu35n7CPegAbmnZTjQuxWlJrbaYNEWQ2nI9HzAiKX3xzsRedBYfrL9zmSuKiw9rMItKIxdki15gvxpfsxZ/bEVvbF5T2IIjl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VOQvswHf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VOQvswHf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5230C1F00893;
	Wed,  3 Jun 2026 14:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780497981;
	bh=QfyYjjkja90cUlQSRabfWVPS7s7VkeBGtd587Y34xqo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VOQvswHfhLVIkdU61qdfhrX9pjKAgjKyZQQ8njphwg3Pcr5Hq0SDH8zLZS/DNEWMc
	 oiIzh748zsR8D4Vq9Am0iNCH+y9aWAP46220NgPuaXbUrOdV3u0+IHkqrqzWAxRXYP
	 fxxy9TB+96jokN70ySu+6Wvd7hNiUyDkcowm/mRzzJFtebEmN+xwg01x2QEctM5a+d
	 9clEnDGOIVnQkNcpy6dVTY+nkIRnj0/Rj/0Wf6N37hDB3o7aSbuC8ApmMY5zryzh36
	 rNIn9PxHI28p+8+PloqsOeBCuoEUoq61A5UayK+VKu++QOV1eNh2Yic1+NaRY8Rd8I
	 1Vm7z5xo4mVlg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 10/12] media: iris: Add platform data for glymur
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260603-glymur-v7-10-afaa55d11fe0@oss.qualcomm.com>
References: <20260603-glymur-v7-10-afaa55d11fe0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 14:46:20 +0000
Message-Id: <20260603144621.5230C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] `iris_glymur_deinit_cb_devs()` unregisters and frees `core->fw=
_dev` but fails to set the pointer to `NULL`, leaving a dangling pointer in=
 the `core` structure.
- [High] The address of a local stack variable (`fw_fid`) is stored in a pe=
rmanent device structure field (`dev->platform_data`), leading to a danglin=
g pointer and Use-After-Free once the initialization function returns.
- [High] Silent cancellation of IOMMU deferred probe leading to improper fa=
llback.
--

commit 22223f505726fa5c0ee432b64a8712aa1e89468b
Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

media: iris: Add platform data for glymur

On glymur platform, the iris core shares most properties with the
iris core on the SM8550 platform. The major difference is that glymur
integrates two codec cores (vcodec0 and vcodec1), while SM8550 has only
one. Add glymur specific platform data, reusing SM8550 definitions
wherever applicable.

> diff --git a/drivers/media/platform/qcom/iris/iris_platform_glymur.c b/dr=
ivers/media/platform/qcom/iris/iris_platform_glymur.c
> new file mode 100644
> index 0000000000000..c42ac99870ede
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_platform_glymur.c
> @@ -0,0 +1,106 @@

[ ... ]

> +int iris_glymur_init_cb_devs(struct iris_core *core)
> +{
> +	u64 dma_mask =3D core->iris_platform_data->dma_mask;
> +	const u32 fw_fid =3D IOMMU_FID_IRIS_FIRMWARE;
> +	struct device *dev;
> +
> +	dev =3D iris_vpu_bus_create_device(core->dev, "iris-firmware", dma_mask=
, &fw_fid);

[Severity: High]
Is it safe to pass the address of a local stack variable to device creation?

Looking at iris_vpu_bus_create_device(), it assigns the passed pointer
directly to dev->platform_data:

iris_vpu_bus_create_device()
    ...
    dev->platform_data =3D (void *)iommu_fid;

Since fw_fid is allocated on the stack in iris_glymur_init_cb_devs(),
accessing dev->platform_data after this function returns might lead to a
use-after-free.

> +	if (IS_ERR(dev))
> +		return PTR_ERR(dev);
> +
> +	if (device_iommu_mapped(dev))
> +		core->fw_dev =3D dev;
> +	else
> +		device_unregister(dev);
> +
> +	return 0;

[Severity: High]
Is it intentional to return success (0) here when the IOMMU mapping fails?

If device_iommu_mapped(dev) is false, the device is unregistered but the
function still returns 0. Without an error being propagated, the firmware
loading logic might incorrectly fall back to using core->dev instead of the
required secure firmware domain. Could this lead to TrustZone load failures=
 or
IOMMU translation faults?

> +}
> +
> +void iris_glymur_deinit_cb_devs(struct iris_core *core)
> +{
> +	if (core->fw_dev)
> +		device_unregister(core->fw_dev);

[Severity: Critical]
Could this unregistration leave a dangling pointer in core->fw_dev?

Since core->fw_dev is not set to NULL after calling device_unregister(),
subsequent initialization attempts might dereference the stale pointer. For
example, if a later call to iris_glymur_init_cb_devs() fails to map the IOM=
MU
and returns 0, core->fw_dev would remain unchanged. The core might then
proceed to iris_fw_load() and pass the stale pointer to
devm_qcom_scm_pas_context_alloc(), causing a use-after-free.

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-glymur-v7-=
0-afaa55d11fe0@oss.qualcomm.com?part=3D10
