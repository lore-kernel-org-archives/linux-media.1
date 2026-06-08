Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D9A3947AE
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 08:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780907296; cv=none; b=USk23tLY/A6iBNcir2AxUHgtoNjyVGzbf6Itdh3Z9MHXL7HVYFuTQUNLnb1rXCeTY0t42cucbjJHcs4KA4mtGh/5XetWjuJmk9UcLi0rZMmhxuHdoUrXyq8YckKKN7W64uK/FOX+eBrWvEcT3Wsj0y4D8gJbp+JbfEMZmna2ZPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780907296; c=relaxed/simple;
	bh=FDjSmOq2fFI131aYmLiYmRSg3rFaBE8/C9KclaLDDPk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KZT7TzQgM+9FWXofdZMmsYL0UPGMeBTjxrH+inENwP8UqyjJur9DqB51SS35HkxK6RKolkaC0r7E/2ll8Cr5g0u4fMd65TyuUc4ZQ231NxWqLxaxnB4VXZFOjFTQUBalpw2dZwTsJKo/PFSnaKti/f5C69R8k2O2JJwACWsfY/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wfph9DHB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wfph9DHB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED1481F00893;
	Mon,  8 Jun 2026 08:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780907292;
	bh=7AYepqIyFkF8j2htW+f7Omw4SIS8d4WQIVkFQpG3S/I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wfph9DHB0LfOGfbTj6X8rMFPeycN/mr9oBeDA27o2jmHSPec/pgka/rQBAsDr56el
	 J6QxBT/ySBCBGUq391RsHtR+d4oaC78rxqmeMwuGA4KHks2QAXEmtZZoMNVbPVxQDt
	 1Nn1atthVPCsFmaWoSataryxwG9FspD7Eq3Eu5Z6HOkha7lA4kvsCLmCbzzoRZd1LQ
	 FfNbMZIQYDqtOzFzVp2OM9YJZmTR1DfMbp6l90BG+jMjrh4OLyZh6Jm1ZWweJ2tmkz
	 reu7U0woM9KX6NY5x4nj7Mjn99K9/biMah8WDB543cK3S9+v+vit9N6pfMnNdHutTI
	 gBd5MRwoTbNJQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] media: qcom: iris: fix runtime PM reference
 leaks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hungyu Lin" <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260608081721.82846-2-dennylin0707@gmail.com>
References: <20260608081721.82846-2-dennylin0707@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 08:28:11 +0000
Message-Id: <20260608082811.ED1481F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] `iris_disable_power_domains()` incorrectly propagates `1` on succes=
s when the device is already suspended.
--

commit 7b8fb44887231870efc4a92ebbb558afa99135b1
Author: Hungyu Lin <dennylin0707@gmail.com>

media: qcom: iris: fix runtime PM reference leaks

This commit uses pm_runtime_resume_and_get() in iris_enable_power_domains()
to prevent reference leaks on failure. It also updates
iris_disable_power_domains() to always call pm_runtime_put_sync() and captu=
re
its result.

> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/=
media/platform/qcom/iris/iris_resources.c
> --- a/drivers/media/platform/qcom/iris/iris_resources.c
> +++ b/drivers/media/platform/qcom/iris/iris_resources.c

[ ... ]

>  int iris_disable_power_domains(struct iris_core *core, struct device *pd=
_dev)
>  {
>  	int ret;
> +	int pm_ret;
> =20
>  	ret =3D iris_opp_set_rate(core->dev, 0);
> -	if (ret)
> -		return ret;
> =20
> -	pm_runtime_put_sync(pd_dev);
> +	pm_ret =3D pm_runtime_put_sync(pd_dev);
> +	if (!ret)
> +		ret =3D pm_ret;
> =20
> -	return 0;
> +	return ret;
>  }

[Severity: Low]
Is it intentional to propagate a positive return value here?

According to the runtime PM API, pm_runtime_put_sync() returns 1 as a succe=
ss
case when the device usage count drops to zero but it is already in the
RPM_SUSPENDED state.

By capturing and returning this value directly from
iris_disable_power_domains(), the function will return 1 instead of 0 on a
successful suspend. While current callers may ignore the return value, futu=
re
callers checking if (ret) could incorrectly treat this normal success case =
as
a failure.

Would it be safer to normalize positive return values to 0?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608081721.8284=
6-1-dennylin0707@gmail.com?part=3D1
