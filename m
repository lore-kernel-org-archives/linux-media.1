Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BED3B993F;
	Fri, 26 Jun 2026 10:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782468252; cv=none; b=NqjQNbKZlGL7VrDwhKIGiUBVomKUoJHdGUYjDpur67cOPA/5JSa00crVcuOoMxHgqwaWOR7ZgFbIvLyI1YcH/QHM1v8A8X48JfN+b+cS25bnMRR6vwS56pxWEK+9lgEKg2IDRO1OUMtpaT4Eh2MHyOEeebXZcpS5S4jReYwKz+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782468252; c=relaxed/simple;
	bh=Bdl152pzFf7aWbtoJlbgiblz0+jWiyoHZ5m/pPAcdzA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=kPi50M77cvJPvZUcQ6qCGDKJfgNh3cj2s/kRrS41gFHxm53gydFWPeJfnXCF/FZ3S/KAHAcpkeI7dwCwDjOA3/9EnoWaBUWC6VWcMcsqNhh+EXgl9znK49i59+le7wdkqnk/+4qtb5jor+BsPya5sH4kE87TnYuERDjPILR1AqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AMhWy/Ij; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AMhWy/Ij"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:bcf2:9325:a9bd:32b:e71])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 000551E7;
	Fri, 26 Jun 2026 12:03:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782468208;
	bh=Bdl152pzFf7aWbtoJlbgiblz0+jWiyoHZ5m/pPAcdzA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=AMhWy/Ijnd3/IrcXSSZRs/TtjQgApSC5zA4fxAgkCr9MRsHxcbYctZ+zSIvBGJhac
	 BfeFEaPcatCuPEEMOS/HlTQkUATEmInDSLSOglxU99ryuEr25A5SPpOjWohcvSVRQs
	 tF5RAw1+ixPP0Oy2kw1ZBDFVQI6K53284sAfPuP0=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260625160228.59672-1-tharitt97@gmail.com>
References: <20260625160228.59672-1-tharitt97@gmail.com>
Subject: Re: [PATCH] media: imx219: fix test pattern ordering and add patterns
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Tharit Tangkijwanichakul <tharitt97@gmail.com>
Date: Fri, 26 Jun 2026 15:34:01 +0530
Message-ID: <178246824177.1799417.1678746966574660598@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Tharit,

Thank you for the patch.

Quoting Tharit Tangkijwanichakul (2026-06-25 21:32:28)
> The test pattern menu currently maps 0 to color bars and 1 to a solid
> color, whereas the imx219 datasheet specifies the reverse layout. fix
> the ordering to align with the hardware specification.
>=20

I'm not aware why the order was originally switched for the control menu.
Do you have a strong reason to switch this to the datasheet values?

I ask because this might break what userspace applications expect
(libcamera) and also automated capture tests (that compare md5sums of the
test pattern) in vendor board-farms.

Moreover, given this is a menu control with (correct) string descriptions
for what pattern will be selected, I don't see why the order should
strictly match the sensor register values except that it would be "nice".

Thanks,
    Jai

> Additionally, add 5 missing test patterns to complete the available
> hardware test patterns.
>=20
> The changes were validated on a raspberry pi 5 with an imx219 sensor
> using v4l2-ctl and rpicam-still.
>=20
> Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
> ---
>  drivers/media/i2c/imx219.c | 31 +++++++++++++++++++++++--------
>  1 file changed, 23 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 223d3753c..8f0c04afd 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -110,11 +110,16 @@
> =20
>  /* Test Pattern Control */
>  #define IMX219_REG_TEST_PATTERN                CCI_REG16(0x0600)
> -#define IMX219_TEST_PATTERN_DISABLE    0
> -#define IMX219_TEST_PATTERN_SOLID_COLOR        1
> -#define IMX219_TEST_PATTERN_COLOR_BARS 2
> -#define IMX219_TEST_PATTERN_GREY_COLOR 3
> -#define IMX219_TEST_PATTERN_PN9                4
> +#define IMX219_TEST_PATTERN_DISABLE                    0
> +#define IMX219_TEST_PATTERN_SOLID_COLOR                        1
> +#define IMX219_TEST_PATTERN_COLOR_BARS                 2
> +#define IMX219_TEST_PATTERN_GREY_COLOR                 3
> +#define IMX219_TEST_PATTERN_PN9                                4
> +#define IMX219_TEST_PATTERN_16SPLIT_COLOR_BARS         5
> +#define IMX219_TEST_PATTERN_16SPLIT_INV_COLOR_BARS     6
> +#define IMX219_TEST_PATTERN_COLUMN_COUNTER             7
> +#define IMX219_TEST_PATTERN_INV_COLUMN_COUNTER         8
> +#define IMX219_TEST_PATTERN_PN31                       9
> =20
>  /* Test pattern colour components */
>  #define IMX219_REG_TESTP_RED           CCI_REG16(0x0602)
> @@ -235,18 +240,28 @@ static const s64 imx219_link_freq_4lane_menu[] =3D {
> =20
>  static const char * const imx219_test_pattern_menu[] =3D {
>         "Disabled",
> -       "Color Bars",
>         "Solid Color",
> +       "Color Bars",
>         "Grey Color Bars",
> -       "PN9"
> +       "PN9",
> +       "16 Split Color Bars",
> +       "16 Split Inverted Color Bars",
> +       "Column Counter",
> +       "Inverted Column Counter",
> +       "PN31"
>  };
> =20
>  static const int imx219_test_pattern_val[] =3D {
>         IMX219_TEST_PATTERN_DISABLE,
> -       IMX219_TEST_PATTERN_COLOR_BARS,
>         IMX219_TEST_PATTERN_SOLID_COLOR,
> +       IMX219_TEST_PATTERN_COLOR_BARS,
>         IMX219_TEST_PATTERN_GREY_COLOR,
>         IMX219_TEST_PATTERN_PN9,
> +       IMX219_TEST_PATTERN_16SPLIT_COLOR_BARS,
> +       IMX219_TEST_PATTERN_16SPLIT_INV_COLOR_BARS,
> +       IMX219_TEST_PATTERN_COLUMN_COUNTER,
> +       IMX219_TEST_PATTERN_INV_COLUMN_COUNTER,
> +       IMX219_TEST_PATTERN_PN31
>  };
> =20
>  /* regulator supplies */
>=20
> base-commit: 06cb687a5132fcffe624c0070576ab852ac6b568
> --=20
> 2.53.0
>=20
>
