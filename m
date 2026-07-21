Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C572368294;
	Tue, 21 Jul 2026 13:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784641113; cv=none; b=Eb8Qk6cEenvwCXJ+7k/Jf5ClFFaMrj8frKvksxK/FGg4IMRZSyZKEeYxGS78/g987IJFc01pshLw+3txhvBr+C9nWH+DjG71lVH6iYmxb60Ab+Tv3+HPglJDmWlNJwfHjUIcXL3L4hFBwgPEHXyoxcnVw+EczF4HFDsp1FCJ/HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784641113; c=relaxed/simple;
	bh=n2R6rRuhuN8yu2y8ICNLxTuG14z+ZR0AEe0cXZNbk98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e2lVt8p8OKnIyK/3o3EwtoyfWp6TOYue9SpuwEjKj/DbuQtoiZJGf/aW8sO0jOPxasBXpSuvtpCihWAyK73YdSLmfm23ZgS2hIfy42hErP08G8vhsmlooN176tiive9947fVWkndNtfBFf0Uyopd4DQeSHsPRsPZRPAPPc0704o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=nTDgUYmp; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="nTDgUYmp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=5vO8DsrbEViiyGukn8P28nsjF0//iyht0d3oo+GCY6I=; b=nTDgUYmpS4pJwaXpRPeoPxDgUb
	YlIAnD19CNIH9UJFw8gfmjKiFKXNJ/AFgYpmkJTk8K61NFMPa64c23RVdRQEYlsVp3YCemZv6HAh8
	Zra8rYG00QZjQQtB5P8LNdbxiJAjFPLak2sBDlbT3GP9kTAVlZbVqVQk4WHiF1V1u7Y8JVXQrqEmh
	iFL8HG5EMj8fm6LB9VxeDHB1O1zMwtZfFjkAjEvCxoCJewFaM2RaFi5i61LZFhcEObJNa3TqlheJZ
	t2ZGG+B3St2Dk4quYFe80WcdWDiLjMA6wpoWh39JNWVz5jhsDUJNGcvZWTYfbFdsAV6KUdRIHQwQe
	QK3/NYOQ==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wmAfz-00020E-23;
	Tue, 21 Jul 2026 15:38:27 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wmAfz-000NuD-0t;
	Tue, 21 Jul 2026 15:38:27 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Richard Leitner <richard.leitner@linux.dev>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Richard Leitner <richard.leitner@linux.dev>
Subject: Re: [PATCH 2/2] media: ov9282: enable single-read I2C transactions
Date: Tue, 21 Jul 2026 15:38:26 +0200
Message-ID: <2422477.ElGaqSPkdT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260721-cci-single-v1-2-8485171e1393@linux.dev>
References:
 <20260721-cci-single-v1-0-8485171e1393@linux.dev>
 <20260721-cci-single-v1-2-8485171e1393@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28067/Tue Jul 21 08:23:56 2026)

Hi Richard,

thanks for addressing this long-standing issue.

Am Dienstag, 21. Juli 2026, 15:25:29 CEST schrieb Richard Leitner:
> Some OV9282 camera modules, such as those from Vision Components, fail
> multi-byte register reads with the default CCI I2C regmap access pattern
> and only work when single-register read transactions are used. This
> results in the driver being unable to probe due to a chip id mismatch.
>=20
> As the driver has no reliable way to identify affected modules enable
> use_single_read for OV9282 unconditionally when creating the CCI regmap.

What about a property in the DT instead? In DT it should be clear if a
Vision Components camera is used.

Best regards,
Alexander

>=20
> Tested on an i.M8MP system with OV9282 modules from Vision Components.
>=20
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  drivers/media/i2c/ov9282.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 5b6f897a74fcd..8267a0a9c6f2d 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -1283,6 +1283,11 @@ static int ov9282_probe(struct i2c_client *client)
>  	struct ov9282 *ov9282;
>  	int ret;
> =20
> +	const struct cci_regmap_config config =3D {
> +		.reg_addr_bits =3D 16,
> +		.use_single_read =3D true,
> +	};
> +
>  	ov9282 =3D devm_kzalloc(&client->dev, sizeof(*ov9282), GFP_KERNEL);
>  	if (!ov9282)
>  		return -ENOMEM;
> @@ -1301,7 +1306,7 @@ static int ov9282_probe(struct i2c_client *client)
>  		return ret;
>  	}
> =20
> -	ov9282->regmap =3D devm_cci_regmap_init_i2c(client, 16);
> +	ov9282->regmap =3D devm_cci_regmap_init_i2c_cfg(client, &config);
>  	if (IS_ERR(ov9282->regmap))
>  		return dev_err_probe(ov9282->dev, PTR_ERR(ov9282->regmap),
>  				     "Failed to init CCI\n");
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


