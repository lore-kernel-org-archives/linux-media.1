Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99A029ACC0;
	Mon, 16 Feb 2026 14:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771253881; cv=none; b=ArTyYLIPWurQJzAf2J0dfHjPd9h/d7IU5bUBqupwDWqWv1XAZ2h5kDChHZPUP/jdYTPBNRBOZ9zPDUxwpAK6i6Z6tVk/hzFwk5f5GkM7baK+WH2i+AfTizbE1ji71dR4Og4QZSFit1WMe6XTbzEbeAvistOqfEbAojKWmS8SqXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771253881; c=relaxed/simple;
	bh=X1a2cCSom1+ulz/HMZfXCrVmTPMroOXbf4RDfwHZoeQ=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=A/XIgzBNOs8rKU5IB6V0D1ZlQYDgNC6AinhQ3SHY8LkEtCsAteSF4tX9JloisqGhHfTohr1MV6ZM+yZ7wE817iv37svBD424cyyyEKUa+KKvXbpBuDmQo1p5+uzAvJKKEwztM4XVLpAePnstTzmsFHMHqxui/4PI3iOg84eOsv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DrwcVCUG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DrwcVCUG"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:6452:b7eb:ea26:c129:40a5])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0B4FF4B3;
	Mon, 16 Feb 2026 15:57:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771253827;
	bh=X1a2cCSom1+ulz/HMZfXCrVmTPMroOXbf4RDfwHZoeQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=DrwcVCUG17YdOcZNouP4tQPiZTf4LgUjaWx2BnwVzHek+mv8pzsYJV73mnMPlS5pO
	 nREIDDROLwvvilY78lfkEDoWUbITb5QxWTpbzwlu+L3iakmF3g91zyPj7bKLk2VfQ3
	 tFyeJL7tO60rm6T9UrQnoa5uVzyB0EEXY6CPjTgo=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260213-mainline-imx283-v2-v2-12-be40a3770ebf@ideasonboard.com>
References: <20260213-mainline-imx283-v2-v2-0-be40a3770ebf@ideasonboard.com> <20260213-mainline-imx283-v2-v2-12-be40a3770ebf@ideasonboard.com>
Subject: Re: [PATCH v2 12/25] media: i2c: imx283: Simplify v_pos determination
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Hans Verkuil <hverkuil@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Umang Jain <uajain@igalia.com>
Date: Mon, 16 Feb 2026 20:27:53 +0530
Message-ID: <177125387316.14753.14833941718591264452@freya>
User-Agent: alot/0.13.dev20+g31692a239

Quoting Kieran Bingham (2026-02-13 19:31:51)
> Refactor the v_pos to separate out the vflip handling from the top
> coordinate.
>=20
> No functional change is intended in this commit.
>=20
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  drivers/media/i2c/imx283.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
> index f115a6df7b31..315c050c4fd0 100644
> --- a/drivers/media/i2c/imx283.c
> +++ b/drivers/media/i2c/imx283.c
> @@ -1143,16 +1143,18 @@ static int imx283_start_streaming(struct imx283 *=
imx283,
>         {
>                 u32 y_out_size =3D mode->crop.height / mode->vbin_ratio;
>                 u32 write_v_size =3D y_out_size + mode->scan->vertical_ob;
> +               s16 top =3D mode->crop.top;
>                 u32 v_widcut;
>                 s32 v_pos;
> =20
> +               if (imx283->vflip->val)
> +                       top =3D -top;
> +
>                 /*
>                  * cropping start position =3D (VWINPOS =E2=80=93 Vst) =
=C3=97 2
>                  * cropping width =3D Veff =E2=80=93 (VWIDCUT =E2=80=93 V=
ct) =C3=97 2
>                  */
> -               v_pos =3D imx283->vflip->val ?
> -                       ((-mode->crop.top / mode->vbin_ratio) / 2) + mode=
->scan->vst :
> -                       ((mode->crop.top / mode->vbin_ratio) / 2)  + mode=
->scan->vst;
> +               v_pos =3D (top / mode->vbin_ratio / 2) + mode->scan->vst;

nit: I find `((top / mode->vbin_ratio) / 2)` easier to read

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

>                 v_widcut =3D ((mode->scan->veff - y_out_size) / 2) + mode=
->scan->vct;
> =20
>                 cci_write(imx283->cci, IMX283_REG_Y_OUT_SIZE, y_out_size,=
 &ret);
>=20
> --=20
> 2.52.0
>
