Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AE23246EC;
	Wed, 22 Jul 2026 05:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784699895; cv=none; b=au+8FNaTtGqEVhJmr5In/jAzp2LNU6hoYAm3DPlX2kp+OMN/Q4vVF2ZGKZG2JnbOwmriehHYX3KKim52Wf3DXi96Htg/n0UhjR7wzm4UOoLtXrcQ0E7+0zKBPr3djs+AMXO5+hN3ZzPSzi+lIdTJCbxxdKK3tlR2OoT1wNGC5mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784699895; c=relaxed/simple;
	bh=adi8grqBIzhkw7az9gIfEHWy9EpnyvvILhhYtKjNFIU=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=GiRQPXZo8Igv4pu9xLZqibl/i4vIMoX27ivXTwxgXzDWLEZuJZe7ZRGjOvczPZ9JbW+6bedxo+cH45CHTz0QwnnOzk9cyuZ9J0UoaFffSf7BlgOjuCw9DV/G/SP3jzPs9Q0bsD6Kt8IJip7KggK5fFsoY0F3nxey4hz/xlP0sjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dcj5eCG0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dcj5eCG0"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:25d4:fa24:78d1:31:7a56])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A00FBAE;
	Wed, 22 Jul 2026 07:57:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784699832;
	bh=adi8grqBIzhkw7az9gIfEHWy9EpnyvvILhhYtKjNFIU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=dcj5eCG01CIlY3aTK/bBHjPOu8sJEtbNlskkxk3niXmxwZYLeEEmQLJacabNKAUrA
	 jz5Zzy8NrXOrfIPQilavr5W6+8YhPqVUfY3Sf2emVuuc1rYN0NK0X7cOIQ757kDdzt
	 e/LPDrAb+Kgu1rAEhhPWZyujhA3FLQ4XCRoCRv5Y=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260718200912.16001-2-tarang.raval@siliconsignals.io>
References: <20260718200912.16001-1-tarang.raval@siliconsignals.io> <20260718200912.16001-2-tarang.raval@siliconsignals.io>
Subject: Re: [PATCH v3 01/17] media: i2c: os05b10: Use pm_runtime_get_if_active() when applying controls
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>, Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
To: Tarang Raval <tarang.raval@siliconsignals.io>, mehdi.djait@linux.intel.com, sakari.ailus@linux.intel.com
Date: Wed, 22 Jul 2026 11:28:06 +0530
Message-ID: <178469988693.3005206.5686931440708466537@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Quoting Tarang Raval (2026-07-19 01:38:52)
> os05b10_set_ctrl() currently uses pm_runtime_get_if_in_use() to decide
> whether controls should be applied to hardware.
>=20
> Use pm_runtime_get_if_active() instead so controls are applied whenever
> the device is runtime-active, regardless of the current usage count.

What was your motivation behind this change?

This is a bit wasteful, because this driver unconditionally calls
__v4l2_ctrl_handler_setup() in enable_streams(), along with writing the
whole register table again, without checking if the device was active or
sleeping. So updating some control registers in set_ctrl() seems like doing
double work IMHO.

Thanks,
    Jai

>=20
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> ---
>  drivers/media/i2c/os05b10.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
> index e0453c988e4a..3e0440220c07 100644
> --- a/drivers/media/i2c/os05b10.c
> +++ b/drivers/media/i2c/os05b10.c
> @@ -531,7 +531,7 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
>                         return ret;
>         }
> =20
> -       if (pm_runtime_get_if_in_use(os05b10->dev) =3D=3D 0)
> +       if (!pm_runtime_get_if_active(os05b10->dev))
>                 return 0;
> =20
>         switch (ctrl->id) {
> --=20
> 2.34.1
>=20
>
